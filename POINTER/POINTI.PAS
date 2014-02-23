{My sample for adding new record to then end of the string of pointers.}

Program Pointer_Test;
Type T=^TT;
     TT=Record
          Data:Byte;
          Next:T;
        End;
Var Head,Curent,Nev:T;
    Data:Byte;
Begin

 {Free mem for Curent position in string and head of string.}
  New(Curent);
  New(Head);
 {**********************************************************}

  Data:=0;

 {Initialize Start data.}
  Curent^.Data:=Data;
  Curent^.Next:=Nil;
  Head:=Curent;
 {**********************}

  While Data<10 do
  Begin
    Inc(Data);
    New(Nev);
    Nev^.Data:=Data;
    Nev^.Next:=Nil;
    Curent^.Next:=Nev;{Put Tail's pointer to new data}
    Curent:=Nev;      {Make last added pointer as curent pointer}
  End;

 {dispose All pointers. I Hope It does so.}
  While Head<>Nil do
  Begin
    Curent:=Head;
    Writeln(Curent^.Data);
    Head:=Curent^.Next;
    Dispose(Curent);
  End;
 {****************************************}

End.
