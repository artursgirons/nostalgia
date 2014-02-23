Program MineSweeper;
Uses Crt,Graph,Dos;
Const l:Array[1..5,1..2] of Integer=((134,9),(422,5),(366,4),(174,10),(606,1));
Var x,y,dx,dy,fx,fy,b2,yc,xc,m,a,Time,total:Integer;
    rb,mcont:integer;
    Press,Ycord,Xcord:integer;
    b,ll:Byte;
    Fi:Array[0..40,0..27]of byte;
    P:Array[1..5,1..10] of pointer;
    Block:boolean;

Procedure Numbers(const k:byte;const no:integer);
Begin
 PutImage(dx+5+k*(fx*16-47),dy-38,p[4,(no div 100)+1]^,0);
 PutImage(dx+18+k*(fx*16-47),dy-38,p[4,((no-no div 100*100) div 10)+1]^,0);
 PutImage(dx+31+k*(fx*16-47),dy-38,p[4,no-no div 100*100-(no-no div 100*100)div 10*10+1]^,0);
End;

Procedure InitPicture;
Var F:File;
Begin
  Assign(F,'c:\MSweeper\msweeper.spr');
  Reset(F,1);
  For a:=1 to 5 do
    For b:=1 to l[a,2] do
    Begin
      GetMem(P[a,b],l[a,1]);
      BlockRead(f,P[a,b]^,l[a,1]);
    End;
  Close(F);
End;

Procedure DisPicture;
Begin
  For a:=1 to 5 do
    For b:=1 to l[a,2] do
      Dispose(p[a,b]);
End;

Procedure InitMouse;
var r:registers;
Begin r.ax:=$01;intr($33,r) End;

Procedure HideMouse;
var r:registers;
Begin r.ax:=$02;intr($33,r) End;

Procedure DrawField;
Begin
  cleardevice;
  Block:=true;Time:=0;total:=0;rb:=m;mcont:=0;
  dx:=(640-(fx*16)) div 2;dy:=(480-(fy*16)) div 2+33;
  for a:=0 to fx do
    for b:= 0 to fy do fi[a,b]:=0;
  Setcolor(7);rectangle(dx-15,dy-80,dx+fx*16+13,dy+fy*16+13);
  Setcolor(15);rectangle(dx-14,dy-79,dx+fx*16+12,dy+fy*16+12);
  Setfillstyle(1,7);
  bar(dx-13,dy-78,dx+fx*16+11,dy+fy*16+11);
  SetFillStyle(1,15);
  Bar(dx-12,dy-55,dx+fx*16+10,dy+fy*16+10);
  SetFillStyle(1,7);
  Bar(dx-9,dy-52,dx+fx*16+7,dy+fy*16+7);
  SetFillStyle(1,8);
  Bar(dx-3,dy-3,dx+fx*16+1,dy+fy*16+1);
  Bar(dx-3,dy-46,dx+fx*16+1,dy-10);
  SetFillStyle(1,7);
  Bar(dx,dy-43,dx+fx*16-2,dy-13);
  For a:=0 to fx-1 do
    for b:= 0 to fy-1 do
      PutImage(dx+a*16,dy+b*16,p[1,1]^,0);
  PutImage(dx+3,dy-40,p[5,1]^,0);Numbers(0,m);
  PutImage(dx+fx*16-44,dy-40,p[5,1]^,0);Numbers(1,0);
  PutImage(dx+fx*8-13,dy-40,p[2,1]^,0);
  Putimage(dx-10,dy-75,p[3,1]^,0);
  Putimage(dx+35,dy-75,p[3,3]^,0);
  For a:=1 to m do Begin repeat x:=random(fx);y:=random(fy); until fi[x,y]=0; fi[x,y]:=9 End;
End;

Procedure Around;
Begin
  if (fi[x,y+1]in [9,10,14,15]) then inc(ll);if (y>0)and(fi[x,y-1]in [9,10,14,15]) then inc(ll);if fi[x+1,y]in [9,10,14,15]
  then inc(ll);
  if (x>0)and(fi[x-1,y]in [9,10,14,15]) then inc(ll);if (x>0)and(y>0)and(fi[x-1,y-1]in [9,10,14,15])
  then inc(ll);if (x>0)and(fi[x-1,y+1]in [9,10,14,15]) then
  inc(ll);
  if (y>0)and(fi[x+1,y-1]in [9,10,14,15]) then inc(ll);if fi[x+1,y+1]in [9,10,14,15] then inc(ll);
End;

Procedure EmptyField;
var bbb:boolean;
procedure ppp;
var s:string[1];
Begin
  if (fi[a,b]=0)and((fi[a,b+1]=3)or(fi[a,abs(b-1)]=3)or(fi[a+1,b]=3)
  or(fi[abs(a-1),b]=3)or(fi[a+1,b+1]=3)or(fi[a+1,abs(b-1)]=3)or(fi[abs(a-1),b+1]=3)or(fi[abs(a-1),abs(b-1)]=3)) then
  Begin
   inc(total);
   bbb:=false;
    x:=a;y:=b;
    ll:=0;
    around;
    hidemouse;putimage(dx+a*16,dy+b*16,p[1,2]^,0);
    setcolor(ll);if ll=3 then setcolor(12);
    if (ll<>0) then Begin fi[a,b]:=1;str(ll,s);outtextxy(dx+a*16+4,dy+b*16+4,s) End else fi[a,b]:=3;
    initmouse;
  End;
End;
Begin
  inc(total);
  fi[x,y]:=3;
  bbb:=false;
  repeat
  bbb:=true;
  for a:=0 to fx-1 do
    For b:=0 to fy-1 do ppp;
  until bbb
End;

procedure Releas;
var s:string[1];
Begin
  x:=((xcord-dx)div 16);
  y:=((ycord-dy)div 16);
  ll:=0;
{  if (xcord<dx)and(xcord>dx+fx*16)and(ycord<dy)and(ycord>dy+fy*16) then
    if (xc>dx-8)and(xc<dx+fx*16)and(yc>dy-8)and(yc<dy+fy*16) then
    Begin
     HideMouse;if fi[(xc-dx)div 16,(yc-dy)div 16]in[0,9] then Putimage(((xc-dx)div 16)*16+dx,((yc-dy)div 16)*16+dy,p[1,1]^,0);
     InitMouse;
    End;}

  if (xcord>dx)and(xcord<dx+fx*16)and(ycord>dy)and(ycord<dy+fy*16) then
  Begin
  if block and(fi[x,y]in[0,4,5,9,14,15])and(press=0)and(b2=2)then
  Begin
     HideMouse;if fi[(xc-dx)div 16,(yc-dy)div 16]in[0,9] then Putimage(((xc-dx)div 16)*16+dx,((yc-dy)div 16)*16+dy,p[1,1]^,0);
     InitMouse;
    for a:=1 to 2 do
    Begin
      hidemouse;
      if fi[x,y]=0 then Begin dec(rb);fi[x,y]:=4;Putimage(dx+x*16,dy+y*16,p[1,3]^,0);break End;
      if fi[x,y]=9 then Begin dec(rb);inc(mcont);fi[x,y]:=14;Putimage(dx+x*16,dy+y*16,p[1,3]^,0);break End;
      if fi[x,y]=4 then Begin inc(rb);fi[x,y]:=5;Putimage(dx+x*16,dy+y*16,p[1,4]^,0);break End;
      if fi[x,y]=5 then Begin fi[x,y]:=0;Putimage(dx+x*16,dy+y*16,p[1,1]^,0);break End;
      if fi[x,y]=14 then Begin Inc(rb);dec(mcont);fi[x,y]:=15;putimage(dx+x*16,dy+y*16,p[1,4]^,0);break End;
      if fi[x,y]=15 then Begin fi[x,y]:=9;putimage(dx+x*16,dy+y*16,p[1,1]^,0);break End;
    End;
  numbers(0,abs(rb));
  initmouse;
  End;
  if block and(fi[x,y]in[0,9])and(Press=0)and(b2=1)then
  Begin
     if fi[x,y]=9 then
     Begin
     HideMouse;if fi[(xc-dx)div 16,(yc-dy)div 16]in[0,9] then Putimage(((xc-dx)div 16)*16+dx,((yc-dy)div 16)*16+dy,p[1,1]^,0);
     InitMouse;
       inc(total);
       fi[x,y]:=10;hideMouse;Putimage(dx+x*16,dy+y*16,p[1,6]^,0);block:=false;
       for a:=0 to fx-1 do For b:=0 to fy-1 do
         Begin
           if fi[a,b]in[9,15] then putimage(dx+a*16,dy+b*16,p[1,5]^,0);
           if fi[a,b]=4 then putimage(dx+a*16,dy+b*16,p[1,7]^,0);
         End;
       PutImage(dx+fx*8-13,dy-40,p[2,4]^,0);
       initmouse;
     End;
     If (fi[x,y]=0) then
     Begin
     HideMouse;if fi[(xc-dx)div 16,(yc-dy)div 16]in[0,9] then Putimage(((xc-dx)div 16)*16+dx,((yc-dy)div 16)*16+dy,p[1,1]^,0);
     InitMouse;
      Around;
      setcolor(ll);if ll=3 then setcolor(12);
      hidemouse;putimage(dx+x*16,dy+y*16,p[1,2]^,0);
      if ll<>0 then Begin inc(total);fi[x,y]:=1;str(ll,s);outtextxy(dx+x*16+4,dy+y*16+4,s) End else Emptyfield;
      initmouse;
    End;
    End;
  End;
  if block and(total=fx*fy-m)and(mcont=m)then Begin block:=false;hidemouse;PutImage(dx+fx*8-13,dy-40,p[2,5]^,0);initmouse end;
end;

Procedure GetMouseAction;
Var r:registers;
    ch:char;
    hh,tt1,tt2:word;
Begin
  While true do
  Begin
    r.ax:=$03;intr($33,r);Press:=r.bl;Xcord:=r.cx;Ycord:=r.dx;
    GetTime(hh,hh,tt1,hh);
    If Block and(tt1<>tt2) then Begin tt2:=tt1;inc(Time);numbers(1,time) End;

    if keypressed then break;

    if block and((press=1)or(press=2))and(b2=0)then
      if (xcord>dx)and(xcord<dx+fx*16)and(ycord>dy)and(ycord<dy+fy*16)and(fi[(xcord-dx)div 16,(ycord-dy) div 16]in[0,9]) then
        Begin hidemouse;Putimage(((xcord-dx)div 16)*16+dx,((ycord-dy)div 16)*16+dy,p[1,2]^,0);initmouse End;

    if (press=1)and(b2=0)then
      if (xcord>dx+fx*8-13)and(ycord>dy-40)and(xcord<dx+fx*8+13)and(ycord<dy-16) then
        Begin hidemouse;PutImage(dx+fx*8-13,dy-40,p[2,2]^,0);Delay(5000);DrawField;initmouse;b2:=0 End;

    Releas;

    if block and((Press=1)or(press=2)) then
    Begin
      If ((((xc-dx)div 16)<>((xcord-dx)div 16))or(((yc-dy)div 16)<>((ycord-dy)div 16)))then
      Begin
        hidemouse;
   if (xc>dx-16)and(xc<dx+fx*16)and(yc>dy-16)and(yc<dy+fy*16)and(fi[(xc-dx)div 16,(yc-dy) div 16]in[0,9]) then
        Putimage(((xc-dx)div 16)*16+dx,((yc-dy)div 16)*16+dy,p[1,1]^,0);
   if (xcord>dx-16)and(xcord<dx+fx*16)and(ycord>dy-16)and(ycord<dy+fy*16)and(fi[(xcord-dx)div 16,(ycord-dy) div 16]in[0,9])then
        Putimage(((xcord-dx)div 16)*16+dx,((ycord-dy)div 16)*16+dy,p[1,2]^,0);
        initmouse
      End;
    End;
    b2:=Press;xc:=Xcord;yc:=Ycord;
  End;
end;
Begin
  Randomize;
  fx:=8;fy:=8;m:=5;
  InitGraph(x,y,'');
  InitPicture;
  DrawField;
  InitMouse;
  GetMouseAction;
  Dispicture;
  HideMouse;
  Closegraph;
End.