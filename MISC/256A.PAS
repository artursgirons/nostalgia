uses Graph;

var
  Driver, Mode,
  TestDriver,
  ErrCode, i: Integer;

begin
  { ��⠭���� �ࠩ��� }
  TestDriver := InstallUserDriver('VGA256', nil);
  Driver := Detect;   { ��३� � ����᪨� ०�� }
  InitGraph(Driver, Mode, ' ');
  CloseGraph;
end.


