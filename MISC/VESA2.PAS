{ ���� ���� �� :

{ ********************************************************************* }
{ **********           VESA UNIT BY ROMANOFF V2.5            ********** }
{ ********************************************************************* 

� ����� ॠ��������� ����� �.�. }

(*)
                         ������� ��������

       ����� ����� �।�����砥��� ��� ࠡ��� � ���䨪�� � ��ᮢ᪨�
 ०���� �।�⢠�� BGI (VESA.BGI ���⠢����� ����� � ���㫥� � ����
 .OBJ 䠩�� � �������� ����� � ���㫥�). ��� ࠡ��� ����㯭�  ᫥��-
 �騥  ०���:  320x200x256,  640x400x256,  640x480x256,  800x600x256,
 1024x768x256, 1280x1024x256.
 �஬� �।�� �।��⠢�塞�� ���㫥�  GRAPH  ��  �⠭���⭮� ���⠢-
 �� Turbo Pascal� ����� ����� �������� ࠡ���� � ��誮� �� ���
 �����ন������ ०����. �஬� ⮣� �ᯮ��㥬�  �ࠩ��� SVGA256.BGI
 ������� ���� ������祭 �� �।��� 㢥��祭��  ��⥬����
 ���� � 8x8 �� 8x16 ���ᥫ�� (� ०���� � ��᮪�� ࠧ�襭��� ����
 ���� ᬮ�५�� �祭� ����� � ��� ᫥��⢨�  ��㤭�  �⠫��).
      � ����� ���������뢠���� ᢮� ���� (�����஢���,  �.�. ���
 ����� ������� ��� ��� ���䨪��� ��࠭�).

       ��� ��砫� ࠡ��� � ��ᮢ᪮� ��䨪�� ��� ����室��� �믮�����
 ��楤��� SetVesa. �� ��楤�� �ந������ ���樠������  ��䨪�  �
 ��誨 (�᫨ ����), � ��⥬ ����砥� ����᪨� ०�� 0 � ࠧ�襭���
 320x200. ��� ��������� १�襭�� ����室��� ��ᯮ�짮������ ��楤�-
 ன SetGraphMode, �� ����� Graph, � ����� �� ����⠭�:

                        _320x200x256
                        _640x400x256
                        _640x480x256
                        _800x600x256
                        _1024x768x256
                        _1280x1024x256

 ��� �����襭�� ࠡ��� � ��䨪�� ᫥�� �맢���  ��楤���  VesaDone,
 ����� �ந������ ����⨢����� ��ࠡ��稪� ᮡ�⨩ �� ��誨, �����-
 ⨥ ��䨪� � ����⠭������� ���祭�� �ᯮ��㥬�� ����஢  ���뢠-
 ���. ��� ᢮�� �㦤 �ணࠬ�� ������� �����: 61h � 62h.
       ��� ࠡ��� � ��䨪�� ᫥��� ���짮������ �⠭����묨  ���-
 ��ࠬ� � �㭪�ﬨ �� ����� GRAPH.
       ��� �⬥砫��� ���, ����� ����� ����� ࠡ���� � ��誮�, ���
 ���樠����樨   ���ன   �   �������   ��楤��   InitMouse, ��-
 ��� �஢���� ����稥 � ����� �ࠩ��� ��誨 �  �  ����ᨬ���  ��
 �⮣� ��ᠭ���������� ���祭�� ��६�����  MousePresent.  �஬�  ⮣�
 �� ��楤�� �ந������ ��⠭��� ��ࠡ��稪� ᮡ�⨩ �� ��誨, ���-
 �� ��뢠���� �� ��६�饭�� ��誨 ��� �� ����⨨  ���  ���᪠���
 ������ �� ���. ��ࠡ��稪 ᮡ�⨩ �� ��誨 GetMouseXY, �� ������ ��-
 ����, �ந������ ����ᮢ�� ����� ��誨 � �������� ���祭�� ���-
 ������:  Mx, My - ���न���� ������ ���孥�� 㣫� ��誨����  �����;
 MButtons - ���ﭨ� ������ ��誨. ��祬 �� �� �����  �ࠧ�  ����-
 ���� � ��� ��६���� ��⥬ �� ��।�� � ��楤��� GetMouseXY.
       ��� ࠡ��� � ��誮� �।�ᬮ�७� �� ��᪮�쪮 ��楤�� �����-
 祭�� ������ ����� 㧭��� ����. � ��, ���  ���������  ����  �����
 ����室��� ��ନ஢��� �  �����஬ ���� Image  ࠧ��஬  �� �����
 150x150 � �맢��� ��楤��� NewCursor(PCursor),  ���  PCursor - ����
 ���� � ���� ����஬. �� �����஢���� ����� ᫥��� ���뢠��,
 �� �஧��� ���� ⮫쪮 �㫥��� 梥�. � �����, �����  ����
 � ���㫥� �ᯮ������� 梥� 254 � 255.

�����:
 VesaUnit :
  1.0  ��ࢠ� �����, ��� ��誨, ���� ⮫쪮 ����祭�� ��䨪�, ���ᨩ
       ���� � ᢮� ������.
  2.0  ������ ᫠��� �����প� ��誨 (� ��祩 �訡��).  ��࠭� ���-
       �㧪� ᢮�� �������.
  2.1  ��������� ��楤�� SetMouseBox ��� ������� ������ ��६�饭��
       ��� ��誨, ��ࠢ���� ������� �訡��.
  2.2  � ��楤��� ShowCursor � HideCursor ��������� �஢�ન �� ����-
       稥 ��誨 �����, �⮡� �뫮 ����� ���.
  2.3  ��ࠢ���� �訡�� ��-�� ���ன  ����� ��⠢��  ᫥� � ��砥
       �����६������ ��६�饭�� ����� �  ����ᮢ�� �� ᮡ��� ��
       ���������� ������.
  2.4  ��।���� ������ �뢮�� �����,  ࠭�� �����  ������뢠���
       �� 䮭 �� �ਭ��� AndPut �.�. ��ଠ�쭮  ࠡ�⠫ �᫨ ��  ��-
       �ᮢ�� 255� 梥⮬,  ⥯���  �����  ����� ����  �����梥��
       (�஧��� ���� ⮫쪮 �㫥��� 梥�). ��।����� ��楤��
       ���������� ����� ����஢.
  2.5  ��������� ��楤��� ࠡ��� �  �����ன �  �������  �����᪨�
       ����ᥩ.
  2.6  Append by Victor Shantar 2:5054/2.44@fidonet:
       ���ࠡ�⠭� ��楤��� ࠡ��� � ��让.
       ������ ��楤�� GetMouseXY. � ����������� ����� ���� ��
       ⠩��� InitTimeMouse , DoneTimeMouse.
 Vesa2 :
  1.0  ��������  ��ଠ��� ��ࠡ��稪 ᮡ�⨩ �� ��誨 � �࠭ ⥯���
       㦥 �� �㦭� ��ࠡ��稪 �� ⠩���.

 P.S.  ���� ᥣ� ��㤠 ����� �����, �᫨ � ��� ��������� �������
       ������ ��� ���������, � ���� ����� ���� �� �����:
                                    2:5054/26@FidoNet (Victor Shantar)
(*)


{$F+}
unit vesa2;

{ ******************************************************************** }
{ *****                       ���������                          ***** }
{ ******************************************************************** }
interface

uses
 graph,dos;

const { ����᪨� ०��� }
  _320x200x256 = 0;
  _640x400x256 = 1;
  _640x480x256 = 2;
  _800x600x256 = 3;
  _1024x768x256= 4;
  _1280x1024x256= 5;


Type
  TRGB = record R,G,B: byte; end;
  TDAC = array[0..255] of tRGB;               { ⨯ ���ᨢ� � �����ன }


var
 MousePresent:boolean;                             { � ���� �� ��誠 ? }
 mbuttons:word;                               { ���ﭨ� ������ ��誨 }
 mx,my,moldx,moldy:word;                      { ⥪�騥 ���न���� ���㭠 }

{ ����� ��᪮� ��䨪�, 320/200/256 }
procedure setVesa;

{ ���㡠��� ��ᮢ᪮� ��䨪� }
procedure VESAdone;
{ ****************** ��楤��� ࠡ��� � ��誮� ********************* }

{ ���樠������ ��� }
procedure InitMouse;

{ �������� ��誨� ����� }
procedure showcursor;

{ ������ ��誨� ����� }
procedure hidecursor;

{ ������ ��אַ㣮�쭨� � ���஬ �㤥� ��६������ ��誠 }
procedure SetMouseBox(minx,miny,maxx,maxy:word);

{ ��⠭����� ���� � �㦭�� ������ }
procedure SetMouseXY(x,y:word);

{ ����� ���न���� � ���ﭨ� ������ }
procedure GetMouseXy(var b,x,y:word);

{ ��⠭���� ������ ���� }
procedure NewCursor(Pcursor:pointer);

{ ��⠭���� �⠭���⭮�� ����� }
procedure DefaultCursor;

{ ��⠭���� 梥� }
Procedure SetRGBColor(Color,r,g,b: Byte);

{ ������� ��⠭���� 梥� }
Procedure GetRGBColor(Color: byte; var R,G,B : Byte);

{ ��⠭����� ����� ������� }
Procedure SetPal(var Pal:TDAC);

{ ������ ������� }
Procedure GetPal(var Pal:TDAC);

{ ******************************************************************* }
{ *****                 ���������� ������                       ***** }
{ ******************************************************************* }

implementation

var
 old61:pointer; { ����� ���� �࠭����� ���� ����� ��ࠡ��稪��
                        ���뢠��� }
 pmcursor:pointer;               { 㪠��⥫� �� ��ࠧ ��誨 }
 CursorSizeX,
 CursorSizeY:word;                         { ࠧ���� ��誨���� ����� }
 CursorSize:word;                                    { ࠧ���� ����� }
 mcount:byte;
 mBkBuffer:pointer;
 mbk:array[1..520] of byte;
 old33seg,old33ofs:word;


{ ���������뢠�� �ࠩ��� }
{$L vesa.obj}
procedure vesa; external;

{ ��������뢠�� ���� ( �����஢���� 8x16 }
{$L cyr.obj}
procedure cyr; external;

{ ���������뢠�� ��誨� ����� }
{$L mcursor.obj}
procedure mcursor; external;

procedure SetRGBColor(color,r,g,b: Byte); Assembler;
 asm
  mov dx,3C8h
  mov al,color
  out dx,al
  inc dx
  mov al,r
  out dx,al
  mov al,g
  out dx,al
  mov al,b
  out dx,al
 end;

procedure GetRGBColor(Color:byte; var r,g,b:byte); assembler;
 asm
  mov dx,3C7h
  mov al,color
  out dx,al
  add dx,2
  in al,dx
  les di,r
  stosb
  in al,dx
  les di,g
  stosb
  in al,dx
  les di,b
  stosb
 end;

procedure SetPal;
var
 i:byte;
begin
 for i:=0 to 255 do with pal[i] do SetRGBcolor(i,r,g,b);
end;

procedure GetPal;
var
 i:byte;
begin
 for i:=0 to 255 do with pal[i] do GetRGBcolor(i,r,g,b);
end;

procedure NewCursor(PCursor:Pointer);
begin
 PMCursor:=Pcursor;
 asm
  les di,Pcursor
  mov ax,es:[di]
  mov CursorSizeX,ax
  inc ax
  mov bx,es:[di+2]
  mov CursorSizeY,bx
  inc bx
  mul bx
  mov CursorSize,ax
 end;
end;

procedure DefaultCursor;
begin
 NewCursor(addr(MCursor));
end;

procedure autodetect; far; assembler;
asm
 mov ax,seg mbk
 mov es,ax
 mov di,offset mbk
 mov ax,$4F00
 int $10
 cmp al,$4F
 jnz @1
 or ah,ah
 jnz @1
 xor ax,ax
 jmp @2
@1:
 mov ax,-11
@2:
end;

procedure int61; assembler;
 asm
  push ax
  mov ax,seg cyr
  mov es,ax
  mov ax,offset cyr
  mov bp,ax
  pop ax
  iret
 end;


{ ��㥬 ��誨� ����� � �㦭�� ���� }
procedure showmousecursor(x,y:word);
var
 p:pointer;
begin
getimage(x,y,x+CursorSizeX,y+CursorSizeY,mbkbuffer^); { 墠⠥� 䮭 ��� ��让 }
(* asm
  mov si,offset mbkbuffer
  mov ax,CursorSizeX
  mov ds:[si+260],ax
  mov ax,CursorSizeY
  mov ds:[si+262],ax
  mov cx,CursorSize
  les di,Pmcursor
  add si,4 { �ய�᪠�� ࠧ���� }
  add di,4
@1:
  mov al,es:[di]
  or al,al
  jnz @2
  mov al,ds:[si]
@2:
  mov ds:[si+260],al
  inc si
  inc di
  loop @1
 end;*)
 putimage(x,y,Pmcursor^,8);
{ p:=ptr(seg(mbkbuffer),ofs(mbkbuffer)+260);
 putimage(x,y,p^,normalput);{ �뢮��� ����� }
end;

{ ���祬 ��誨� ����� }
procedure hidemousecursor;
begin
 putimage(moldx,moldy,mbkbuffer^,normalput);
 moldx:=mx;
 moldy:=my;
end;

{ ��楤�� �뢮�� �� ��࠭ ��誨���� ����� }
procedure showcursor;
begin
  if mcount=0 then hidemousecursor;
  showmousecursor(mx,my);
  mcount:=0;
end;

{ ��楤�� ���⠭�� ��誨���� ����� }
procedure hidecursor;
begin
 if mcount=0 then hidemousecursor;
 mcount:=1;
end;

procedure setmousebox; assembler;
 asm
  mov ax,7
  mov cx,minx
  mov dx,maxx
  int $33
  mov ax,8
  mov cx,miny
  mov dx,maxy
  int $33
 end;

procedure setmouseXY;
begin
 asm
  mov ax,4
  mov cx,x
  mov dx,y
  int $33
 end;
 mx:=x; moldx:=x;
 my:=y; moldy:=y;
end;

Procedure GetMouseXY( var b,x,y:word);
begin
  b:=mbuttons;
  x:=mx; y:=my;
end;

{$F+}
procedure GetPosition(Flags,CS,IP,AX,BX,CX,DX,SI,DI,DS,ES,BP : word); interrupt;
begin
 mbuttons:=BX;
 mx:=CX;
 my:=DX;
 if mcount=0 then begin
   if (mx<>moldx) or (my<>moldy) then showcursor;
 end;
 inline ($8B/ $E5/ $5D/ $07/ $1F/ $5F/ $5E/ $5A/ $59/$5B/ $58/ $CB);
end;
{$F-}

procedure initmouse;
var x,y:word;
Begin
  mousepresent:=true;
  mcount:=1;
  defaultcursor;
  moldx:=0;moldy:=0;mx:=1;my:=1;
  setrgbcolor(254,0,0,0);setrgbcolor(255,63,63,63);
  x:=getmaxx; y:=getmaxy;
  asm
    mov ax,4
    mov cx,1
    mov dx,1
    int $33
    mov ax,7
    mov cx,0
    mov dx,x
    int $33
    mov ax,8
    mov cx,0
    mov dx,y
    int $33

    mov ax,seg GetPosition
    mov es,ax
    mov dx,offset GetPosition
    mov ax,14h
    mov cx,31
    int $33
    mov old33seg,es
    mov old33ofs,dx
 end;
End;

{ Vesa Mode:
                    0 - 320/200/256
                    1 - 640/400/256
                    2 - 640/480/256
                    3 - 800/600/256
                    4 - 1024/768/256
 ��⠭���������� �맮��� ��楤��� SetGraphMode  �� ����� Graph }
procedure setVesa;
var
 Driver,Mode:integer;
 a:integer;
begin
 driver:=detect;
 mode:=0;
 initgraph(driver,mode,'');
 a:=graphresult;
 if a<>grOk then
  begin
   writeln(grapherrormsg(a));
   halt;
  end;
 getmem(mbkbuffer,32000);
end;

procedure VESAdone;
begin
 if mousepresent then asm mov ax,old33seg; mov es,ax; mov dx,old33ofs
                          mov ax,20; int $33; end;
 setintvec($61,old61);
 closegraph;
 asm
  mov ax,3
  int $10
 end;
 freemem(mbkbuffer,32000);
end;

var
 drv:integer;
 i:word;
begin
 drv:=installUserDriver('VESA',@autodetect);
 if drv=grError then
  begin
   writeln(#7+'VESA not found');
   halt;
  end;
 if registerBGIdriver(addr(VESA))<0 then
  begin
   writeln(grapherrormsg(graphresult));
   halt;
  end;
 getintvec($61,old61);
 setintvec($61,addr(int61));
end.