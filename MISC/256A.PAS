uses Graph;

var
  Driver, Mode,
  TestDriver,
  ErrCode, i: Integer;

begin
  { Установка драйвера }
  TestDriver := InstallUserDriver('VGA256', nil);
  Driver := Detect;   { Перейти в графический режим }
  InitGraph(Driver, Mode, ' ');
  CloseGraph;
end.


