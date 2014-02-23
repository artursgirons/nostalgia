program Tests2;
uses crt,dos;
var a,b:byte;
    reg:registers;
begin
REPEAT
mem[$40:$17]:= mem[$40:$17] xor $20;
reg.ah:= $b;INTR($21,reg);DELAY(70);
mem[$40:$17]:= mem[$40:$17] xor $40;
reg.ah:= $b;INTR($21,reg);DELAY(70);
mem[$40:$17]:= mem[$40:$17] xor $10;
reg.ah:= $b;INTR($21,reg);DELAY(70);
UNTIL KEYPRESSED;
end.