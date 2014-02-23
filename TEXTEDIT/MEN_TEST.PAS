Program Menu_use;
uses Menu,crt;
const a:array[1..8] of string=('7','New','Save','Save as','Close','Edit','Ch Dir','Exit');
var b:string;
    k:Byte;
begin
TextBackGround(0);clrscr;
CursorOff;
MenuBar(10,10,a,k);
CursorOn;
MenuBar(20,20,a,k);
end.