uses graph,openbmp,crt;
var a,b:integer;
    c:array[1..5]of integer;
    f:file;
    p:pointer;
Begin
 assign(f,'c:\swiper\MSweeper.spr');
 Rewrite(f,1);
 initgraph(a,b,'');
 draw(0,-1,'c:\swiper\fbuttons.bmp',false);
 c[1]:=imagesize(0,0,15,15);
   for b:= 0 to 8 do
   Begin
     getmem(p,c[1]);
     getimage(b*16,0,b*16+15,15,p^);
     blockwrite(f,p^,c[1]);
     dispose(p);
   End;
cleardevice;
 draw(0,-1,'c:\swiper\Sbuttons.bmp',false);
 c[2]:=imagesize(0,0,25,25);
   for b:= 0 to 4 do
   Begin
     getmem(p,c[2]);
     getimage(b*26,0,b*26+25,25,p^);
     blockwrite(f,p^,c[2]);
     dispose(p);
   End;
cleardevice;

 draw(0,-1,'c:\swiper\mbutton.bmp',false);
 c[3]:=imagesize(0,0,39,17);
   for b:= 0 to 3 do
   Begin
     getmem(p,c[3]);
     getimage(b*40,0,b*40+39,17,p^);
     blockwrite(f,p^,c[3]);
     dispose(p);
   End;
cleardevice;

 draw(0,-1,'c:\swiper\numbers.bmp',false);
 c[4]:=imagesize(0,0,10,20);
   for b:= 0 to 10 do
   Begin
     getmem(p,c[4]);
     getimage(b*11,0,b*11+10,20,p^);
     blockwrite(f,p^,c[4]);
     dispose(p);
   End;
cleardevice;

 draw(0,-1,'c:\swiper\nfield.bmp',false);
 c[5]:=imagesize(0,0,40,24);
 getmem(p,c[5]);
 getimage(0,0,40,24,p^);
 blockwrite(f,p^,c[5]);
 dispose(p);


 Close(f);
 closegraph;
End.