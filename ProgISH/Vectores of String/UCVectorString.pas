unit UCVectorString;

interface
Uses SysUtils, UCCadenaFull;
Const
  MaxE = 1024;
Type
    Vector = Class
      Private
        Dimension : Word;
        Elementos : Array[1..MaxE] of String;
      Public
        Function Dim:Word;
        Function getElement(p:Word):String;
        Procedure redimensionar(d:word);
        Procedure addElement(e:String);
        Procedure modElement(p:word;e:String);
        Procedure insElement(p:word;e:String);
        Procedure delElement(p:Word);
        Procedure SortInter;
        procedure SortSelect;

        //examen 2 parcial
        procedure delPalRepeat;
    End;

implementation

{ Vector }

procedure Vector.addElement(e: String);
begin
     Inc(Dimension);
     Elementos[Dimension]:=e;
end;

procedure Vector.delElement(p: Word);
var
  I: Word;
begin
     if (p>0)and(p<=Dimension) then
     Begin
          for I := p to Dimension-1 do
            Elementos[i]:=Elementos[i+1];
          dec(Dimension);
     End
     Else raise Exception.Create('Posicion fuera de rango');

end;

procedure Vector.delPalRepeat;
var
  i,a: Integer;
  j: word;
  s,m: string;
  c: cadena;
begin
   c:= cadena.Create; s:='';
   for i := 1 to dimension do
      s:= s + Elementos[i]+' ';

  c.setStr(s);
  c.delChar(c.getLong);

  m:= c.mostRepeatWord;

  if m='Todos se repiten igual' then
  begin
    a:=c.cantPal; m:=Elementos[1];
  end else a:=c.findnumWord(m);

  for i := 1 to a do
  begin
    c.delWord(m);
  end;

  dimension:=c.cantPal;

  j:=1;
  for i := 1 to dimension do
    Elementos[i]:= c.nextWord(j);

end;

function Vector.Dim: Word;
begin
     Result:=Dimension;
end;

function Vector.getElement(p: Word): string;
begin
     if (p>0)and(p<=Dimension) then
     Begin
          Result:=Elementos[p];
     End
     Else raise Exception.Create('Posicion fuera de rango');
end;

procedure Vector.insElement(p: word; e: string);
var
  I: Word;
begin
     if (p>0)and(p<=Dimension) then
     Begin
          Inc(Dimension);
          for I := Dimension downto p+1 do
            Elementos[i]:=Elementos[i-1];
          Elementos[p]:=e;
     End
     Else raise Exception.Create('Posicion fuera de rango');
end;

procedure Vector.modElement(p: word; e: string);
begin
     if (p>0)and(p<=Dimension) then
     Begin
          Elementos[p]:=e;
     End
     Else raise Exception.Create('Posicion fuera de rango');
end;

procedure Vector.redimensionar(d: word);
begin
     Dimension:=d;
end;

procedure Vector.SortInter;
var
  I,J: Integer;
  a: string;
begin
     for I := 1 to Dimension-1 do
        for J := i+1 to Dimension do
          if Elementos[i]>Elementos[j] then
          Begin
            a:=Elementos[i];
            Elementos[i]:=Elementos[j];
            Elementos[j]:=a;
          End;
end;

procedure Vector.SortSelect;
var
  I,J,k: Integer;
  a: string;
begin
     for I := 1 to Dimension-1 do
     Begin
        k:=i;
        for J := i+1 to Dimension do
          if Elementos[k]>Elementos[j] then
            k:=j;
        if k>i then
        Begin
          a:=Elementos[i];
          Elementos[i]:=Elementos[k];
          Elementos[k]:=a;
        End;
     End;

end;

end.
