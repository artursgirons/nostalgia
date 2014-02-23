Program Cubrik;
Uses Graph,Crt;
var p:array[1..2,1..4]of pointer;
    mais,kir:pointer;
    mx,my,a,b,c,x:integer;
    i:array[1..100]of byte;
    Path,str_:string;
    Poz,Poz2,Way:byte;
    yy,y,yb,xx,xb:real;
    F:file;
    Ch:Char;
Procedure GetPic;
Begin
assign(F,'c:\TP\Programs.pas\cubrik\EgaPic.dat');
Reset(f,1);
c:=254;
 for a:=1 to 2 do
  for b:=1 to 4 do
  Begin
    Getmem(p[a,b],c);
    Blockread(F,p[a,b]^,c);
  End;
  c:=258;
  Getmem(mais,c);
  Blockread(F,mais^,c);
  c:=86;
  Getmem(kir,c);
  Blockread(F,kir^,c);
close(f);
End;
Procedure Freepic;
Begin
  For a:=1 to 2 do For b:=1 to 4 do Dispose(p[a,b]);
  dispose(mais);
  dispose(kir);
End;
Begin
Randomize;
GetPic;Way:=1;poz:=1;x:=100;y:=309;
a:=3;b:=1;InitGraph(a,b,'');
for a:=1 to 35 do
Begin
  putimage(1,a*10,kir^,0);
  putimage(630,a*10,kir^,0);
End;
for a:=0 to 63 do
Begin
  putimage(a*10+1,10,kir^,0);
  putimage(a*10+1,340,kir^,0);
End;
Outtextxy(270,1,'Topler 2002');
putimage(x,Round(y),p[Way,Poz]^,0);
mx:=Random(570)+25;my:=Random(255)+25;
putimage(mx,my,mais^,0);
Setfillstyle(1,0);Setcolor(0);
While TRue do
Begin
if keypressed then
Begin
ch:=Readkey;if ord(ch)=0 then ch:=readkey;
Bar(x,Round(y),x+15,round(y)+30);
Case ord(ch) of
  77:begin x:=x+5;Way:=1;i[1]:=1 end;
  75:begin x:=x-5;Way:=2;i[1]:=1 end;
  72:begin
      if keypressed then readkey;
      yy:=4;
      for a:=1 to 100 do if i[a]=1 then Begin if way=1 then xx:=1.5 else xx:=-1.5 ;break End else xx:=0;
      yb:=y;
      xb:=x;
      While true do
      Begin
        Bar(Round(xb),Round(y),Round(xb)+15,Round(y)+30);
        if keypressed then
        Begin
           ch:=readkey; if ord(ch)=0 then ch:=readkey;
           case ord(ch)of
             27:Begin Freepic;closegraph;halt end;
             80:yy:=yy-0.25;
             72:yy:=yy+0.25;
             77:Begin xx:=xx+1.5;way:=1 End;
             75:Begin xx:=xx-1.5;way:=2 End
           End;
           if xx>1.5 then xx:=1.5;if xx<-1.5 then xx:=-1.5;
        End;
        y:=y-yy;
        if y<21 then Begin y:=21;yy:=0 End;
        yy:=yy-0.1;
        xb:=xb+xx;
        if (xb+15>mx)and (xb<mx+21) and (y+25>my)and (y<my+25) then
        Begin
          bar(mx,my,mx+20,my+23);
          mx:=Random(570)+25;my:=Random(255)+25;
          putimage(mx,my,mais^,0);
        End;
        if xb<11 then Begin xb:=11;xx:=0 end;if xb>615 then Begin xb:=615;xx:=0 End;
        if y>=yb then Begin y:=yb;x:=round(xb) End;
        putimage(Round(xb),Round(y),p[Way,Poz]^,0);
        delay(100);
        if y=yb then Break;
        if keypressed then ch:=readkey;
        DELAY(500);
      End;
      end;
  27:Begin CloseGraph;FreePic;Halt End;
End;
inc(Poz2);
if (poz2 mod 4)=0 then poz:=2;
if (poz2 mod 4)=1 then poz:=1;
if (poz2 mod 4)=2 then poz:=2;
if (poz2 mod 4)=3 then poz:=3;
if poz2=4 then poz2:=0;
if x<11 then x:=11;if x>615 then x:=615;
putimage(x,Round(y),p[Way,Poz]^,0);
End;
DELAY(50);
for a:=100 downto 2 do i[a]:=i[a-1];
i[1]:=0;
End;
CloseGraph;
FreePic;
End.