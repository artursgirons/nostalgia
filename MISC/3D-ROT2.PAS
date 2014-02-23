Program Rotation;
uses graph,crt;
Type
    point_position=array[1..3]of real;
    plane_position=array[1..5]of point_position;
    cube_coordinates=array[1..6]of plane_position;
Var
    c:char;
    pcos,ncos,psin,nsin:real;
    gm,gd:integer;
Const cube:cube_coordinates=
(((-25,-25,25),(25,-25,25),(25,25,25),(-25,25,25),(0,0,25)),
((-25,-25,-25),(25,-25,-25),(25,-25,25),(-25,-25,25),(0,-25,0)),
((-25,25,25),(25,25,25),(25,25,-25),(-25,25,-25),(0,25,0)),
((-25,-25,-25),(-25,-25,25),(-25,25,25),(-25,25,-25),(-25,0,0)),
((25,-25,25),(25,-25,-25),(25,25,-25),(25,25,25),(25,0,0)),
((-25,25,-25),(25,25,-25),(25,-25,-25),(-25,-25,-25),(0,0,-25)));

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
        vertex[j].x :=2 * 150 + round(cube[i,j,1]);
        vertex[j].y :=getmaxy div 2 + round(cube[i,j,2]);
     end;
     line(vertex[1].x,vertex[1].y,vertex[2].x,vertex[2].y);
     line(vertex[2].x,vertex[2].y,vertex[3].x,vertex[3].y);
     line(vertex[3].x,vertex[3].y,vertex[4].x,vertex[4].y);
     line(vertex[4].x,vertex[4].y,vertex[1].x,vertex[1].y);
  end;
end;

Procedure initsc;
begin
pcos:=cos(3 * 2 * pi / 360);
ncos:=cos(-3 * 2 * pi / 360);
psin:=sin(3 * 2 * pi / 360);
nsin:=sin(-3 * 2 * pi / 360);
end;

begin
gm:=3;gd:=1;
initgraph(gm,gd,'');
initsc;
while not keypressed do
begin
display(10);
delay(10);
display(0);
roty;rotx;rotz;
end;
closegraph;
end.










