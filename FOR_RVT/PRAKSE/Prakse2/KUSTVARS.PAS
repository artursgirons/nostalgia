Program Krusvardu_miklu_veidotajs_PRAKSE;
Const Alpha=['A'..'Z'];
Var M:Array[0..200,0..200]of Char;
    W:Array[1..52] of String[20];
    S1,S2:String[20];
    X,Y,Size,a,b,c,k:Byte;
    Ftxt:Text;
    Ffin:File of Char;
    Sett:set of Char;
    Ch:Char;
    Bul:Boolean;

Function Compare:Boolean;
Begin
  Sett:=[];
  For k:=1 to Length(W[a]) do Sett:=sett+[W[a,k]];
  If M[x,y] in Sett then Compare:=True Else Compare:=False;
End;

Procedure AddToW;
Begin
  Assign(Ftxt,'Vardi.txt'); Reset(Ftxt); a:=0;
  While not Eof(Ftxt) do Begin Inc(a); Readln(Ftxt,S1); W[a]:=S1 End;
  Bul:=True;
  While bul do
  Begin
    Bul:=False;
    For b:=1 to a-1 do
      If Length(W[B])<Length(W[B+1]) then Begin S1:=W[b]; W[b]:=W[b+1]; W[B+1]:=S1;bul:=True End;
  End;
  Close(Ftxt); W[a+1]:='***';
End;

Procedure PopUp;
Var p:Byte;
Begin For p:=a to 51 do W[p]:=W[p+1]; End;

Function FillIn:boolean;
Var k,h,x1,y1:Byte;
    P:^byte;
    BB:boolean;
Begin
  X1:=x;y1:=y;Fillin:=false;
  {**************************INFILTRATE THE WORD in X ************************}
  If not((M[X+1,Y]in Alpha)or(M[X-1,Y]in Alpha)) then
  Begin
    For k:=1 to length(W[a]) do
    Begin
      X1:=X-k+1;
      if (x1>0)and(x1<200-length(W[a])) then
      Begin
        BB:=true;
        if (M[x1-1,y]in Alpha)or (M[x1+Length(W[a]),y]in Alpha)then BB:=False;
        For H:=1 to Length(W[a]) do
        Begin
          if ((W[a,h]<>M[x1-1+h,y])and(M[x1-1+h,y]<>#0)) Then BB:=false;
          If (m[x1-1+h,y]=#0)and((M[X1-1+h,y+1]in Alpha)or(M[X1-1+h,y-1]in Alpha)) then BB:=False;
        End;
        If bb then
        Begin
          for H:=1 to length(W[a]) do M[x1-1+h,y]:=W[a,h];
          FillIn:=True;Exit;
        End;
      End;
    End;
  End;
  {**************************INFILTRATE THE WORD in Y ************************}
  If not((M[X,Y+1]in Alpha)or(M[X,Y-1]in Alpha)) then
  Begin
    For k:=1 to length(W[a]) do
    Begin
      y1:=y-k+1;
      if (y1>0)and(y1<200-length(W[a])) then
      Begin
        BB:=true;
        if (M[x,y1-1]in Alpha)or (M[x,y1+Length(W[a])]in Alpha)then BB:=False;
        For H:=1 to Length(W[a]) do
        Begin
          if ((W[a,h]<>M[x,y1-1+h])and(M[x,y1-1+h]<>#0)) Then BB:=false;
          If (M[x,y1-1+h]=#0)and((M[x+1,y1-1+h]in Alpha)or(M[x-1,y1-1+h]in Alpha)) then BB:=False;
        End;
        If bb then
        Begin
          for H:=1 to length(W[a]) do M[x,y1-1+h]:=W[a,h];
          FillIn:=True;Exit;
        End;
      End;
    End;
  End;
End;

Procedure Run;
Begin
  For a:=1 to length(W[1]) do M[100,100+a]:=W[1,a];a:=1;Popup;
  A:=1;
  While W[a]<>'***' do
  Begin
    X:=100;
    Bul:=false;
    For c:=1 to 100 do
    Begin
      For Y:=X       downto 100-c do
        Begin If Bul then Break;If compare then if fillin then Begin PopUp;Bul:=True;a:=0; End;end;
      For X:=100+c-2 downto 100-c do
        Begin If Bul then Break;If compare then if fillin then Begin PopUp;Bul:=True;a:=0; End;end;
      For Y:=X+1     to     100+c do
        Begin If Bul then Break;If compare then if fillin then Begin PopUp;Bul:=True;a:=0; End;end;
      For X:=X+1     to     c+100 do
        Begin If Bul then Break;If compare then if fillin then Begin PopUp;Bul:=True;a:=0; End;end;
      If bul then Break;
    End;
    Inc(a);
  End;
End;

Procedure Print;
Var F:text;
Begin
  Assign(f,'Result.txt');
  Rewrite(f);
  for y:=0 to 200 do
  Begin
    for x:=0 to 200 do
    Begin
      if m[x,y]in alpha then write(f,M[x,y]) else Write(f,' ');
    End;
    Writeln(f);
  End;
  Close(f);
End;

Begin
  AddToW;
  Run;
  Print;
End.
