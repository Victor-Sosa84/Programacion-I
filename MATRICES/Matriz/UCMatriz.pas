unit UCMatriz;

interface

Const
MaxF = 2048;
MaxC = 2048;

type
    Matriz = Class
      Private
          NroFila : word;
          NroColum : word;
          Celdas : Array[1..MaxF,1..MaxC] of Real;
      Public
          Procedure Redimensionar(nf,nc: word);
          function Filas: Word;
          function Columnas: Word;
          function obtElement(f,c: word):real;
          procedure modElement(f,c: word; e:real);
          procedure addFila;
          procedure delFila(f: word);
          procedure insFila(f: word);
          procedure delColum(c: word);
          procedure insColum(c: word);
          procedure addColum;
          procedure intercElement(i,j,k,l: word);
          procedure OrdFila;

          //3 parcial
          procedure cargar;
    End;
implementation

{ Matriz }

procedure Matriz.addColum;
begin
    Inc(NroColum)
end;

procedure Matriz.addFila;
begin
    Inc(NroFila)
end;

procedure Matriz.cargar;
begin

end;

function Matriz.Columnas: Word;
begin
    result:= NroColum;
end;

procedure Matriz.delColum(c: word);
var
  i: Word;
  j: Integer;
begin
    for i := c to NroColum-1 do
      for j := 1 to NroFila do
        Celdas[j,i]:= Celdas[j,i+1];
    Dec(NroColum);
end;

procedure Matriz.delFila(f: word);
var
  i: Word;
  j: Integer;
begin
  for i := f to NroFila-1 do
    for j := 1 to NroColum do
      Celdas[i,j]:=Celdas[i+1,j];
  Dec(NroFila);
end;

function Matriz.Filas: Word;
begin
    result:= NroFila;
end;

procedure Matriz.insColum(c: word);
var
  i: Word;
  j: Integer;
begin
    Inc(NroColum);
    for i := NroColum downto c+1 do
      for j := 1 to NroFila do
        Celdas[j,i]:= Celdas[j,i-1];
end;

procedure Matriz.insFila(f: word);
var
  i,j: Integer;
begin
   Inc(NroFila);
   for i := NroFila downto f+1 do
      for j := 1 to NroColum do
        Celdas[i,j]:=Celdas[i-1,j]
end;

procedure Matriz.intercElement(i,j,k,l: word);
var
  aux: real;
begin
    aux:= Celdas[i,j];
    Celdas[i,j]:=Celdas[k,l];
    Celdas[k,l]:=aux;
end;

procedure Matriz.modElement(f, c: word; e: real);
begin
    Celdas[f,c]:=e;
end;

function Matriz.obtElement(f, c: word): real;
begin
    result:= Celdas[f,c];
end;

procedure Matriz.OrdFila;
begin

end;

procedure Matriz.Redimensionar(nf, nc: word);
begin
    Nrofila:= nf;
    NroColum:= nc;
end;

end.
