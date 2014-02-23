{X,Y - screen coordinates, if x <0 bmp file will be centered on the screen}
Unit BMP_WIEW;
Interface
uses dos,graph,vesa2;
procedure Load_BMP(X,Y:integer;file_name : pathstr);
Implementation
var erro : integer;
Procedure SetAllPal16(var pal ;cor,n:integer);assembler;
 asm
  mov AH,$10
  mov AL,$12
  mov BX,cor
  mov CX,n
  les DX,pal
  int $10
 end;
{======================================}
procedure Load_BMP(X,Y:integer;file_name : pathstr);
 VAR
   header : array [1..27] of word;
   rgb_struct : array[0..255] of record
                                  b,g,r,cor : byte;
                                 end;
   rgb_triple : array[0..255] of record
                                  b,g,r : byte;
                                 end absolute rgb_struct;
   pal : array[0..255] of record
                            red,green,blue : byte;
                           end;
      F : File;
    i,j : integer;
  locer : integer;
   Xp,Yp,lido,larg,larg1,alt,cores,bufsize,desloc,reloc,grupo :
word;
    buf : array[1..10000] of byte;
    pic_point_1,pic_point_2 : byte;
    sign : array[1..2] of char absolute header;
    maxX,maxY : word;
  Begin
   maxX := GetmaxX;
   maxY := GetMaxY;
   assign(f,file_name);
   {$I-}
   reset(f,1);
   {$I+}
   erro := IoResult;
   if erro<>0 THEN exit;
   {$I-}
   blockread(f,header,18,lido);
   erro := IoResult;
   if erro = 0 then
    if sign<>'BM' THEN
       erro := -100;
   IF erro = 0 THEN
    BEGIN
     desloc := header[8]-4;
     if desloc >36 then desloc := 36;
     blockread(f,header[10],desloc,lido);
     erro := IoResult;
    END;
   if erro = 0 THEN
    begin
     reloc := ord(desloc<>8);
     larg := header[10];
     alt := header[11+reloc];
     cores := 1 shl header[13+2*reloc];
     if (alt > maxY) OR (larg>maxX) then
        erro := -101;
    end;
   If erro = 0 THEN
    BEGIN
     if (X<0) OR (Y<0) THEN
       Begin
        X := (maxX-larg) DIV 2;
        Y := (maxY-alt) DIV 2;
       End;
     blockread(f,rgb_struct,header[6]-18-desloc,lido);
     erro := IoResult;
    END;
    IF erro = 0 THEN
     BEGIN
         if cores = 16 THEN
          begin
           larg1 := 8*(larg DIV 8) + 8*ord(larg MOD 8<>0);
           LARG1 := LARG1 div 2;
          end
         else
          begin
           larg1 := 4*(larg DIV 4) + 4*ord(larg MOD 4<>0);
          end;
         if reloc = 1 THEN
          for i := 0 to cores-1 do
           Begin
            pal[i].red := rgb_struct[i].r DIV 4;
            pal[i].green := rgb_struct[i].g DIV 4;
            pal[i].blue := rgb_struct[i].b DIV 4  ;
           end
         else
          for i := 0 to cores-1 do
           Begin
            pal[i].red := rgb_triple[i].r DIV 4;
            pal[i].green := rgb_triple[i].g DIV 4;
            pal[i].blue := rgb_triple[i].b DIV 4  ;
           end;
         setallpal16(Pal,0,cores);
         bufsize := larg1*(10000 DIV larg1);
         lido := bufsize;
         While (lido=bufsize) AND (erro=0) do
          begin
           blockread(f,buf,bufsize,lido);
           erro := IoResult;
           if erro= 0 Then
            IF Cores = 16 THEN
             For j := 1 to lido DIV larg1 do
              For i:=0 to larg-1 do
               Begin
                XP := X+i;
                YP := Y+alt-j;
                pic_point_1 := buf[(j-1)*larg1+ 1 + i DIV 2];
                pic_point_2:=(pic_point_1 SHR 4)*((i+1) MOD 2) +
                 (pic_point_1 AND 15)*((i+2) MOD 2) ;
                putpixel(XP,YP,pic_point_2)
              End
            ELSE
             For j := 1 to lido DIV larg1 do
              For i:=1 to larg do
               Begin
                XP := X+(i-1);
                YP := Y+alt-j;
                pic_point_1 := buf[(j-1)*larg1+i];
                putpixel(XP,YP,pic_point_1);
               end;
           Y := Y - lido DIV larg1;
         end; { while }
    END; { erro = 0 }
    close(f);
    {$I+}
    locer := Ioresult;
    If erro = 0 THEN erro := locer;
 END;
begin
end.


