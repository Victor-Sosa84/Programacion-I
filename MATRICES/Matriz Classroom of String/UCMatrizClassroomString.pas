unit UCMatrizClassroomString;

interface
uses SysUtils;
Const
    MaxF=128;
    MaxC=128;
Type
    Matriz = Class
      Private
          NroFilas,
          NroColumnas : Word;
          Celdas: Array[1..MaxF,1..MaxC] of String;
      Public
          Function Filas:Word;
          Function Columnas:Word;
          Procedure Dimensionar(Nf,Nc:Word);
          Function getCelda(F,C:Word):String;
          Procedure setCelda(F,C:Word; E:String);
          Procedure addFila;
          Procedure AddColumna;
          Procedure InsFila(f:Word);
          Procedure InsColumna(c:Word);
          Procedure delFila(f:Word);
          Procedure delColumna(c:Word);
          Procedure IntercambiarFila(fi,ff:Word);
          Procedure InvertirFilas;
          Procedure Intercambiar(i,j,k,l:Word);
          Procedure RowSort;
          Procedure ColumnSort;
          Procedure FullSort;

          //tareas
          function Birthday(f: Tdate): string;
          function HighestBirthday(Dia,Mes: string):string;
          function HighestYear:word;

          //examen
          procedure ordenarShell;
          procedure shellSortFilas;
    End;

implementation

{ Matriz }

procedure Matriz.AddColumna;
begin
     Inc(NroColumnas);
end;

procedure Matriz.addFila;
begin
     Inc(NroFilas);
end;

function Matriz.Birthday(f: Tdate): string;
var
  i: integer;
  r,s: string;
begin
  i:=1; r:='No existe esa fecha';
  while i<=Nrofilas do
  begin
    s:= Celdas[i,1]+'/'+Celdas[i,2]+'/'+Celdas[i,3];
   if f=StrToDate(s) then
   begin
     r:= Celdas[i,4]; i:= NroFilas;
   end;
   Inc(i)
  end;
  result:= r;
end;

function Matriz.Columnas: Word;
begin
     Result:=NroColumnas;
end;

procedure Matriz.ColumnSort;
var
  I,J,K: Integer;
begin
     for I := 1 to NroColumnas do
        for J := 1 to NroFilas-1 do
            for K := j+1 to NroFilas do
               if Celdas[J,I]>Celdas[K,I] then
                  Intercambiar(j,i,k,i);
end;

procedure Matriz.delColumna(c: Word);
var
  I: Word;
  J: Integer;
begin
     for I := C to NroColumnas-1 do
        for J := 1 to NroFilas do
          Celdas[J,I]:=Celdas[J,I+1];
     Dec(NroColumnas);
end;

procedure Matriz.delFila(f: Word);
var
  I: Word;
  J: Integer;
begin
     for I := F to NroFilas-1 do
        for J := 1 to NroColumnas do
          Celdas[I,J]:=Celdas[I+1,J];
     Dec(NroFilas);
end;

procedure Matriz.Dimensionar(Nf, Nc: Word);
begin
     NroFilas:=Nf;
     NroColumnas:=Nc;
end;

function Matriz.Filas: Word;
begin
     Result:=NroFilas;
end;

procedure Matriz.FullSort;
var
  I,J,K,L,X,Y,Z: Integer;
begin
     for I := 1 to NroFilas do
     Begin
          if I=NroFilas then X:=NroColumnas-1 Else X:=NroColumnas;
          for J := 1 to X do
          Begin
               if J=NroColumnas then Y:=I+1 Else Y:=I;
               for K := Y to NroFilas do
               Begin
                    if K=I then Z:=J+1 Else Z:=1;
                    for L := Z to NroColumnas do
                      if Celdas[I,J]>Celdas[K,L] then
                        Intercambiar(I,J,K,L);
               End;
          End;
     End;
end;

function Matriz.getCelda(F, C: Word): String;
begin
     if (F>0)And(F<=NroFilas)And(C>0)And(C<=NroColumnas) then
          Result:=Celdas[F,C]
     else raise Exception.Create('Error Message');
end;

function Matriz.HighestBirthday(Dia, Mes: string): string;
var
  i,m: Integer;
  r: string;
begin
  m:=HighestYear+1;
  for i := 1 to Nrofilas do
  begin
    if (Celdas[i,1]=Dia) and (Celdas[i,2]=Mes) then
    begin
      if StrToInt(Celdas[i,3])<m then
      begin
        m:=StrToInt(Celdas[i,3]); r:= Celdas[i,4];
      end;
    end;
  end;
  result:= r;
end;

function Matriz.HighestYear: word;
var
  m,i: integer;
begin
  m:=0;
  for i := 1 to Nrofilas do
  begin
    if StrToInt(Celdas[i,3])>m then m:=StrToInt(Celdas[i,3])
  end;
  result:= m;
end;

procedure Matriz.InsColumna(c: Word);
var
  I: Word;
  J: Integer;
begin
     Inc(NroColumnas);
     for I := NroColumnas to c+1 do
        for J := 1 to NroFilas do
          Celdas[J,I]:=Celdas[J,I-1];
end;

procedure Matriz.InsFila(f: Word);
var
  I: Word;
  J: Integer;
begin
     Inc(NroColumnas);
     for I := NroFilas to f+1 do
        for J := 1 to NroColumnas do
          Celdas[I,J]:=Celdas[I-1,J];
end;

procedure Matriz.Intercambiar(i, j, k, l: Word);
Var
  a: String;
begin
     a:=Celdas[i,j];
     Celdas[i,j]:=Celdas[k,l];
     Celdas[k,l]:=a;
end;

procedure Matriz.IntercambiarFila(fi, ff: Word);
Var
   a : String;
  I: Integer;
begin
     for I := 1 to NroColumnas do
     Begin
          a:=Celdas[fi,i];
          Celdas[fi,i]:=Celdas[ff,i];
          Celdas[ff,i]:=a;
     End;
end;

procedure Matriz.InvertirFilas;
Var
   i,f: Word;
begin
     i:=1;f:=NroFilas;
     while i<f do
     Begin
         IntercambiarFila(i,f);
         inc(i);Dec(f);
     End;
end;

procedure Matriz.ordenarShell;
begin
  ShellSortFilas;
end;

procedure Matriz.RowSort;
var
  I,J,K: Integer;
begin
     for I := 1 to NroFilas do
        for J := 1 to NroColumnas-1 do
            for K := j+1 to NroColumnas do
               if Celdas[i,j]>Celdas[i,k] then
                  Intercambiar(i,j,i,k);

end;

procedure Matriz.setCelda(F, C: Word; E: String);
begin
     if (F>0)And(F<=NroFilas)And(C>0)And(C<=NroColumnas) then
         Celdas[F,C]:=E
     Else raise Exception.Create('Error Message');
end;

procedure Matriz.shellSortFilas;
var
  Interval, i: Integer;
begin
  Interval := NroFilas div 2;
  while Interval > 0 do
  begin
    for i := 1 to NroFilas-Interval do
    begin
      if Celdas[i,1]>Celdas[i+interval,1] then
        intercambiarFila(i, i+interval)
      else if Celdas[i,1]=Celdas[i+interval,1] then
         if Celdas[i,2]>Celdas[i+interval,2] then
           intercambiarFila(i, i+interval)
         else if Celdas[i,3]>Celdas[i+interval,3] then
                intercambiarFila(i, i+interval)
    end;
    Interval := Interval div 2;
  end;
end;

end.
