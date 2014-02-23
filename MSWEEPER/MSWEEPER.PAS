Program MineSweeper;
{
   0  -> Space
   9  -> Boom
   4  -> (0 + Flag)
   5  -> (0 + ?)
   14 -> (9 + Flag)
   15 -> (9 + ?)
   3  -> opened 0 field in FillField;
   1  -> opened 0 field with some 9 type members
   fx -> field size over X coords
   fy -> field size over Y coords
   m  -> number of aviable mines on field

  Line 48: Assign(F,'c:\tp\programs.pas\MSweeper\msweeper.spr');
           must specify turue location of "msweeper.spr"
}
Uses Crt,Graph,Dos;
Const l:Array[1..5,1..2] of Integer=((134,9),(422,5),(366,4),(174,11),(606,1));
Var x,y,dx,dy,fx,fy,b2,yc,xc,m,a,Time,total:Integer;
    rb,mcont,pp:integer;
    Press,Ycord,Xcord:integer;
    b,ll:Byte;
    Fi:Array[0..40,0..27]of byte;
    P:Array[1..5,1..11] of pointer;
    Block:boolean;

Procedure InitMouse;
var r:registers;
Begin r.ax:=$01;intr($33,r) End;

Procedure HideMouse;
var r:registers;
Begin r.ax:=$02;intr($33,r) End;

Procedure Numbers(const k:byte;no:integer);
Begin
 if no<0 then PutImage(dx+5+k*(fx*16-47),dy-38,p[4,11]^,0) else
 PutImage(dx+5+k*(fx*16-47),dy-38,p[4,(no div 100)+1]^,0);
 no:=abs(no);
 PutImage(dx+18+k*(fx*16-47),dy-38,p[4,((no-no div 100*100) div 10)+1]^,0);
 PutImage(dx+31+k*(fx*16-47),dy-38,p[4,no-no div 100*100-(no-no div 100*100)div 10*10+1]^,0);
End;

Procedure InitPicture;
Var F:File;
Begin
  Assign(F,'c:\tp\programs.pas\MSweeper\msweeper.spr');
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

Procedure DrawField;
Begin
  hideMouse;
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
  Putimage(dx-10,dy-75,p[3,2]^,0);
{  Putimage(dx+35,dy-75,p[3,4]^,0);}
  For a:=1 to m do Begin repeat x:=random(fx);y:=random(fy); until fi[x,y]=0; fi[x,y]:=9 End;
  initmouse;
End;

Procedure Menu_File;
Var mf:array[0..6]of string[13];
var r:registers;
    k,kk,i:integer;
    p2:pointer;
Begin
  mf[0]:=' New';mf[1]:='Beginner';mf[2]:='Intermediate';mf[3]:='Expert';mf[4]:='Full Screen';
  mf[5]:=' Not Avilable';mf[6]:=' Exit';
  for a:=1 to 4 do Begin if a=pp then mf[a]:='*'+mf[a]else mf[a]:=' '+mf[a] End;
  press:=0;b2:=0;
  hidemouse;
  Putimage(dx-10,dy-75,p[3,1]^,0);
  getmem(p2,imagesize(dx-12,dy-55,dx+82,dy+60));
  getimage(dx-12,dy-55,dx+82,dy+60,p2^);
  settextstyle(2,0,0);
  Setfillstyle(1,7);
  bar(dx-10,dy-53,dx+80,dy+58);
  setcolor(15);
  rectangle(dx-11,dy-54,dx+81,dy+59);
  setcolor(8);
  rectangle(dx-10,dy-53,dx+80,dy+58);
  setcolor(0);
  rectangle(dx-12,dy-55,dx+82,dy+60);
  for a:=0 to 6 do Outtextxy(dx+2,dy-51+a*16,mf[a]);
  setcolor(8); line(dx-10,dy-37,dx+80,dy-37);line(dx-10,dy-37+64,dx+80,dy-37+64);line(dx-10,dy-37+80,dx+80,dy-37+80);
  setcolor(15); line(dx-11,dy-38,dx+81,dy-38);line(dx-11,dy-38+64,dx+81,dy-38+64);line(dx-11,dy-38+80,dx+81,dy-38+80);
  initmouse;
  While true do
  Begin
{    if keypressed then exit;}
    r.ax:=$03;intr($33,r);Press:=r.bl;Xcord:=r.cx;Ycord:=r.dx;
    if (Xcord>dx-10)and(Xcord<dx+80)and(ycord>dy-53)and(ycord<dy+59) then
    Begin
      i:=(ycord-dy+52)div 16;
      if (i<>k) then
      Begin
      if k=-1 then k:=kk;
        hidemouse;
        Setfillstyle(1,7);Bar(dx-9,dy+k*16-52,dx+79,dy+k*16+13-52);
        SetColor(0);Outtextxy(dx+2,dy-51+k*16,mf[k]);
        Setfillstyle(1,1);Bar(dx-9,dy+i*16-52,dx+79,dy+i*16+13-52);
        SetColor(15);Outtextxy(dx+2,dy-51+i*16,mf[i]);
        initmouse;
      End;
      k:=i;
    End
    Else
      if k=i then
      Begin
        kk:=k;hidemouse;
        Setfillstyle(1,7);Bar(dx-9,dy+k*16-52,dx+79,dy+k*16+13-52);
        SetColor(0);Outtextxy(dx+2,dy-51+k*16,mf[k]);initmouse;k:=-1;
      End;

    if (press=0) and (b2=1) then
    Begin
      case k of
      0:Begin DrawField;Press:=0;b2:=0;break End;
      1:Begin pp:=1;fx:=8;fy:=8;m:=10;;DrawField;break End;
      2:Begin pp:=2;fx:=16;fy:=16;m:=40;;DrawField;break End;
      3:Begin pp:=3;fx:=32;fy:=16;m:=100;DrawField;break End;
      4:Begin pp:=4;fx:=37;fy:=24;m:=200;DrawField;break End;
      6:Begin DisPicture;hidemouse;dispose(p2);CloseGraph;halt End;
      Else Begin Hidemouse;Putimage(dx-12,dy-55,p2^,0);press:=0;b2:=0;initmouse;break End;
      End;
    End;
    b2:=press;
  End;
  press:=0;b2:=0;
  dispose(p2);
  hidemouse;
  Putimage(dx-10,dy-75,p[3,2]^,0);
  Settextstyle(0,0,1);
  initmouse;
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
  if (press=0)and(b2=1)then
  Begin
    if (xcord>dx+fx*8-13)and(ycord>dy-40)and(xcord<dx+fx*8+13)and(ycord<dy-18) then
      Begin hidemouse;PutImage(dx+fx*8-13,dy-40,p[2,2]^,0);Delay(5000);DrawField;initmouse;b2:=0; End;
    if (xcord>dx-10)and(ycord>dy-75)and(xcord<dx+30)and(ycord<dy-57) then menu_File;
  End;
  if (xcord>dx-16)and(xcord<dx+fx*16)and(ycord>dy-16)and(ycord<dy+fy*16) then
  Begin
  if block and(fi[x,y]in[0,4,5,9,14,15])and(press=0)and(b2=2)then
  Begin
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
  numbers(0,rb);
  initmouse;
  End;
  if block and(fi[x,y]in[0,9])and(Press=0)and(b2=1)then
  Begin
     if fi[x,y]=9 then
     Begin
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
{    if keypressed then break;}
    GetTime(hh,hh,tt1,hh);
    If Block and(tt1<>tt2) then Begin tt2:=tt1;inc(Time);numbers(1,time) End;
    Releas;
    b2:=Press;xc:=Xcord;yc:=Ycord;
  End;
end;
Begin
  Randomize;
  fx:=8;fy:=8;m:=10;pp:=1;
  InitGraph(x,y,'');
  InitPicture;
  DrawField;
  InitMouse;
  GetMouseAction;
  Dispicture;
  HideMouse;
  Closegraph;
End.