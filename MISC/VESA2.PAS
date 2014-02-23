{ Идея взята от :

{ ********************************************************************* }
{ **********           VESA UNIT BY ROMANOFF V2.5            ********** }
{ ********************************************************************* 

И вновь реализованна Шантар В.В. }

(*)
                         КРАТКОЕ ОПИСАНИЕ

       Данный модуль предназначается для работы с гарфикой в весовских
 режимах средствами BGI (VESA.BGI поставляется вместе с модулем в виде
 .OBJ файла и линкуется вместе с модулем). Для работы доступны  следу-
 ющие  режимы:  320x200x256,  640x400x256,  640x480x256,  800x600x256,
 1024x768x256, 1280x1024x256.
 Кроме средств предоставляемых модулем  GRAPH  из  стандартной постав-
 ки Turbo Pascalя данный модуль позволяет работать с мышкой во всех
 поддерживаемых режимах. Кроме того используемый  драйвер SVGA256.BGI
 немного мною подпатчен на предмет увеличения  системного
 шрифта с 8x8 до 8x16 пикселов (в режимах с высоким разрешением старый
 шрифт смотрелся очень мелко и как следствие  трудно  читался).
      К модулю подлинковывается свой шрифт (русифицированый,  т.е. вам
 можно обойтись без услуг русификатора экрана).

       Для начала работы с весовской графикой вам необходимо выполнить
 процедуру SetVesa. Эта процедура производит инициализацию  графики  и
 мышки (если есть), а затем включает графический режим 0 с разрешением
 320x200. Для изменения резрешения необходимо воспользоваться процеду-
 рой SetGraphMode, из модуля Graph, с одной из констант:

                        _320x200x256
                        _640x400x256
                        _640x480x256
                        _800x600x256
                        _1024x768x256
                        _1280x1024x256

 Для завершения работы с графикой следуе вызвать  процедуру  VesaDone,
 которая производит деактивизацию обработчика событий от мышки, закры-
 тие графики и восстановления значений используемых векторов  прерыва-
 ний. Для своих нужд программа изменяет вектора: 61h и 62h.
       Для работы с графикой следует пользоваться стандартными  проце-
 дурами и функциями из модуля GRAPH.
       Как отмечалось выше, данный модуль может работать с мышкой, для
 инициализации   которой   в   существует   процедура   InitMouse, ко-
 торая проверяет наличие в памяти драйвера мышки и  в  зависимости  от
 этого утсанавливается значение переменной  MousePresent.  Кроме  того
 эта процедура производит устанвку обработчика событий от мышки, кото-
 рый вызывается при перемещении мышки или при нажатии  или  отпускании
 кнопок на ней. Обработчик событий от мышки GetMouseXY, при каждом вы-
 зове, производит перерисовку курсора мышки и заполняет значения пере-
 менных:  Mx, My - координаты левого верхнего угла мышкиного  курсора;
 MButtons - состояние кнопок мышки. Причем все это можно  сразу  поме-
 стить в ваши переменные путем их передачи в процедуру GetMouseXY.
       Для работы с мышкой предусмотрено еще несколько процедур назна-
 чение которых можно узнать ниже. И еще, для  изменения  вида  курсора
 необходимо сформировать в  некотором буфере Image  размером  не более
 150x150 и вызвать процедуру NewCursor(PCursor),  где  PCursor - адрес
 буфера с новым курсором. При проэктировании курсора следует учитывать,
 что прозрачным является только нулевой цвет. В курсоре, который  идет
 с модулем используются цвета 254 и 255.

История:
 VesaUnit :
  1.0  Первая версия, нет мышки, есть только включение графики, руссий
       шрифт и своя палитра.
  2.0  Появилась слабая поддержка мышки (с кучей ошибок).  Убрана заг-
       рузка своей палитры.
  2.1  Добавлена процедура SetMouseBox для задания области перемещения
       для мышки, исправлены некоторые ошибки.
  2.2  В процедуры ShowCursor и HideCursor добавлены проверки на нали-
       чие мышки вообще, чтобы было меньше глюков.
  2.3  Исправлена ошибка из-за которой  курсор оставлял  след в случае
       одновременного перемещения курсора и  перерисовки по событию от
       нажимаемой клавиши.
  2.4  Переделан алгоритм вывода курсора,  раньше курсор  накладывался
       на фон по принцыпу AndPut т.е. нормально  работал если был  на-
       рисован 255ым цветом,  теперь  курсор  может быть  многоцветным
       (прозрачным является только нулевой цвет). Переделана процедура
       добавления новых курсоров.
  2.5  Добавлены процедуры работы с  палитрой и  ведение  исторических
       записей.
  2.6  Append by Victor Shantar 2:5054/2.44@fidonet:
       Переработаны процедуры работы с мышой.
       Появилась процедура GetMouseXY. И возможность вешать мышу на
       таймер InitTimeMouse , DoneTimeMouse.
 Vesa2 :
  1.0  Добавлен  нормальный обработчик событий от мышки и убран теперь
       уже не нужный обработчик на таймере.

 P.S.  Автор сего труда Виктор Шантар, если у вас возникнут некоторые
       вопросы или пожелания, то меня можно найти по адресу:
                                    2:5054/26@FidoNet (Victor Shantar)
(*)


{$F+}
unit vesa2;

{ ******************************************************************** }
{ *****                       ИНТЕРФЕЙС                          ***** }
{ ******************************************************************** }
interface

uses
 graph,dos;

const { графические режимы }
  _320x200x256 = 0;
  _640x400x256 = 1;
  _640x480x256 = 2;
  _800x600x256 = 3;
  _1024x768x256= 4;
  _1280x1024x256= 5;


Type
  TRGB = record R,G,B: byte; end;
  TDAC = array[0..255] of tRGB;               { тип массива с палитрой }


var
 MousePresent:boolean;                             { а есть ли мышка ? }
 mbuttons:word;                               { состояния кнопок мышки }
 mx,my,moldx,moldy:word;                      { текущие координаты грызуна }

{ Запуск веской графики, 320/200/256 }
procedure setVesa;

{ вырубание весовской графики }
procedure VESAdone;
{ ****************** процедуры работы с мышкой ********************* }

{ инициализация мыши }
procedure InitMouse;

{ показать мышкин курсор }
procedure showcursor;

{ спрятать мышкин курсор }
procedure hidecursor;

{ задать прямоугольник в котором будет перемещаться мышка }
procedure SetMouseBox(minx,miny,maxx,maxy:word);

{ установить мышку в нужную позицию }
procedure SetMouseXY(x,y:word);

{ Считать координаты и состояние кнопок }
procedure GetMouseXy(var b,x,y:word);

{ установка нового крсора }
procedure NewCursor(Pcursor:pointer);

{ установка стандартного курсора }
procedure DefaultCursor;

{ Установка цвета }
Procedure SetRGBColor(Color,r,g,b: Byte);

{ получить установки цвета }
Procedure GetRGBColor(Color: byte; var R,G,B : Byte);

{ установить новую палитру }
Procedure SetPal(var Pal:TDAC);

{ прочитать палитру }
Procedure GetPal(var Pal:TDAC);

{ ******************************************************************* }
{ *****                 РЕАЛИЗАЦИЯ МОДУЛЯ                       ***** }
{ ******************************************************************* }

implementation

var
 old61:pointer; { здесь будут храниться адреса старых обработчиков
                        прерываний }
 pmcursor:pointer;               { указатель на образ мышки }
 CursorSizeX,
 CursorSizeY:word;                         { размеры мышкиного курсора }
 CursorSize:word;                                    { размеры курсора }
 mcount:byte;
 mBkBuffer:pointer;
 mbk:array[1..520] of byte;
 old33seg,old33ofs:word;


{ подлинковываем драйвер }
{$L vesa.obj}
procedure vesa; external;

{ полинковываем шрифт ( русифицированный 8x16 }
{$L cyr.obj}
procedure cyr; external;

{ подлинковываем мышкин курсор }
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


{ рисуем мышкин курсор в нужном месте }
procedure showmousecursor(x,y:word);
var
 p:pointer;
begin
getimage(x,y,x+CursorSizeX,y+CursorSizeY,mbkbuffer^); { хватаем фон под мышой }
(* asm
  mov si,offset mbkbuffer
  mov ax,CursorSizeX
  mov ds:[si+260],ax
  mov ax,CursorSizeY
  mov ds:[si+262],ax
  mov cx,CursorSize
  les di,Pmcursor
  add si,4 { пропускаем размеры }
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
 putimage(x,y,p^,normalput);{ выводим курсор }
end;

{ прячем мышкин курсор }
procedure hidemousecursor;
begin
 putimage(moldx,moldy,mbkbuffer^,normalput);
 moldx:=mx;
 moldy:=my;
end;

{ процедура вывода на экран мышкиного курсора }
procedure showcursor;
begin
  if mcount=0 then hidemousecursor;
  showmousecursor(mx,my);
  mcount:=0;
end;

{ процедура прятания мышкиного курсора }
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
 Устанавливаются вызовом процедуры SetGraphMode  из модуля Graph }
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