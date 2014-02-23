uses crt;
var a,b:byte;
    c:string;
procedure xread2(x:byte;y,l:byte;var st:string);
var g,h:byte;
    st2:string;
    ch1:char;
begin
h:=0;st2:='';st:='';
gotoxy(x,y);
While true do
begin
 ch1:=readkey;
 if ch1=chr(13) then exit;
 if ((ord(ch1)>47) and (ord(ch1)<123) or (ord(ch1)=32)) and(h<l) then
   begin h:=h+1;st:=st+ch1;if odd(h) then x:=x-1 end;
 if ch1=chr(8) then
 begin
   if h>0 then
   begin
     h:=h-1;st:='';
     if not(odd(h)) then x:=x+1;
     for g:=1 to h do st:=st+st2[g];
   end;
 end;
 st2:=st;
 gotoxy(x,y);
 write(' ',st+' ');
end;
end;
begin
clrscr;
textcolor(10);
xread2(40,12,20,c);
xread2(40,14,10,c);
end.