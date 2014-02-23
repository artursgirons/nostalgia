uses crt;
var x,Y:integer;
    A:CHAR;
LABEL BEG;
begin
RANDOMIZE;
BEG:
X:=RANDOM(60);
Y:=RANDOM(11);
window(X,Y,X+RANDOM(10),Y+RANDOM(10));
TextBackground(Random(8));
TextColor(Random(7)+9);
ClrScr;
REPEAT
A:=READKEY;
IF A='Q' THEN GOTO BEG;
IF A=CHR(13) THEN
REPEAT
WRITE(CHR(RANDOM(90)+30));
UNTIL KEYPRESSED;
WRITE(A);
UNTIL A=CHR(27);
end.