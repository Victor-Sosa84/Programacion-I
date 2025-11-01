unit UCJuego;

interface

Uses SysUtils;

Const

  Niveles: Array[0..3] of array[1..10] of string[10]=
  (
  ('1111111111',
   '1000000001',
   '1005050501',
   '1000000001',
   '1000300001',
   '1000000001',
   '1002020201',
   '1000000001',
   '1000000001',
   '1111111111')
   ,
  ('          ',
   '          ',
   '   11111  ',
   '  1130011 ',
   '  1001001 ',
   '  1024201 ',
   '  1005001 ',
   '  1105011 ',
   '   11111  ',
   '          ')
   ,
  ('          ',
   '          ',
   '  111111  ',
   ' 11000011 ',
   ' 10550001 ',
   ' 10102221 ',
   ' 10001351 ',
   ' 11111111 ',
   '          ',
   '          ')
  ,
  ('          ',
   '          ',
   '  111111  ',
   '  100501  ',
   '  1015011 ',
   '  1005001 ',
   '  1022201 ',
   '  1001301 ',
   '  1111111 ',
   '          ')
  );

MaxF = 10;
MaxC = 10;

type
    Terreno = Class
       Private
           NroFila ,
           NroColum : word;
           Celdas : Array[1..MaxF,1..MaxC] of Byte;
       Public
           Constructor Create; Overload;
           Function Filas: Word;
           Function Columnas: Word;
           Procedure CargarNivel(n: word);
           Function getElement(f,c: word): Byte;
           Procedure intercambiar(f1,c1,f2,c2: word);
           Procedure cambiar(f,c,e: word);
    End;

implementation

{ Terreno }

procedure Terreno.cambiar(f, c, e: word);
begin
    Celdas[f,c]:= e;
end;

procedure Terreno.CargarNivel(n: word);
var
  i,j : word;
begin
   for i := 1 to NroFila do
     for j := 1 to NroColum do
     begin
       if Niveles[n][i][j]<>' ' then Celdas[i][j]:=StrToInt(Niveles[n][i][j])
       else Celdas[i][j]:=100
     end;
end;

function Terreno.Columnas: Word;
begin
    result:= NroColum;
end;

constructor Terreno.Create;
begin
  Nrofila:= MaxF;
  NroColum:= MaxC;
end;

function Terreno.Filas: Word;
begin
    result:= NroFila;
end;

function Terreno.getElement(f, c: word): Byte;
begin
    result:=Celdas[f,c];
end;

procedure Terreno.intercambiar(f1, c1, f2, c2: word);
var
  aux: word;
begin
    aux:=Celdas[f1,c1];
    Celdas[f1,c1]:=Celdas[f2,c2];
    Celdas[f2,c2]:=aux;
end;

end.
