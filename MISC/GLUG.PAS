uses crt;
Begin
textmode(1110);
repeat
gotoxy(random(80),random(43));Textcolor(random(2)*8+7);write('Û');
gotoxy(random(80),random(43));Textcolor(random(2)*8);write('Û');
until keypressed;
end.