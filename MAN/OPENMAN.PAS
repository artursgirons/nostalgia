Uses Graph,crt;
Var a,b:Integer;
    P:Array[1..12] of Pointer;
    F:File;

Procedure InitMan;
Var a,b:integer;
Begin
 b:=ImageSize(1,1,21,31);
 Assign(f,'C:\Tp\Pascal\Man\Man.Spr');
 Reset(f,b);
 For a:=1 to 12 do Begin Getmem(p[a],b);Blockread(f,p[a]^,1);End;
 Close(f);
End;

Procedure DisposeMan;
Begin
 For a:=1 to 12 do Dispose(p[a]);
End;

Procedure MoveMan;
Var Ch:Char;
    X,Y,a,b,c,Pos:Integer;
    yy,y2:real;
Begin
  Pos:=1;X:=100;y:=130;yy:=100;
  Putimage(x,y,p[pos]^,1);
  Setcolor(8);line(0,161,640,161);
  While True do
  Begin
    If keypressed then
    Begin
      Ch:=readkey;
      Setfillstyle(0,0);
      Bar(x,y,x+20,y+30);
      If ord(ch)=0 then
        Begin
        Ch:=Readkey;
        Case ord(ch) of
          77:Begin if not(pos in [11,12,5,6,4,10]) then X:=X+4 else pos:=0;inc(pos);if pos>3 then pos:=1;End;
          75:Begin if not(pos in [11,12,5,6,4,10]) then X:=X-4 else pos:=8;dec(pos);if (pos<7)or(pos>9) then pos:=9;End;
          72:Begin if pos>6 then pos:=11 else pos:=5;End;
          80:Begin if pos>6 then pos:=12 else pos:=6;End;
        End
        End
        Else
        Case ord(ch) of
          27:Exit;
          ord('q'),Ord('Q'):Begin if not(pos in[4,10]) then if (pos>6) then pos:=10 else pos:=4 else
          if (pos>6) then pos:=7 else pos:=1 end;
          ord('w'),Ord('W'):Begin if not(pos in[4,10])and(yy=100) then Begin yy:=1;y2:=y End;end;
        End;
      Putimage(x,y,p[pos]^,1);
    End;
    If yy<100 then
    Begin
      yy:=yy-0.02;
      Setfillstyle(0,0);
      Bar(x,y,x+20,y+30);
      y2:=y2-yy;
      y:=round(y2);
      if y>=130 then Begin y:=130;yy:=100;End;
      Putimage(x,y,p[pos]^,1);
      delay(100);
    End;
  End;
End;

Begin
a:=3;b:=1;
InitGraph(a,b,'');
InitMan;
Moveman;
DisposeMan;
Closegraph;
End.