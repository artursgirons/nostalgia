program IndikatorTest;
uses crt;
var b:byte;
    a:byte absolute $40:$17;
begin
randomize;
  while not keypressed do
  begin
  b:=random(3)+1;
    case b of
    1: a:= a xor $20;
    2: a:= a xor $40;
    3: a:= a xor $10;
    end;
  delay(100);
  end;
a:= a and not $20;a:= a and not $40;a:= a and not $10;
end.