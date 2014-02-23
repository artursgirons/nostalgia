Program Dambrete_Drive;
Var a,b,c,d:integer;
    m:Array[0..1,0..19]of Byte;
    f:Array[0..7,0..7]of Byte;

Function Brainy(Const Number,Deep,Color:Byte):Byte;
Var a,b:Byte;
    Result:array[0..19]of byte;
Begin
  While True do
  Begin
    Inc(m[Color,a]);
    if m[Color,Number]>Deep then break;
    if m[Color,a]>Deep then For b:=0 to c-1 do if m[Color,b]>Deep then Begin m[Color,b]:=0;inc(m[Color,b+1]) End;
  End;
End;

Begin
End.