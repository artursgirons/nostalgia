program Tests;
uses crt,dos;
var ke:byte absolute $40:$17;
    a:byte;
    r:registers;
begin
repeat
ke:=ke xor $20;r.ax:=$0200;intr($16,r);delay(100);
ke:=ke xor $40;r.ax:=$0200;intr($16,r);delay(100);
ke:=ke xor $10;r.ax:=$0200;intr($16,r);delay(100);
until keypressed;
end.