Program Calculator_v1;
uses crt;
var a2,a,rez:real;
    ch1,ch2:char;
Procedure Enter(var c:char);
var s:string;
    cod:integer;
begin
s:='';
gotoxy(1,1);write('               ');gotoxy(1,1);
if round(a)=a then Write(rez:1:0) else write(rez:1:5);
while true do
begin
     c:=readkey;
     if (ord(c)>47) and(ord(c)<58) then begin s:=s+c;gotoxy(1,1);write('          ');gotoxy(1,1);;write(s) end;
     if length(s)>10 then begin Write('Number too large.');readkey;halt end;
     case c of '+','-','*','/','=':
     begin if s='' then exit;val(s,a,cod);exit end;
     chr(13):begin c:=ch1;if s='' then exit;val(s,a,cod);exit end;
      end;
end;
end;
begin
clrscr;
textcolor(15);
while true do
begin
     rez:=0;a:=0;
     enter(ch1);
     rez:=a;
     while true do
     begin
          enter(ch2);
          case ch1 of
          '+':rez:=rez+a;
          '-':rez:=rez-a;
          '*':rez:=rez*a;
          '/':begin if a=0 then break; rez:=rez/a end;
          chr(13):begin
          gotoxy(1,1);write('               ');gotoxy(1,1);
          if round(a)=a then Write(rez:1:0) else write(rez:1:5);
          readkey;break end;
          end;
          ch1:=ch2;
     end;
end;
end.