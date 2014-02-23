Program Rotation;
Uses Graph,Crt;

Const Pts:array[1..14]of record x,y,z:shortint end=
  ((x:-4;y:7;z:8),(x:4;y:7;z:8),(x:8;y:0;z:8),(x:4;y:-7;z:8),(x:-4;y:-7;z:8),(x:-8;y:0;z:8),(x:-4;y:7;z:8),
  (x:-4;y:7;z:-8),(x:4;y:7;z:-8),(x:8;y:0;z:-8),(x:4;y:-7;z:-8),(x:-4;y:-7;z:-8),(x:-8;y:0;z:-8),(x:-4;y:7;z:-8));
      Rc=-0.55{1.57};{Rotacijas ass nobides lenkis}
Var C:array[1..14]of record x,y,z:Real End;
    F:array[1..14]of record x,y:Integer End;
    Put:array[1..14]of Boolean;
    a,b,p:integer;
    r1,ck:real;

Procedure Draw;
Begin
  p:=1-p;
  setactivepage(p);
  Cleardevice;
  R1:=R1+0.02;If R1>6.28 then r1:=0.04;
  For a:=1 to 14 do
  Begin
    {Pagrieziens Pa Assi, kas ir Perpendikulara ektanam.}
    C[a].x:=Pts[a].x*Cos(rc)+Pts[a].z*Sin(rc);
    C[a].z:=Pts[a].z*Cos(rc)-Pts[a].x*Sin(rc);

    {Pagrieziens Pa assi, kas it Perpendikulara monitora augspusei}
    C[a].x:=c[a].x*Cos(r1)+Pts[a].y*Sin(r1);
    C[a].y:=Pts[a].y*Cos(r1)+c[a].x*Sin(r1);

    {Parveido Par XY Koordinatem un pagriez assi pa kuru griezas uz rc dgr.}
    F[a].x:=Round((c[a].x*Cos(-rc)+c[a].z*Sin(-rc))*14)+320;
    F[a].y:=Round((c[a].z*Cos(-rc)-c[a].x*Sin(-rc))*10)+175;
    Ck:=r1+Pi/3*(a-1);if ck>pi*2 then ck:=ck-pi*2;
    If (ck>1.54)and(ck<5.74) then Put[a]:=true else Put[a]:=false;
  End;

  SetColor(8);Line(Round(320-Sin(rc)*200),Round(175+Cos(rc)*200),Round(320+sin(rc)*200),Round(175-Cos(rc)*200));

  SetColor(7);
  For a:=1 to 6 do If Put[a] then Line(f[a].x,f[a].y,f[a+7].x,f[a+7].y);{Sides}
  For a:=1 to 6 do If True then Line(f[a].x,f[a].y,f[a+1].x,f[a+1].y); {Bottom}
  For a:=8 to 13 do If True then Line(f[a].x,f[a].y,f[a+1].x,f[a+1].y); {Top}

  Setvisualpage(p);
  Delay(500);
End;

Begin
  a:=3;b:=1;
  Initgraph(a,b,'');
  While not keypressed do Draw;
End.
