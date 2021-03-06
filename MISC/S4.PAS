Program Stars;
Uses Graph,Crt;
Type StarT=Record x,y:Real End;
    point_position=array[1..3]of real;
    plane_position=array[1..5]of point_position;
    cube_coordinates=array[1..6]of plane_position;
Const n=40;
Const cube:cube_coordinates=
(((-25,-25,25),(25,-25,25),(25,25,25),(-25,25,25),(0,0,25)),
((-25,-25,-25),(25,-25,-25),(25,-25,25),(-25,-25,25),(0,-25,0)),
((-25,25,25),(25,25,25),(25,25,-25),(-25,25,-25),(0,25,0)),
((-25,-25,-25),(-25,-25,25),(-25,25,25),(-25,25,-25),(-25,0,0)),
((25,-25,25),(25,-25,-25),(25,25,-25),(25,25,25),(25,0,0)),
((-25,25,-25),(25,25,-25),(25,-25,-25),(-25,-25,-25),(0,0,-25)));
Var s:Array[1..2,1..n] of StarT;
    Xx,Yy:Real;
    Gm,Gd:Integer;
    a,b,c:byte;
    pcos,ncos,psin,nsin:real;

Procedure RotX;
var y1,z1:real;
    i,j:byte;
begin
for i:=1 to 6 do
 for j:=1 to 5 do
 begin
      y1:=pcos * cube[i,j,2] - psin * cube[i,j,3];
      z1:=psin * cube[i,j,2] + pcos * cube[i,j,3];
      cube[i,j,2]:=y1;
      cube[i,j,3]:=z1;
 end;
end;
Procedure RotY;
var x1,z1:real;
    i,j:byte;
begin
for i:=1 to 6 do
 for j:=1 to 5 do
 begin
      x1:=pcos * cube[i,j,1] - psin * cube[i,j,3];
      z1:=psin * cube[i,j,1] + pcos * cube[i,j,3];
      cube[i,j,1]:=x1;
      cube[i,j,3]:=z1;
 end;
end;

Procedure RotZ;
var x1,y1:real;
    i,j:byte;
begin
for i:=1 to 6 do
 for j:=1 to 5 do
 begin
      y1:=pcos * cube[i,j,2] - psin * cube[i,j,1];
      x1:=psin * cube[i,j,2] + pcos * cube[i,j,1];
      cube[i,j,2]:=y1;
      cube[i,j,1]:=x1;
 end;
end;

Procedure Display(co:byte);
var i,j,a:byte;
    c:byte;
    vertex:array[1..4]of pointtype;
begin
setcolor(co);
for i:=1 to 6 do
  if cube[i,5,3]>0 then
  begin
     for j:=1 to 4 do
     begin
        vertex[j].x :=320 + round(cube[i,j,1]);
        vertex[j].y :=175+round(cube[i,j,2] / 1.3);
     end;
     line(vertex[1].x,vertex[1].y,vertex[2].x,vertex[2].y);
     line(vertex[2].x,vertex[2].y,vertex[3].x,vertex[3].y);
     line(vertex[3].x,vertex[3].y,vertex[4].x,vertex[4].y);
     line(vertex[4].x,vertex[4].y,vertex[1].x,vertex[1].y);
  end;
end;

Procedure initsc;
var u,i:real;
begin
if (yy=0)and(xx<>0) then u:=xx else u:=yy;
if (xx=0)and(yy<>0) then i:=yy else i:=xx;
pcos:=cos(3 * i * pi / 360);
psin:=sin(3 * u * pi / 360);
end;

Procedure Key;
Var Ch:Char;
Begin
Ch:=ReadKey;if Ord(Ch)=0 then Ch:=ReadKey;
Case ord(Upcase(ch)) of
  80:Yy:=Yy+0.3;
  72:Yy:=Yy-0.3;
  77:Xx:=Xx+0.3;
  75:Xx:=Xx-0.3;
  13:Begin Xx:=0;Yy:=0 End;
  27:Begin CloseGraph;Halt End;
End;
End;
Begin
Randomize;
Gm:=3;Gd:=1;
InitGraph(Gm,Gd,'');
for a:=1 to n do Begin s[1,a].x:=Random(640);s[1,a].y:=Random(350) End;
for a:=1 to (n div 2) do Begin s[2,a].x:=Random(640);s[2,a].y:=Random(350) End;
xx:=0.3;yy:=0.6;initsc;
While True do
Begin
  If Keypressed Then
  Begin
  Key;
  initsc;
  End;
  c:=1-c;
  setactivepage(c);
  Cleardevice;
    for b:=1 to 2 do
    for a:=1 to (n div b) do
    Begin
      s[b,a].x:=s[b,a].x+(xx*(b*2-1));
      s[b,a].y:=s[b,a].y+(yy*(b*2-1));
      if s[b,a].x<0   then s[b,a].x:=640+s[b,a].x;
      if s[b,a].x>640 then s[b,a].x:=s[b,a].x-640;
      if s[b,a].y<0   then s[b,a].y:=350+s[b,a].y;
      if s[b,a].y>350 then s[b,a].y:=s[b,a].y-350;
      Putpixel(Round(s[b,a].x),Round(s[b,a].y),3+((b-1)*8));
    End;
  Setcolor(2);OutTextXY(270,2,'Kube in Space');
  if Yy<>0 then rotx;
  if Xx<>0 then roty;
  display(10);
{  rotz;}
  Setvisualpage(c);
End;
End.
