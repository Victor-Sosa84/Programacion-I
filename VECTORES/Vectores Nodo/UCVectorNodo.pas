unit UCVectorNodo;

interface
Uses Sysutils;
Const
    MaxE=128;
Type
  Nodo = Record
    Nodo : Cardinal;
    FechHorS   : Word;
    FechHorL : Word;
    Distancia : Cardinal;
  End;

  Vector = Class
    Private
      Dimension: word;
      Elementos: Array [1..MaxE] of Nodo;
    Public
      Function Dim: word;
      Procedure AddElement(e: nodo);
      Function GetElement(p: word): nodo;
      Procedure Intercambiar(i,j: word);
      Function Velocidad(D,FS,FL: word): real;
      Function VelocidadMayor:real;
  End;

implementation

{ Almacen }

{ Universidad }

procedure Vector.AddElement(e: nodo);
begin
  Inc(Dimension);
  Elementos[Dimension]:= e;
end;

function Vector.Dim: word;
begin
  result:= Dimension;
end;

function Vector.GetElement(p: word): nodo;
begin
  result:= Elementos[p]
end;

procedure Vector.Intercambiar(i, j: word);
var
  aux: nodo;
begin
  aux:= Elementos[i];
  Elementos[i]:=Elementos[j];
  Elementos[j]:= aux;
end;

function Vector.Velocidad(D,FS,FL: word): real;
var
  t: word;
begin
    t:=FL-FS;
   result:= D / t;
end;

function Vector.VelocidadMayor: real;
var
  r: real;
  i: Integer;
begin
  r:= 4093242;
  result:= r;
end;

end.
