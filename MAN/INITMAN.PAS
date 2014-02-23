Uses Graph,Bmp_wiew;
Var a,b,x,y:integer;
    p:pointer;
    f:file;
Begin
x:=3;y:=1;
initgraph(x,y,'');
a:=imagesize(1,1,21,31);
Assign(f,'c:\tp\pascal\man\Man.Spr');
Rewrite(f,a);
getmem(p,a);

Load_bmp(1,1,'c:\tp\pascal\man\man1.bmp');
Getimage(1,1,21,31,p^);
Blockwrite(f,p^,1);

Load_bmp(1,1,'c:\tp\pascal\man\man2.bmp');
Getimage(1,1,21,31,p^);
Blockwrite(f,p^,1);

Load_bmp(1,1,'c:\tp\pascal\man\man3.bmp');
Getimage(1,1,21,31,p^);
Blockwrite(f,p^,1);

Load_bmp(1,1,'c:\tp\pascal\man\man4.bmp');
Getimage(1,1,21,31,p^);
Blockwrite(f,p^,1);

Load_bmp(1,1,'c:\tp\pascal\man\man5.bmp');
Getimage(1,1,21,31,p^);
Blockwrite(f,p^,1);

Load_bmp(1,1,'c:\tp\pascal\man\man6.bmp');
Getimage(1,1,21,31,p^);
Blockwrite(f,p^,1);


Load_bmp(1,1,'c:\tp\pascal\man\man12.bmp');
Getimage(1,1,21,31,p^);
Blockwrite(f,p^,1);

Load_bmp(1,1,'c:\tp\pascal\man\man22.bmp');
Getimage(1,1,21,31,p^);
Blockwrite(f,p^,1);

Load_bmp(1,1,'c:\tp\pascal\man\man32.bmp');
Getimage(1,1,21,31,p^);
Blockwrite(f,p^,1);

Load_bmp(1,1,'c:\tp\pascal\man\man42.bmp');
Getimage(1,1,21,31,p^);
Blockwrite(f,p^,1);

Load_bmp(1,1,'c:\tp\pascal\man\man52.bmp');
Getimage(1,1,21,31,p^);
Blockwrite(f,p^,1);

Load_bmp(1,1,'c:\tp\pascal\man\man62.bmp');
Getimage(1,1,21,31,p^);
Blockwrite(f,p^,1);

Close(f);
Readln;
Closegraph;
End.