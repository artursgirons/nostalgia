Program TETRIS;
uses graph,crt;
var x,y,e,score,lin:integer;
    matrix:array[0..30,0..40] of byte;
    xx:array[1..4] of integer;
    yy:array[1..4] of integer;
    ch:char;
    scr,linn:string;
    F,ff,tt,col,n,p,pp,zx,zy,m1,m2,m3,m4,n1,n2,n3,n4,s,l,ll,j,lev,jj:byte;
begin
     x:=detect;
     initgraph (x,y,'');
     e:=graphresult;
     IF e<>0 THEN WRITELN ('ERROR')
     ELSE BEGIN
     CLEARDEVICE;RANDOMIZE;
     setcolor(7);
     rectangle(300,29,500,130);rectangle(300,250,500,390);
     setfillstyle(7,8);Randomize;
     floodfill(400,200,7);
     setfillstyle(1,7);
     bar(10,10,50,50);bar(245,10,285,50);
     bar(50,20,255,30);
     rectangle(29,29,265,400);
     setviewport(30,30,264,390,clipoff);
     setcolor(1);
     lev:=1;outtextxy(280,250,'SCORE 0');
     clearviewport;
     REPEAT
     F:=random(7)+1;
     for zy:=0 to 40 do begin
              for zx:=0 to 25 do begin
              setfillstyle(1,matrix[zx,zy]);
              bar(zx*9,zy*9,(zx*9)+8,(zy*9)+8);
              end;
          end;
     case F of
          1:begin xx[1]:=108;xx[2]:=108;xx[3]:=108;xx[4]:=108;{ desa}
                  yy[1]:=0;yy[2]:=9;yy[3]:=18;yy[4]:=27;col:=4;end;
          3:begin xx[1]:=108;xx[2]:=117;xx[3]:=117;xx[4]:=117;{L}
                  yy[1]:=0;yy[2]:=0;yy[3]:=9;yy[4]:=18;col:=6;end;
          2:begin xx[1]:=108;xx[2]:=117;xx[3]:=108;xx[4]:=108;col:=1;{L}
                  yy[1]:=0;yy[2]:=0;yy[3]:=9;yy[4]:=18;end;
          4:begin xx[1]:=108;xx[2]:=117;xx[3]:=108;xx[4]:=117;{klucis}
                  yy[1]:=0;yy[2]:=0;yy[3]:=9;yy[4]:=9;col:=14;end;
          5:begin xx[1]:=117;xx[2]:=108;xx[3]:=117;xx[4]:=108;{5 Z}
                  yy[1]:=0;yy[2]:=9;yy[3]:=9;yy[4]:=18;col:=5;end;
          6:begin xx[1]:=108;xx[2]:=108;xx[3]:=117;xx[4]:=117;{6 Z}
                  yy[1]:=0;yy[2]:=9;yy[3]:=9;yy[4]:=18;col:=2;end;
          7:begin xx[1]:=117;xx[2]:=108;xx[3]:=117;xx[4]:=126;{7 T}
                  yy[1]:=0;yy[2]:=9;yy[3]:=9;yy[4]:=9;col:=3;end;
          end; ff:=1;
          for n:=1 to 40 do begin
          if (matrix[1,n]>0) and (matrix[2,n]>0) and (matrix[3,n]>0) and (matrix[4,n]>0)
          and(matrix[5,n]>0) and(matrix[6,n]>0) and(matrix[7,n]>0) and(matrix[8,n]>0)
          and(matrix[9,n]>0) and(matrix[10,n]>0) and(matrix[11,n]>0) and(matrix[12,n]>0)
          and(matrix[13,n]>0) and(matrix[14,n]>0) and(matrix[15,n]>0) and(matrix[16,n]>0)
          and(matrix[17,n]>0) and(matrix[18,n]>0) and(matrix[19,n]>0) and(matrix[20,n]>0)
          and(matrix[21,n]>0) and(matrix[22,n]>0) and(matrix[23,n]>0) and(matrix[24,n]>0)
          and(matrix[25,n]>0)and(matrix[0,n]>0) then begin
          score:=score+10;
          str(score,scr);setcolor(1);setfillstyle(1,0);bar(280,250,460,265);
          outtextxy(280,250,'SCORE '+ scr);lin:=lin+1;
          str(lin,linn);bar(280,270,460,285);outtextxy(280,270,'LINES '+linn);
          for tt:=0 to 25 do begin
          matrix[tt,n]:=0;
          end;
          for p:=n downto 1 do begin
              for pp:=0 to 25 do begin
              matrix[pp,p]:=matrix[pp,p-1];
              end;
          end;
          for zy:=0 to 40 do begin
              for zx:=0 to 25 do begin
              setfillstyle(1,matrix[zx,zy]);
              bar(zx*9,zy*9,(zx*9)+8,(zy*9)+8);
              end;
          end;end;end;
          s:=100;
          repeat randomize;
          n1:=(yy[1] div 9);n2:=(yy[2] div 9);n3:=(yy[3] div 9);n4:=(yy[4] div 9);
          m1:=(xx[1] div 9);m2:=(xx[2] div 9);m3:=(xx[3] div 9);m4:=(xx[4] div 9);
          matrix[m1,n1]:=0;matrix[m2,n2]:=0;matrix[m3,n3]:=0;matrix[m4,n4]:=0;
          if (matrix[m1,n1+1]>0)or(matrix[m2,n2+1]>0)or(matrix[m3,n3+1]>0)or(matrix[m4,n4+1]>0)then begin
          break;end;
          setfillstyle(1,0);
          bar(xx[1],yy[1],xx[1]+8,yy[1]+8);
          bar(xx[2],yy[2],xx[2]+8,yy[2]+8);
          bar(xx[3],yy[3],xx[3]+8,yy[3]+8);
          bar(xx[4],yy[4],xx[4]+8,yy[4]+8);
          yy[1]:=yy[1]+1;yy[2]:=yy[2]+1;yy[3]:=yy[3]+1;yy[4]:=yy[4]+1;
          if keypressed then begin
          ch:=readkey;randomize;
          case ord(ch) of
               77:begin xx[1]:=xx[1]+l;xx[2]:=xx[2]+l;xx[3]:=xx[3]+l;xx[4]:=xx[4]+l;
               yy[1]:=yy[1]-1;yy[2]:=yy[2]-1;yy[3]:=yy[3]-1;yy[4]:=yy[4]-1;
               sound(330);delay(200) end;
               75:begin xx[1]:=xx[1]-ll;xx[2]:=xx[2]-ll;xx[3]:=xx[3]-ll;xx[4]:=xx[4]-ll;
               yy[1]:=yy[1]-1;yy[2]:=yy[2]-1;yy[3]:=yy[3]-1;yy[4]:=yy[4]-1;
               sound(330);delay(400) end;
               80:begin s:=1;sound(330); delay(200) end;
               32:begin sound(100);delay(100);nosound;randomize;
                       if (F=1)and(ff=1) then begin
                          xx[1]:=xx[1]-9;xx[2]:=xx[2];xx[3]:=xx[3]+9;xx[4]:=xx[4]+18;
                          yy[1]:=yy[1]+9;yy[2]:=yy[2];yy[3]:=yy[3]-9;yy[4]:=yy[4]-18;ff:=2;end else
                       if (F=1)and(ff=2) then begin
                          xx[1]:=xx[1]+9;xx[2]:=xx[2];xx[3]:=xx[3]-9;xx[4]:=xx[4]-18;
                          yy[1]:=yy[1]-9;yy[2]:=yy[2];yy[3]:=yy[3]+9;yy[4]:=yy[4]+18;ff:=1;end else
                       if (F=2)and(ff=1) then begin
                          xx[1]:=xx[1];xx[2]:=xx[2]-9;xx[3]:=xx[3]+9;xx[4]:=xx[4]+18;
                          yy[1]:=yy[1];yy[2]:=yy[2]+9;yy[3]:=yy[3];yy[4]:=yy[4]-9;ff:=2;end else
                       if (F=2)and(ff=2) then begin
                          xx[1]:=xx[1]+9;xx[2]:=xx[2]+9;xx[3]:=xx[3];xx[4]:=xx[4]-18;
                          yy[1]:=yy[1]-9;yy[2]:=yy[2]-9;yy[3]:=yy[3];yy[4]:=yy[4];ff:=3;end else
                       if (F=2)and(ff=3) then begin
                          xx[1]:=xx[1]-18;xx[2]:=xx[2]-9;xx[3]:=xx[3];xx[4]:=xx[4]+9;
                          yy[1]:=yy[1]+9;yy[2]:=yy[2];yy[3]:=yy[3]-9;yy[4]:=yy[4];ff:=4;end else
                       if (F=2)and(ff=4) then begin
                          xx[1]:=xx[1]+9;xx[2]:=xx[2]+9;xx[3]:=xx[3]-9;xx[4]:=xx[4]-9;
                          yy[1]:=yy[1];yy[2]:=yy[2];yy[3]:=yy[3]+9;yy[4]:=yy[4]+9;ff:=1;end else
                       if (F=3)and(ff=1) then begin
                          xx[1]:=xx[1];xx[2]:=xx[2];xx[3]:=xx[3]+9;xx[4]:=xx[4]-9;
                          yy[1]:=yy[1]+9;yy[2]:=yy[2]+9;yy[3]:=yy[3];yy[4]:=yy[4];ff:=2;end else
                       if (F=3)and(ff=2) then begin
                          xx[1]:=xx[1]+9; xx[2]:=xx[2];xx[3]:=xx[3]-9;xx[4]:=xx[4]+18;
                          yy[1]:=yy[1]-9;yy[2]:=yy[2];yy[3]:=yy[3]+9;yy[4]:=yy[4];ff:=3;end else
                       if (F=3)and(ff=3) then begin
                          xx[1]:=xx[1]+9;xx[2]:=xx[2]-9;xx[3]:=xx[3];xx[4]:=xx[4];
                          yy[1]:=yy[1]+9;yy[2]:=yy[2]+9;yy[3]:=yy[3];yy[4]:=yy[4];ff:=4;end else
                       if (F=3)and(ff=4) then begin
                          xx[1]:=xx[1]-18;xx[2]:=xx[2]+9;xx[3]:=xx[3];xx[4]:=xx[4]-9;
                          yy[1]:=yy[1]-9;yy[2]:=yy[2]-18;yy[3]:=yy[3]-9;yy[4]:=yy[4];ff:=1;end else
                       if (F=5)and(ff=1) then begin
                          xx[1]:=xx[1]-18;xx[2]:=xx[2];xx[3]:=xx[3]-9;xx[4]:=xx[4]+9;
                          yy[1]:=yy[1]+9;yy[2]:=yy[2];yy[3]:=yy[3]+9;yy[4]:=yy[4];ff:=2;end else
                       if (F=5)and(ff=2) then begin
                          xx[1]:=xx[1]+18;xx[2]:=xx[2];xx[3]:=xx[3]+9;xx[4]:=xx[4]-9;
                          yy[1]:=yy[1]-9; yy[2]:=yy[2];yy[3]:=yy[3]-9;yy[4]:=yy[4];ff:=1;end else
                       if (F=6)and(ff=1) then begin
                          xx[1]:=xx[1]+9;xx[2]:=xx[2]+18;xx[3]:=xx[3]-9; xx[4]:=xx[4];
                          yy[1]:=yy[1]+9;yy[2]:=yy[2];  yy[3]:=yy[3]+9;yy[4]:=yy[4];ff:=2;end else
                       if (F=6)and(ff=2) then begin
                          xx[1]:=xx[1]-9;  xx[2]:=xx[2]-18;xx[3]:=xx[3]+9;xx[4]:=xx[4];
                          yy[1]:=yy[1]-9;yy[2]:=yy[2];  yy[3]:=yy[3]-9;yy[4]:=yy[4];ff:=1;end else
                       if (F=7)and(ff=1) then begin
                          xx[1]:=xx[1];  xx[2]:=xx[2];  xx[3]:=xx[3];xx[4]:=xx[4]-9;
                          yy[1]:=yy[1];yy[2]:=yy[2];yy[3]:=yy[3]; yy[4]:=yy[4]+9;ff:=2;end else
                       if (F=7)and(ff=2) then begin
                          xx[1]:=xx[1]-9;xx[2]:=xx[2]+9;xx[3]:=xx[3]+9;xx[4]:=xx[4];
                          yy[1]:=yy[1]+9;yy[2]:=yy[2];  yy[3]:=yy[3];  xx[4]:=xx[4];ff:=3;end else
                       if (F=7)and(ff=3) then begin
                          xx[1]:=xx[1]+9;
                          yy[1]:=yy[1]-9;ff:=4;end else
                       if (F=7)and(ff=4) then begin
                          xx[1]:=xx[1];  xx[2]:=xx[2]-9;xx[3]:=xx[3]-9;  xx[4]:=xx[4]+9;
                          yy[1]:=yy[1];yy[2]:=yy[2];yy[3]:=yy[3];yy[4]:=yy[4]-9;ff:=1;
                          end;end;
               27: halt
          end;
     end;nosound;l:=9;ll:=9;randomize;
          if (matrix[m1-1,n1]>0)or(matrix[m2-1,n2]>0)or(matrix[m3-1,n3]>0)or(matrix[m4-1,n4]>0) then begin
          ll:=0; end;
          if (matrix[m1+1,n1]>0)or(matrix[m2+1,n2]>0)or(matrix[m3+1,n3]>0)or(matrix[m4+1,n4]>0) then begin
          l:=0; end;
          if (xx[1]<0) or (xx[2]<0) or (xx[3]<0) or (xx[4]<0) then begin
          xx[1]:=xx[1]+9; xx[2]:=xx[2]+9;xx[3]:=xx[3]+9;xx[4]:=xx[4]+9;end;
          if (xx[1]>231) or (xx[2]>231) or (xx[3]>231) or (xx[4]>231) then begin
          xx[1]:=xx[1]-9;xx[2]:=xx[2]-9;xx[3]:=xx[3]-9;xx[4]:=xx[4]-9;end;
          setfillstyle(1,col);
          bar(xx[1],yy[1],xx[1]+8,yy[1]+8);
          bar(xx[2],yy[2],xx[2]+8,yy[2]+8);
          bar(xx[3],yy[3],xx[3]+8,yy[3]+8);
          bar(xx[4],yy[4],xx[4]+8,yy[4]+8);
          delay(5*s);
          until yy[4]>=351;
          sound(100);delay(100);nosound;
          n1:=yy[1] div 9; m1:=xx[1] div 9;
          n2:=yy[2] div 9; m2:=xx[2] div 9;
          n3:=yy[3] div 9; m3:=xx[3] div 9;
          n4:=yy[4] div 9; m4:=xx[4] div 9;
          matrix[m1,n1]:=col;matrix[m2,n2]:=col;matrix[m3,n3]:=col;matrix[m4,n4]:=col;
          if (yy[1]=0) or (yy[2]=0) or (yy[3]=0) or (yy[4]=0)and(xx[1]=108) then begin setcolor(4);
          delay(60000); clearviewport;
          outtextxy(80,150,'GAME OVER');delay(50000);break;readkey;end;
          score:=score+lev;
          str(score,scr);setcolor(1);setfillstyle(1,0);bar(280,250,460,275);
          outtextxy(280,250,'SCORE '+ scr);bar(280,270,460,285);outtextxy(280,270,'LINES '+linn);
     UNTIL col=123;
      end;
end.