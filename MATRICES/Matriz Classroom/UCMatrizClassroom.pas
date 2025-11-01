unit UCMatrizClassroom;

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
          Celdas: Array[1..MaxF,1..MaxC] of Real;
      Public
          Function Filas:Word;
          Function Columnas:Word;
          Procedure Dimensionar(Nf,Nc:Word);
          Function getCelda(F,C:Word):Real;
          Procedure cargarAleatorio;
          Procedure setCelda(F,C:Word; E:Real);
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

          //3 parcial
          procedure cargarEXAMEN;
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

procedure Matriz.cargarAleatorio;
var
  I,J: Integer;
begin
     Randomize;
     for I := 1 to NroFilas do
        for J := 1 to NroColumnas do
          Celdas[i,j]:=Random(100);
end;

procedure Matriz.cargarEXAMEN;
var
  i,a,b,c,arr,abj,tope: Integer;
begin
    a:=0; b:=1; arr:=1; abj:=Nrofilas; tope:=1;
    while arr<=abj do
    begin
      for i := NroColumnas downto tope do
        Celdas[arr,i]:=a+b;
        for i := arr+1 to abj-1 do
          Celdas[i,tope]:=a+b-1;
          for i := tope to Nrocolumnas do
            Celdas[abj,i]:=a+b;

      c:=a+b; a:=b; b:=c; Inc(arr); Dec(abj); Inc(tope);
    end;
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

function Matriz.getCelda(F, C: Word): Real;
begin
     if (F>0)And(F<=NroFilas)And(C>0)And(C<=NroColumnas) then
          Result:=Celdas[F,C]
     else raise Exception.Create('Error Message');
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
  a: Real;
begin
     a:=Celdas[i,j];
     Celdas[i,j]:=Celdas[k,l];
     Celdas[k,l]:=a;
end;

procedure Matriz.IntercambiarFila(fi, ff: Word);
Var
   a : Real;
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

procedure Matriz.setCelda(F, C: Word; E: Real);
begin
     if (F>0)And(F<=NroFilas)And(C>0)And(C<=NroColumnas) then
         Celdas[F,C]:=E
     Else raise Exception.Create('Error Message');
end;

end.
