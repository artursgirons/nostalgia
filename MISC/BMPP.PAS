{ Program: BVIEW.PAS
  Comments: Dutch
  Description:
  This programm started as a project to recover the overwritten
  headers of my BMP files, but I created a complete BMP-viewer
  around it.
  Note: the BMP viewer doesn't work properly it shows 1 line date,
  1 line nothing, 1 line date, etc.. if you find out what the problem
  is, please mail me :-)
}

{$DEFINE DEBUG}  { niet weghalen tenzij je weet wat je doet }
{$ifdef DEBUG} {$D+,R+,S+,Q+,I+}
{$else} {$R-,S-,Q-,I-,B-} {$endif}

{ Program : Bitmap Show & Repair }
{ Autor   : Dajo Hein }
{ Date    : 12-06-97 }
{ Reason  : Dit programma starte als een project om mijn BMP files
            waarvan ik de Header had overschreven terug te krijgen.
            Maar is een beetje uit de hand gelopen door er een complete
            Bitmap viewer omheen te bouwen.
            mijn BMP files had ik trouwens al binnen 1 uur weer goed. }

Program BMPShowRepair;

Uses Crt, Graph;

Type
  TByteArray = Array[0..50000] of byte; {voor schrijven van Image Data naar scherm }
  ColorTable = record  { Bitmap Color Tabel POS: 36h}
    Blue,              { Blue component }
    Green,             { Green component }
    Red,               { Red component }
    Filler : Byte;     { Reserved Byte? }
  end;
  TBitmapInfoHeader = record         { Bitmap Info Structuur }
    ID       : array[1..2] of char;  { ID='BM' - Bitmap }
    FS       : Longint;              { Filesize of whole file }
    RES      : array[1..4] of char;  { reserved bytes }
    BOF      : LongInt;              { Offset of Bitmap in file }
    IH       : LongInt;              { Length of BitmapInfoHeader }
    HWidth   : LongInt;              { Horizontal Width of bitmap in pixels }
    VWidth   : LongInt;              { Vertical Width of bitmap in pixels }
    planes   : Word;                 { Number of planes }
    BPP      : Word;                 { Bits per pixel (thus the number of colors) }
    RLE      : LongInt;              { Compression Type }
    PS       : LongInt;              { Size of picture in bytes }
    HR       : LongInt;              { Horizontal resolution }
    VR       : LongInt;              { Vertical resolution }
    UC       : LongInt;              { Number of used colors }
    IC       : LongInt;              { Number of important colors }
  end;

Var
  Line : TByteArray;      { voor schrijven van Image Data naar scherm }
  CT  : ColorTable;
  BIH : TBitmapInfoHeader;
  BFile : File;           { Bitmap file }
  Teller : Integer;
  Toets : Char;           { Toets voor uitlezen V/HWidth correctie }
  H, B : LongInt;         { Hoogte, Breedte voor V/HWidth correctie }

Procedure EnterPrompt;
Begin
  Writeln('Press ');
  Readln;
End;

Procedure ReadColorTable(ShowTable, ToPalette:boolean);
{ Inlezen en/of instellen van Color Table }
Begin
  If ShowTable Then Writeln('ColorTable:');
  Reset(BFile,1); { '1' specifies the record size to be used in
                    data transfers. If RecSize is omitted, a default
                    record size of 128 bytes is assumed. (duh) }
  Seek(BFile,Sizeof(BIH)); { Ga naar einde van Bitmap Info Header }
  For Teller:=0 To BIH.UC {Used Colors} Do
  Begin
    BlockRead(BFile,CT,Sizeof(CT));
    If ShowTable Then     { [Begin] Schrijven van Color Table naar Scherm }
    Begin
      If (Teller MOD 22 = 0) and (Teller<>0) then EnterPrompt;
      Writeln('[',Teller:5,']   Blue=',CT.Blue:3,
                            '   Green=',CT.Green:3,
                            '   Red=',CT.Red:3,
                            '   Filler=',CT.Filler:3);
    End;                  { [End] Schrijven van Color Table naar Scherm }
    If ToPalette Then SetRGBPalette(Teller,CT.Red,CT.Green,CT.Blue);
                      { Instellen van RGB waarden van schermkleuren in
                        grafische mode }
  End;
  Close(BFile);
End;

Procedure Repair;
{ Repareren van de kapotte BMP headers }
Type
  { speciale bitmap info header omdat alleen deze waarden weg waren }
  TBitmapHeader1 = record
    ID       : array[1..2] of char; { zie TBitmapHeader voor info }
    FS       : LongInt;
    RES      : array[1..4] of byte;
    BOF      : LongInt;
    IH       : LongInt;
    HWidth   : LongInt;
    VWidth   : LongInt;
  end;
Var
  BMP1 : TBitmapHeader1;
Begin
  Reset(BFile,1);
    BMP1.ID:='BM';
    BMP1.FS:=FileSize(BFile); { Correctie FileSize }
    BMP1.BOF:=BMP1.FS-BIH.PS; { BOF Berekening door Filesize - PictureSize }
    BMP1.IH:=Longint(40);     { Correctie size infoheader }
    BMP1.HWIDTH:=B;           { Correctie HorizontalWidth }
    BMP1.VWIDTH:=H;           { Correctie VerticalWidth }
    BMP1.BOF:=BIH.BOF;        { [Begin] Waarden die nog goed waren }
    BMP1.IH:=BIH.IH;
    BMP1.HWidth:=BIH.HWidth;
    BMP1.VWidth:=BIH.VWidth;  { [End] Waarden die nog goed waren }
    For Teller:=1 to 4 Do BMP1.RES[Teller]:=0; { op 0 stellen van reserved waarden }
  Seek(BFile,0);
  BlockWrite(BFile,BMP1,SizeOf(BMP1));
  Close(BFile);
  Writeln;
  Writeln('creating ID: ',BMP1.ID);
  Writeln('creating FileSize: ',BMP1.FS);
  Writeln('creating Offset of Bitmap: ',BMP1.BOF);
  Writeln('creating Length of InfoHeader: ',BIH.IH);
  Writeln('used HWidth: ',BMP1.HWidth);
  Writeln('used VWidth: ',BMP1.VWidth);
{  BIH.HWidth:=BMP1.HWidth;
  BIH.VWidth:=BMP1.VWidth;}
End;

function IntToStr(I: Longint): String;
{ Convert any integer type to a string }
var
  S: string[11];
begin
  Str(I, S);
  IntToStr := S;
end;

Procedure ShowbData; (* VERBERTERING NODIG *)
{ schrijven van BITMAP naar scherm }
var
  PixelColor : Byte;
  Color: Word;
  Black : Byte;
  I, X, Y, Z, Gd, Gm: Integer;
  Number, BeginX, BeginY, EindY : Integer;
Begin
  With BIH do
  Begin
    Number := HWidth;   { voor uitlezen van blok }
    BeginX := 1;        { beginx kun je nog mee knutselen om het plaatje
                          netjes in het midden van het scherm te krijgen }
    BeginY := HWidth+1;      { de laatste! regel van de bitmap dus }
    EindY  := BeginY-HWidth; { i.v.m Bottom-Up opslag }
  End;
  Assign(BFile,ParamStr(1));
  Reset(BFile,1);
  Seek(BFile,BIH.BOF); { naar de Bitmap Offset zoeken }
  Gd := Detect;        { Grafische mode aan }
  InitGraph(Gd, Gm, 'c:\utility\tp7\bgi');
  if GraphResult <> grOk then
    Halt(1);
  Black := 16; { Moet ook nog op een andere waarde worden ingesteld
                 Als het RGBPalette verandert wordt
                 v.b If Longint(CT)=0 then Black=Teller }
  For Y:=BeginY downto EindY do
  Begin
  { Oh... btw de Bitmap is Bottom-Up opgeslagen vandaar de Downto
    dat met die SHR en AND vind ik best wel vaag staat ook niks
    over in de Help-File en ook niet in ons HBO (kuch) boek }
   BlockRead(BFile, Line, Number, I);
   X := BeginX;
   For Z:=1 to number do
    Begin
      PixelColor := Line[Z];
      If PixelColor shr 4 <> Black then { net zoiets als pixelcolor * 4 alleen dan anders }
       PutPixel(X,Y,PixelColor shr 4);
      Inc(X);
      If PixelColor and 15 <> Black then
       PutPixel(X,Y,PixelColor and 15);
      Inc(X);
      { die putpixel heb ik 2 keer gedaan omdat er dan tenminste nog
        wat van de kleuren klopt maar misschien is dat wel niet nodig }
    End;
  End;
  SetColor(GetMaxColor);  { [Begin] Info Rechthoekje voor repair mode }
  Rectangle(400, 10, 600, 65);
  MoveTo(410, 15);
  OutText('Height     : '+IntToStr(BIH.HWidth));
  MoveTo(410, 25);
  OutText('Width      : '+IntToStr(B));
  MoveTo(410, 35);
  OutText('Size       : '+IntToStr(B*H));
  MoveTo(410, 45);
  OutText('Real Size  : '+IntToStr(BIH.PS));
  MoveTo(410, 55);
  If (B*H>BIH.PS) then OutText('Picture size too big!');
  If (B*H0 Then
  Begin
    Writeln('File not found');
    Close(BFile);
    Halt(0); { Schrijf "Sukkel!!!" ;) }
  End;
  BlockRead(BFile,BIH,Sizeof(Bih));
  Close(BFile);
End;

Procedure ShowHeaderInfo;
{ naar scherm schrijven van de Bitmap Info Header }
Begin
  With BIH Do
  Begin
    Writeln('BitmapFileHeader:');
    Writeln('  ID                         ',ID);
    Writeln('  FileSize of whole file     ',FS);
    Writeln('  Reserved bytes             ',RES);
    Writeln('  Offset of Bitmap in file   ',BOF);
    Writeln;
    Writeln('BitmapInfoHeader:');
    Write  ('  Length of InfoHeader:      ',IH);
    Case IH of
      12 : Writeln(' - OS/2 1.x format');
      40 : Writeln(' - Windows 3.x format');
      64 : Writeln(' - OS/2 2.x format');
    end;
    Writeln('  Hwidth of bitmap           ',HWidth);
    Writeln('  Vwidth of bitmap           ',VWidth);
    Writeln('  Number of planes           ',planes);
    Writeln('  Bits per pixel             ',BPP);
    Write  ('  Compression                ',RLE);
    Case RLE of
      0 :  writeln(' - none');
      4 :  writeln(' - RLE 4-bit/pixel');
      8 :  writeln(' - RLE 8-bit/pixel');
    end;
    Writeln('  Picture Size               ',PS);
    Writeln('  Horizontal resolution      ',HR);
    Writeln('  Vertical resolution        ',VR);
    Writeln('  Number of used colors      ',UC);
    Writeln('  Number of important colors ',IC);
    Writeln;
    Enterprompt;
  End;
End;

Procedure Intro;
Begin
  ClrScr;
  Writeln('Bitmap data lister & viewer by Thehack (1997)');
  Writeln;
  If ParamCount=0 then StopInfo;
  If (Copy(ParamStr(1),1,1)='?') or (Copy(ParamStr(1),2,1)='?') then StopInfo;
End;

Begin
  Intro;
  Assign(BFile,ParamStr(1));  { dah BMP file... }
  ReadHeader;                 { Lees Bitmap Header Info uit }
  ShowHeaderInfo;             { Schrijf Bitmap Header Info naar scherm }
  ReadColorTable(True,False); { Lees Color Table en schrijf waarden naar scherm }
  H:=BIH.HWIDTH;              { voor correctie Horizontal Width }
  B:=BIH.VWIDTH;              { voor correctie Vertical Width }
  ShowbData;                  { Schrijf Bitmap naar scherm }
  Readln;
  If ParamStr(2)='/R' then
  Begin
    Repair;
    Repeat  { [Begin] bitmap herstelling lus zonder beveiliging }
      Toets:=Readkey;
      If Toets=#0 then
      Begin
        Toets:=Readkey;
        If Toets=#75 then Dec(B); { Links kleinere breedte }
        If Toets=#77 then Inc(B); { Rechts grotere breedte }
        If Toets=#72 then Inc(H); { Omhoog grotere hoogte  }
        If Toets=#80 then Dec(H); { Down kleinere hoogte   }
        Repair;     { schrijf nieuwe header naar BMP file }
        ShowbData;  { schrijf bitmap naar scherm }
      End;
    Until Toets=#27; { [End] bitmap herstelling lus zonder beveiliging }
  End;
  CloseGraph;
  ClrScr;
End.

