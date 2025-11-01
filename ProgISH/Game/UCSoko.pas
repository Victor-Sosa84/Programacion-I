unit UCSoko;

interface

Uses SysUtils;

Const

 // Etapas: Array[1..3] of TArray<array of string> =
  Etapas: array[1..3] of array[1..20] of string[30] = (

 // Etapa1 : Array[1..20] of string[30]=
  ('111111111111111               ',
   '100000000000001               ',
   '100111110111101               ',
   '100100000000001               ',
   '100100001000001               ',
   '100100001000001               ',
   '130100001000001               ',
   '100101111111101               ',
   '102101000000001               ',
   '100101001002001               ',
   '100101001000001               ',
   '100101111111101               ',
   '100100000000001               ',
   '100100001000001111111111111111',
   '100100001000000000000000000001',
   '100100001000000000000000000001',
   '100111111111110000200555000001',
   '100000000000000000000000200001',
   '100000000000000002000000000001',
   '111111111111111111111111111111'
  ),

 // Etapa2 : Array[1..20] of string[30]=
  ('111111111111111               ',
   '100000000000001               ',
   '100111110111101               ',
   '100100000000001               ',
   '100100001000001               ',
   '100100001000001               ',
   '100100001000001               ',
   '100101111111101               ',
   '102101000000001               ',
   '100101001002001               ',
   '100101001000001               ',
   '100101111111101               ',
   '100100000000001               ',
   '100100001000001111111111111111',
   '100100001000000000000000000001',
   '100100001000300000000000000001',
   '100111111111110000200555000001',
   '100000000000000000000000200001',
   '100000000000000002000000000001',
   '111111111111111111111111111111'
  ),

//  Etapa3 : Array[1..20] of string[30]=
  ('111111111111111               ',
   '100000000000001               ',
   '100111110111101               ',
   '100100000000001               ',
   '100100001000001               ',
   '100100001000001               ',
   '100100001000001               ',
   '100101111111101               ',
   '102101000000001               ',
   '100101001002001               ',
   '100101001000001               ',
   '100101111111101               ',
   '100100000000001               ',
   '100100001000001111111111111111',
   '100100001000000000000000000001',
   '100100001000000000000000000001',
   '100111111111110000200555000001',
   '100000000000000000000000200001',
   '100000003000000002000000000001',
   '111111111111111111111111111111'
  )
  );

 // Etapas: array[1..3] of array[1..20] of string[30] = (Etapa1, Etapa2, Etapa3);

MaxF=20;
MaxC=30;

//var
  //Etapas: Array[1..3] of TArray<array of string>;
 // Etapas: array[1..3] of array[1..20] of string[30] = (Etapa1, Etapa2, Etapa3);
Type
     Terreno = Class
       Private
            NroFilas,
            NroColumnas : Word;
            Celdas : Array[1..MaxF,1..MaxC] of Byte;
       Public
            Constructor Create;overload;
            Function Filas:Word;
            Function Columnas:Word;
            Procedure CargarEtapa( n : Word);
            Function getElemento( F,C : Word):Byte;
            procedure intercambiar(i,j,k,h: word);
            procedure cambiar(i,j,e: word);
     End;
implementation

{ Terreno }

procedure Terreno.cambiar(i,j,e: word);
begin
    Celdas[i,j]:= e;
end;

procedure Terreno.CargarEtapa(n: Word);
var
  I,J: Integer;
begin
  //   Etapas[1]:=Etapa1;



     for I := 1 to NroFilas do
        for J := 1 to NroColumnas do
            if Etapas[n][I][J]<>' ' then
             Celdas[I,J]:=StrToInt(Etapas[n][I][J])
            Else Celdas[I,J]:=7;
end;

function Terreno.Columnas: Word;
begin
    Result:=NroColumnas;
end;

constructor Terreno.Create;
begin
     NroFilas:=MaxF;
     NroColumnas:=MaxC;
end;

function Terreno.Filas: Word;
begin
     Result:=NroFilas;
end;

function Terreno.getElemento(F, C: Word): Byte;
begin
     Result:=Celdas[F,C];
end;

procedure Terreno.intercambiar(i, j, k, h: word);
var
    aux: word;
begin
   aux:= Celdas[i,j];
   Celdas[i,j]:=Celdas[k,h];
   Celdas[k,h]:=aux;
end;

end.
