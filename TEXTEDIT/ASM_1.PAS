Program Asembler;
Procedure CursorOff;
begin;
Asm
 mov ah,$01;
 mov cx,$2000;
 int $10;
End;
end;
Procedure CursorOn;
begin;
Asm
 mov ah,$01;
 mov ch,$6;
 mov cl,$7;
 int $10;
End;
