unit openbmp3;    {raujam vala *.bmp ko ja?     raksti draw(x,y,'cels uz bmp',false); true norauj dazas krasas nost}
{shito nokompile uz diska, lai uztaisitu tpu}
interface
function draw(Var x1,y1:longint;fname:string;transparent:boolean;re:real):integer;
implementation
uses graph;
function draw(Var x1,y1:longint;fname:string;transparent:boolean;re:real):integer;
label bye;
const
     color:array[0..15]of byte =(0,4,2,6,1,5,3,7,8,12,10,14,9,13,11,15);
type
    bmpinfo = record
         h1,h2:char;
         size:longint;
         reserved:longint;
         offset:longint;
         b:longint;
         width:longint;
         height:longint;
         plans:word;
         bpp:word;
    end;
var f:file of bmpinfo;
    bmpf:file of byte;
    res:integer;
    info:bmpinfo;
    x,y:integer;
    b:byte;
    bh:byte;
    bl:byte;
    nb:integer;
    np:integer;
    tpcolor:byte;
    i,j:integer;
    x0,y0:integer;
begin
     assign(f,fname);
     {$I-}
     reset(f);
     {$I+}
     res:=ioresult;
     if res <> 0 then
     begin
          draw:=-1;
          goto bye;
     end;

     read(f,info);
     close(f);
     if info.bpp<>4 then
     begin
          draw:=-2;
          goto bye;
     end;
     x0:=x1;y0:=y1;y1:=info.height;x1:=info.width;
     x:=x0;
     y:=y0+info.height;


     nb:=(info.width div 8)*4;
     if (info.width mod 8)<>0 then nb:=nb+4;
     assign(bmpf,fname);
     reset(bmpf);
     seek(bmpf,info.offset);
     if transparent then
     begin
          read(bmpf,b);
          tpcolor:=b shr 4;
          seek(bmpf,info.offset);
     end
     else tpcolor:=17;

     for i:=1 to info.height do
     begin
          np:=0;
          for j:=1 to nb do
          begin
               {if not eof(bmpf) then}
               read(bmpf,b);
               if np < info.width then
               begin
                    bh:=b shr 4;
                    if bh <> tpcolor
                    then putpixel(x,round(y/re),color[bh]);
                    inc(x);
                    inc(np);
               end;
               if np < info.width then
               begin
                    bl:=b and 15;
                    if bl <> tpcolor
                    then putpixel(x,Round(y/re),color[bl]);
                    inc(x);
                    inc(np);
               end;
          end;
          x:=x0;
          dec(y);
     end;
     close(bmpf);
     draw:=info.height;
     bye:
end;
begin
end.