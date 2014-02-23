Uses graph,crt,dos;
const masks:array[0..1,0..15]of word=(
($feff,$feff,$f83f,$f6df,$efef,$dff7,$dff7,$0ee1,$dff7,$dff7,$efef,$f6df,$f83f,$feff,$feff,$ffff),
($0100,$0100,$07c0,$0920,$1010,$2008,$2008,$f11e,$2008,$2008,$1010,$0920,$07c0,$0100,$0100,$0000));
var a,b,b2,l:word;
    c,sp:longint;
    u,ax,ay,gm,gd,x,y,x2,y2,h,score:integer;
    p,p2,p3:pointer;
    f:file;
    st:string;
    r:registers;
    ch:char;
Procedure InitMous;var r:registers; begin r.ax:=$01;intr($33,r);End;
Procedure CloseMous;var r:registers; begin r.ax:=$02;intr($33,r);End;
Begin
Randomize;
assign(f,'c:\tp\programs.pas\kuzakill\kuza.spr');
reset(f,1);l:=filesize(f);getmem(p,l);blockread(f,p^,l);
close(f);
assign(f,'c:\tp\programs.pas\kuzakill\kuzadeth.spr');
reset(f,1);l:=filesize(f);getmem(p3,l);blockread(f,p3^,l);
close(f);
gm:=3;gd:=1;initgraph(gm,gd,'');
setfillstyle(1,0);b:=1;
cleardevice;
setcolor(10);outtextxy(600,340,'Exit');
c:=300000;sp:=300000;ax:=100;ay:=100;u:=0;
p2:=@masks;r.ax:=$09;r.bx:=$a;r.cx:=$a;r.es:=seg(p2^);r.dx:=ofs(p2^);intr($33,r);
initmous;
while true do
begin
  if (keypressed) then begin ch:=readkey ;if ch=chr(27) then Begin dispose(p);dispose(p2);dispose(p3);closegraph;halt;End;end;
  r.ax:=$03;intr($33,r);b:=r.bl;x:=r.cx;y:=r.dx;
  if (b=1)and(b2=0) then
  Begin
    sound(500);delay(20);nosound;
    if (x >600) and (y >340)then Begin dispose(p);dispose(p2);dispose(p3);closegraph;halt;End;
    if (x >ax) and (x<ax+28)and(y >ay)and(y<ay+28)then Begin sp:=sp-500;if sp<2 then sp:=2;u:=1;c:=sp;inc(score)end;
  End;
  b2:=b;
  if c>=sp then
  Begin
    c:=0;
    closemous;
    str(score,st);
    bar(1,340,120,350);
    outtextxy(1,340,'Score : '+st);
    if u=1 then Begin putimage(ax,ay,p3^,0);initmous;u:=0;delay(15000);closemous;end;
    bar(ax,ay,ax+30,ay+30);
    ax:=random(610);
    ay:=random(300)+10;
    putimage(ax,ay,p^,0);
    initmous;
  end;
  inc(c);
end;
End.