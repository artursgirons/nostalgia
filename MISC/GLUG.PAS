uses crt;
Begin
textmode(1110);
repeat
gotoxy(random(80),random(43));Textcolor(random(2)*8+7);write('�');
gotoxy(random(80),random(43));Textcolor(random(2)*8);write('�');
until keypressed;
end.