{==============================}UNIT F_Mouse; {=============================}

                                   INTERFACE
{Nakamais tips tiek izmantots lai noteiktu elementus,
{ko var izveleties pele (skat.SetMouseOption)}
type
    MouseItemType = record
       x1,y1,x2,y2:Integer;    {rjona koordinates}
       Butt: Word;             {izsauksanas nosacijumi}
       Key : Word;             {Taustinja skan kods}
    end;
type
    MouseHandlerType = Procedure (Mask,Button,X,Y,DX,DY: Integer);
{Peles pogu konstantes}
const
     LeftButton   = 1;
     RightButton  = 2;
     CenterButton = 4;
     AnyButton    = 7;
{Virtualo kordinasu parskaitisanas koeficents teksta rez}
const
     TextRatioX: byte = 8;
     TextRatioy: byte = 8;
{+-------------------------------------------------------------------------+
|                           Peles inicializesana                           |
 +-------------------------------------------------------------------------+}
Function IsMouse: Boolean;
         {Atgriez true ja pele ir piejama}
Function InitMouse: Boolean;
         {Inicialize peli}
Procedure SetMousePage(Page: byte);
         {Uzstada lapusi peles pointeram}
Function GetMousePage: Byte;
         {Atgriez lapuses nummuru ar pointeru}
Procedure SetStepToPixel (Hor,Ver: Integer);
         {Uzstada peles jutigumu}
Procedure GetStepToPixel (var Hor,Ver: Integer);
         {Atgriez peles jutigumu}
Procedure SetDoubleSpeed(Speed: word);
         {Uzstada atruma paatrinasanaas slieksni}
Function GetDoubleSpeed : Word;
         {Atgriez paatrinaasanaas slieksni}
{+-------------------------------------------------------------------------+
 |                             Koordinates                                 |
 +-------------------------------------------------------------------------+}
Function MouseTextCooX(x: Integer) : Byte;
         {Atgriez teksta koordinati pec uzdotas virtualas}
Function MouseTextCooY(Y: Integer) : Byte;
         {Atgriez teksta koordinati pec uzdotas virtualas}
Function MouseGraphCooX(X: Byte): Integer;
         {Atgriez virtualo koordinati pec uzdotas teksta}
Function MouseGraphCooY(Y: Byte): Integer;
         {Atgriez virtualo koordinati pec uzdotas teksta}
Procedure MouseWhereXY(var X,Y: Integer);
         {Atgriez peles virtualas koordinates}
Procedure MouseGotoXY(x,y: Integer);
         {Parvieto kursoru}
Function MouseWhereX: Byte;
         {Atgriez horizontalo teksta koordinati}
Function MouseWhereY: Byte;
         {Atgriez vertikalo teksta koordinati}
Function MouseIn(x1,y1,x2,y2: Integer): Boolean;
         {Atgriez TRUE ja kursors atrodads uzdotaja kvadrata}
{+-------------------------------------------------------------------------+
 |                           Pogu stavoklis                                |
 +-------------------------------------------------------------------------+}
Function NumButton: Byte;
         {Atgriez peles pogyu skaitu}
Procedure GetMouseState(var Butt,x,y: Integer);
         {Atgriez tekoso peles stavokli:
     BUTT - pogu stavoklis;
     x,y - tekosas virtualas koordinates;}
Function MousePressed: Boolean;
         {Atgriez TRUE ja nospiesta jebkura poga}
Procedure MouseButtPressed(Butt: Integer; var Stat,Count,x,y: Integer);
         {Atgriez informaciju par nospiestu pogu}
Procedure MouseButtReleased(Butt: Integer; var Stat,Count,x,y: Integer);
         {Atgriez informaciju par atlaistu taustinu}
{+-------------------------------------------------------------------------+
 |                             Logi                                        |
 +-------------------------------------------------------------------------+}
Procedure MouseWindow(x1,y1,x2,y2: Integer);
         {Uzdod koordinates kur parvietosies kursors}
Procedure MouseScreen;
         {Uzstada logu pa visu ekranu}
{+-------------------------------------------------------------------------+
 |                                    Kursora forma                        |
 +-------------------------------------------------------------------------+}
Procedure ShowMouse;
         {Paradit kursoru}
Procedure HideMouse;
         {Novakt kursoru}
Procedure MouseTextCursor(ScrMask,CurMask: Word);
         {Uzstadiit jaunu teksta kursoru}
Procedure MouseBlink(YUP,YDn: Byte);
         {Uzdod aparat kursoru vajadzigaja lieluma}
Procedure MouseGraphCursor(var ScrCurMask;x,y: Byte);
         {Uzdod grafiska kursora izskatu}
{+-------------------------------------------------------------------------+
 |                     Saglabasana\atgriezsana                             |
 +-------------------------------------------------------------------------+}
Function MouseBuffSize: Word;
         {Atgriez bufera garumu garuma saglabasanai}
Procedure SaveMouse(var Buff);
         {Saglaba buferi tekoso peles stavokli}
Procedure RestoreMouse(var Buff);
         {Atgriez saglabato peles stavokli}
{+-------------------------------------------------------------------------+
 |                          Klaviatuuiras emulacija                        |
 +-------------------------------------------------------------------------+}
Procedure SetMouseItem(NItem: byte; var Items);
Procedure AddMouseItem(Item: MouseItemType);
          {Pievieno vel vienu izveles objektu}
Procedure ClearMouseItems;
Procedure GetMouseItem(var NItem: Byte; var Items);
Function KeyOrMousePressed: Boolean;
Function ReadKeyOrMouse: Char;
{+-------------------------------------------------------------------------+
 |                     Notikumu apstrade no peles                          |
 +-------------------------------------------------------------------------+}
Procedure SetMouseHandler(Mask: Word; Proc: MouseHandlerType);
Procedure ChangeMouseHandler(Mask: Word; Proc: MouseHandlerType;
                             var OldMask: Word; var OldProc: Pointer);
Procedure ClearMouseHandler;
                            IMPLEMENTATION
{+-------------------------------------------------------------------------+
 |                            Peles inicializesana                         |
 +-------------------------------------------------------------------------+}
Uses DOS,CRT;
type
    MouseItems = array [1..2*MaxInt div SizeOf(MouseItemType)] of MouseItemType;
    PMouseIt = ^MouseItems;
const
     MousePresent: Boolean = False;
     ItemsList    : PMouseIt = NIL;
     NMouseItem  : Byte = 0;
     MouseVisible: Boolean = False;
     x1m: Integer = 0;
     y1m: Integer = 0;
     x2m: Integer = 639;
     y2m: Integer = 199;
     Speed2: Word = 128;
     VerRat: Integer = 8;
     HorRat: Integer = 8;
     NButton: Byte = 0;
var
   Reg: registers;
Function IsMouse: Boolean;
var
   p     :pointer;
   k,x,y :Integer;
   Is    :Boolean;
begin
     if NButton = 0 then begin
        GetIntVec($33,p);
        Is := p<> NIL;
        if Is then with Reg do begin
           ax := $3;
           bx := $FFFF;
           Intr($33,Reg);
           Is :=Bx<>$FFFF
        end;
        MousePresent := Is
     end;
     IsMouse :=MousePresent
end; {IsMouse}
{-------------------------------}
Function InitMouse: Boolean;
begin
     with Reg do begin
          ax :=0;
          Intr($33,Reg);
          MousePresent :=ax=$FFFF;
          NButton :=bx
     end;
     ClearMouseItems;
     SetMousePage(0);
     HideMouse;
     MouseScreen
end; {InitMouse}
{---------------------------------}
Procedure SetMousePage(Page: byte);
begin
     with Reg do begin
          ax := $1D;
          bl :=Page;
          bh :=0;
          Intr($33,reg)
     end
end; {SetMousePage}
{-------------------------------------}
Function GetMousePage: Byte;
begin
     with Reg do begin
          ax :=$1E;
          Intr($33,Reg);
          GetMousePage := bl
     end
end;
{-------------------------------------}
Procedure SetStepToPixel (Hor,Ver: Integer);
begin
     if IsMouse then with Reg do begin
        ax :=$0F;
        cx :=Hor and $7FFF;
        dx :=Ver and $7FFF;
        HorRat :=cx;
        VerRat :=dx;
        Intr($33,Reg)
     end
end; {SetStepToPixel}
{-------------------------------------}
Procedure GetStepToPixel (var Hor,Ver: Integer);
begin
     if IsMouse then with Reg do begin
        Hor :=HorRat;
        Ver :=VerRat
     end
end; {GetStepToPixel}
{-------------------------------------}
Procedure SetDoubleSpeed(Speed: word);
begin
     if IsMouse then with Reg do begin
        ax :=$13;
        dx :=Speed;
        Speed2 := Speed;
        Intr($33,Reg);
     end
end; {SetDoubleSpeed}
{-------------------------------------}
Function GetDoubleSpeed : Word;
begin
     GetDoubleSpeed :=Speed2
end;
{+-------------------------------------------------------------------------+
 |                             Koordinates                                 |
 +-------------------------------------------------------------------------+}
Function MouseTextCooX(x: Integer) : Byte;
begin
     MouseTextCooX := X div TextRatioX + 1
end;
{-------------------------------------}
Function MouseTextCooY(Y: Integer) : Byte;
begin
     MouseTextCooY := y div TextRatioY + 1
end; {MouseTextCooY}
{-------------------------------------}
Function MouseGraphCooX(X: Byte): Integer;
begin
     MouseGraphCooX :=(x-1) * TextRatioX
end; {MouseGraphCooX}
{-------------------------------------}
Function MouseGraphCooY(Y: Byte): Integer;
begin
     MouseGraphCooY := (Y-1) * TextRatioY
end; {MouseGraphCooY}
{-------------------------------------}
Procedure MouseWhereXY(var X,Y: Integer);
begin
     if IsMouse then with Reg do begin
        ax :=$3;
        Intr($33,Reg);
        x := cx;
        y :=dx
     end
     else begin
          x := -1;
          y := -1
     end
end; {MouseWhereXY}
{-------------------------------------}
Procedure MouseGotoXY(x,y: Integer);
begin
     if IsMouse then with Reg do begin
        ax := $4;
        cx := x;
        dx := Y;
        Intr($33,Reg)
     end
end; {MouseGotoXY}
{-------------------------------------}
Function MouseWhereX: Byte;
begin
     if IsMouse then with Reg do begin
        ax :=$3;
        Intr($33,Reg);
        MouseWhereX := MouseTextCooX(cx)
     end
     else
         MouseWhereX := 0
end; {MouseWhereX}
{-------------------------------------}
Function MouseWhereY: Byte;
begin
     if IsMouse then with Reg do begin
        ax :=$3;
        Intr($33,Reg);
        MouseWhereY :=MouseTextCooY(dx)
     end
     else
         MouseWhereY := 0
end; {MouseWhereY}
{-------------------------------------}
Function MouseIn(x1,y1,x2,y2: Integer): Boolean;
begin
     if IsMouse then with Reg do begin
        ax := $3;
        Intr($33,Reg);
        MouseIn := (cx>=x1) and (cx<=x2) and (dx>=y1) and (dx<=y2)
     end
     else
         MouseIn := False
end; {MouseIn}
{+-------------------------------------------------------------------------+
 |                           Pogu stavoklis                                |
 +-------------------------------------------------------------------------+}
Function NumButton: Byte;
begin
     NumButton := NButton
end; {NumButton}
{-------------------------------------}
Procedure GetMouseState(var Butt,x,y: Integer);
begin
     if IsMouse then with Reg do begin
        ax :=$3;
        Intr($33,Reg);
        Butt :=bx;
        x := cx;
        y := dx
     end
     else begin
          Butt := 0;
          x :=0;
          y :=0
     end
end; {GetMouseState}
{-------------------------------------}
Function MousePressed: Boolean;
begin
     if IsMouse then with Reg do begin
        ax :=$3;
        Intr($33,Reg);
        MousePressed := bx<>0
        end
        else
            MousePressed := False
end; {MousePressed}
{-------------------------------------}
Procedure MouseButtPressed(Butt: Integer; var Stat,Count,x,y: Integer);
begin
     if IsMouse then with Reg do begin
        ax :=$5;
        bx :=Butt;
        Intr($33,Reg);
        Count :=bx;
        x :=cx;
        y :=dx;
        Stat :=bx
     end
     else
end;
{-------------------------------------}
Procedure MouseButtReleased(Butt: Integer; var Stat,Count,x,y: Integer);
begin
     if IsMouse then with Reg do begin
        ax :=$6;
        bx :=Butt;
        Intr($33,Reg);
        Count := bx;
        x := cx;
        y := dx;
        Stat :=bx
     end
     else
end; {mouseButtReleased}
{+-------------------------------------------------------------------------+
 |                             Logi                                        |
 +-------------------------------------------------------------------------+}
Procedure MouseWindow(x1,y1,x2,y2: Integer);
begin
     if IsMouse then begin
        x1m :=x1;
        y1m :=y1;
        x2m :=x2;
        y2m :=y2;
        with Reg do begin
             ax := $7;
             cx := x1;
             dx :=x2;
             Intr($33,Reg);
             ax :=$8;
             cx :=y1;
             dx :=y2;
             intr($33,Reg)
        end
     end
end;{MouseWindow}
Procedure MouseScreen;
var
   x2,y2: Integer;
begin
     if IsMouse then with Reg do begin
        ah:= $F;
        intr($10,Reg);
        case al of
        1,4,5,13: begin
                       x2:= 319;
                       y2:= 199
                  end;
        15,16: begin
                    x2:= 639;
                    y2:= 349
               end;
        17,18: begin
                    x2:= 639;
                    y2:=479
               end;
        else
            x2:= 639;
            y2:= 199
        end
     end;
MouseWindoW(0,0,x2,y2)
end; {MouseScreen}
{+-------------------------------------------------------------------------+
 |                                    Kursora forma                        |
 +-------------------------------------------------------------------------+}
Procedure ShowMouse;
begin
     if IsMouse and not MouseVisible then with Reg do begin
        ax:=$1;
        Intr($33,Reg);
        MouseVisible:= True;
     end
end; {ShowMouse}
{-------------------------------------}
Procedure HideMouse;
begin
     if IsMouse and MouseVisible then with Reg do begin
        ax:= $2;
        Intr($33,Reg);
        MouseVisible:= False
     end
end; {HideMouse}
{-------------------------------------}
Procedure MouseTextCursor(ScrMask,CurMask: Word);
begin
     if IsMouse then with Reg do begin
        ax:= $A;
        bx:= 0;
        cx:= ScrMask;
        dx:= CurMask;
        Intr($33,Reg)
     end
end; {MouseTextCursor}
{-------------------------------------}
Procedure MouseBlink(YUP,YDn: Byte);
begin
     if IsMouse then With Reg do begin
        ax:= $A;
        bx:= 1;
        cx:= YUp;
        dx:= YDn;
        Intr($33,Reg)
     end
end; {MouseBlink}
{-------------------------------------}
Procedure MouseGraphCursor(var ScrCurMask;x,y: Byte);
begin
     if IsMouse then with Reg do begin
        ax := $9;
        bx:= x;
        cx:= y;
        es:= seg(ScrCurMask);
        dx:= ofs(ScrCurMask);
        Intr($33,Reg)
     end
end; {MouseGraphCursor}
{+-------------------------------------------------------------------------+
 |                     Saglabasana\atgriezsana                             |
 +-------------------------------------------------------------------------+}
Function MouseBuffSize: Word;
begin
     if IsMouse then with Reg do begin
        ax:= $15;
        bx:= 0;
        Intr($33,Reg);
        MouseBuffSize:= bx
     end
     else
         MouseBuffSize:= 0;
end; {MouseBuffSize}
{-------------------------------------}
Procedure SaveMouse(var Buff);
begin
     if IsMouse then with Reg do begin
        ax:= $16;
        es:= seg(Buff);
        dx:= ofs(Buff);
        Intr($33,Reg)
     end
end; {SaveMouse}
{-------------------------------------}
Procedure RestoreMouse(var Buff);
begin
     if IsMouse then with Reg do begin
        ax:= $17;
        es:= seg(Buff);
        dx:= ofs(Buff);
        Intr($33,Reg)
     end
end; {RestoreMouse}
{+-------------------------------------------------------------------------+
 |                          Klaviatuuiras emulacija                        |
 +-------------------------------------------------------------------------+}
const
     DoubleChars: Boolean = False;
var
   SecChar: Char;

Procedure SetMouseItem(NItem: byte; var Items);
begin
     if IsMouse then begin
        ClearMouseItems;
        GetMem(ItemsList,NItem * SizeOf(MouseItemType));
        Move(Items,ItemsList^,NItem*SizeOf(MouseItemType));
        NMouseItem:= NItem
     end
end; {SetMouseItem}
{-------------------------------------}
Procedure AddMouseItem(Item: MouseItemType);
var
   p: PMouseIt;
   k: Byte;
begin
     if IsMouse then begin
        k:= NMouseItem;
        GetMem(P,(k+1) * SizeOf(MouseItemType));
        Move(ItemsList^,P^,k * SizeOf(MouseItemType));
        Move(Item,P^[k+1],SizeOf(MouseItemType));
        ClearMouseItems;
        NMouseItem:= k+1;
        ItemsList:= P
     end
end; {AddMouseItem}
{-------------------------------------}
Procedure ClearMouseItems;
begin
     if IsMouse and (NMouseItem <> 0) then begin
        FreeMem(ItemsList,NMouseItem * SizeOf(MouseItemType));
        NMouseItem:= 0
     end
end; {ClearMouseItems}
{-------------------------------------}
Procedure GetMouseItem(var NItem: Byte; var Items);
begin
     if IsMouse and (NMouseItem<>0) then begin
        NItem:= NMouseItem;
        Move(ItemsList^,Items,NMouseItem * SizeOf(MouseItemType))
     end
end; {GetMouseItem}
{-------------------------------------}
Function KeyOrMousePressed: Boolean;
var
   b,k: Integer;
   MouseActive: Boolean;
begin
     if KeyPressed then
        KeyOrMousePressed:= True
     else with Reg do
          begin
               ax:= $3;
               Intr($33,Reg);
               if (bx<>0) and (NMouseItem<>0) then begin
                  MouseActive:= False;
                  for k:=1 to NMouseItem do
                  if not MouseActive then
                     with ItemsList^[k] do begin
                          case Butt of
                               LeftButton: b:= bx and LeftButton;
                               RightButton: b:= bx and RightButton;
                               CenterButton: b:=bx and CenterButton;
                               AnyButton: b:= bx
                          else
                              b:= 0;
                          end; {case}
                          MouseActive := (b<>0) and
                                      MouseIn(MouseGraphCooX(X1),MouseGraphCooY(y1),
                                              MouseGraphCooX(x2),MouseGraphCooY(y2))
                          end;{for,if}
                     KeyOrMousePressed:=MouseActive
                  end {if(bx<>) and ..}
                  else {bx=0 vai NMouseItem = 0}
                       KeyOrMousePressed := False
                  end {With Reg}
end; {KeyOrMousePressed}
{-------------------------------------}
Function ReadKeyOrMouse: Char;
var
   k:Byte;
   b,bb: Word;
   MouseActive: Boolean;
label
     loop;
begin
loop:
     if not IsMouse or KeyPressed then
        ReadKeyOrMouse :=ReadKey
     else if DoubleChars then begin
          DoubleChars:= False;
          ReadKeyOrMouse:= SecChar
          end
     else if NMouseItem<>0 then with Reg do begin
          MouseActive:= False;
          ax:= $3;
          Intr($33,Reg);
          bb:= bx;
          if bb<>0 then

          for k:=1 to NMouseItem do
              if not MouseActive then
                 with ItemsList^[k] do begin
                      case Butt of
                           LeftButton : b :=bb and LeftButton;
                           RightButton: b :=bb and RightButton;
                           CenterButton:b :=bb and CenterButton;
                           AnyButton  : b :=bb;
                      else
                          b:=0;
                      end;
                      if (b<>0) and MouseIn(
                         MouseGraphCooX(x1),MouseGraphCooY(y1),
                         MouseGraphCooX(x2),MouseGraphCooY(y2)) then begin
                      MouseActive:= True;
                      ReadKeyOrMouse:= Char(Lo(Key));
                      if Lo(Key) = 0 then begin
                         DoubleChars:= True;
                         SecChar:= Chr(Hi(Key))
                      end
                 end
              end;{for..if not MouseActive}
          if not MouseActive then goto loop
     end{if NMouseItem<>0}
     else
         ReadKeyOrMouse := ReadKey
end;{ReadkeyOrMouse}
{+-------------------------------------------------------------------------+
 |                     Notikumu apstrade no peles                          |
 +-------------------------------------------------------------------------+}
const
     OldUserProc: Pointer = NIL;
var
   UserProc: MouseHandlerType absolute OldUserProc;
   OldAX: Word;
Procedure MouseHandler;Far;Assembler;
ASM
   push bp
   push ds
   push es
   push ax
   mov ax,seg @DATA
   mov ds,ax
   pop ax
   mov OldAX,ax
   mov ax,Word ptr[OldUserProc]
   or  ax,Word ptr [OldUserProc + 2]
   jz  @
   mov  ax,oldAX
   push ax
   push bx
   push cx
   push dx
   push di
   push si
   call [UserProc]
   @: pop es
   pop ds
   pop bp
   ret far
end; {MouseHandler}
{-------------------------------------}
Procedure SetMouseHandler(Mask: Word; Proc: MouseHandlerType);
begin
     if IsMouse then with Reg do begin
        UserProc:= Proc;
        ax:= $0C;
        cx:= Mask;
        es:= seg(MouseHandler);
        dx:= ofs(MouseHandler);
        Intr($33,Reg)
     end
end; {SetMouseHandler}
{-------------------------------------}
Procedure ChangeMouseHandler(Mask: Word; Proc: MouseHandlerType;
                             var OldMask: Word; var OldProc: Pointer);
begin
     if IsMouse then with Reg do begin
        OldProc:= OldUserProc;
        ax:= $14;
        cx:= Mask;
        es:= seg(MouseHandler);
        dx:= ofs(MouseHandler);
        Intr($33,Reg);
        OldMask:= cx
     end
end;{ChangeMouseHandler}
{-------------------------------------}
Procedure ClearMouseHandler;
begin
     if IsMouse then with Reg do begin
        ax := $0C;
        cx := 0;
        es := 0;
        dx := 0;
        Intr($33,Reg)
     end;
end;{ClearMouseHandler}
{===================================}END.{==================================}
