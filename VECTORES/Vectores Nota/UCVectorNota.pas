unit UCVectorNota;

interface
Uses Sysutils;
Const
    MaxE=128;
Type
  Nota = Record
    Registro : Cardinal;
    Nombre   : String;
    Materia  : String;
    Semestre : Cardinal;
    Nota     : Real;
  End;

  Universidad = Class
    Private
      Dimension: word;
      Elementos: Array [1..MaxE] of Nota;
    Public
      Function Dim: word;
      Procedure AddElement(e: nota);
      Function GetElement(p: word): nota;
      Procedure Intercambiar(i,j: word);
      Procedure SortName;
      Procedure SortRegister;
  End;

implementation

{ Almacen }

{ Universidad }

procedure Universidad.AddElement(e: nota);
begin
  Inc(Dimension);
  Elementos[Dimension]:= e;
end;

function Universidad.Dim: word;
begin
  result:= Dimension;
end;

function Universidad.GetElement(p: word): nota;
begin
  result:= Elementos[p]
end;

procedure Universidad.Intercambiar(i, j: word);
var
  aux: nota;
begin
  aux:= Elementos[i];
  Elementos[i]:=Elementos[j];
  Elementos[j]:= aux;
end;

procedure Universidad.SortName;
var
  i,j : integer;
begin
   for i := 1 to Dimension-1 do
     for j := i+1 to Dimension do
       if Elementos[i].Nombre>Elementos[j].Nombre then Intercambiar(i,j);
end;

procedure Universidad.SortRegister;
var
  i,j: integer;
begin
  for i := 1 to Dimension-1 do
     for j := i+1 to Dimension do
       if Elementos[i].Registro>Elementos[j].Registro then Intercambiar(i,j);
end;

end.
