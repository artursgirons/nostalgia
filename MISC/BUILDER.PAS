Uses graph;
const
Pic:array[0..24]of string[27]=(
'          ������           ',
'         ���������         ',
'�       ��������� �       �',
'���     �������   �     ���',
' ���   �    ���    �   ��� ',
' � ��   yyyy � yyyy   �� � ',
' �  �� yyyyyy yyyyyy ��� � ',
' �� �  yyy yy yy yyy  ���  ',
'  �� �� yyyy   yyyy �� ��  ',
'  � ����    ���    ���� �  ',
'  � �� � ������   ���   �  ',
'  ���   ���������� ���� �  ',
'   � � ������������ �� �   ',
'     � ������������  ��    ',
'     �  ����������    ��   ',
'    � ��          ���  ��  ',
'   � �����      ������ ��  ',
'   ��  ���������      ��   ',
'    �� ����������    ��    ',
'      �          ����      ',
'      ���������������      ',
'        ���������          ',
'                 �         ',
'         ���������         ',
'          �������          ');
var a,b,c,l:word;
    gm,gd:integer;
    p:pointer;
    f:file;
Begin
initgraph(gm,gd,'');
for b:=0 to 24 do
  for a:=1 to 27 do
  Begin
    if pic[b,a]='�' then putpixel(a,b+1,11);
    if pic[b,a]='y' then putpixel(a,b+1,10);
  End;
l:=imagesize(1,1,25,28);
getmem(p,l);
getimage(1,1,27,25,p^);
putimage(100,100,p^,1);
readln;
assign(f,'Kuza.spr');
rewrite(f,1);
blockwrite(f,p^,l);
close(f);
closegraph;
End.