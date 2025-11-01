unit UCCadena;

interface
Uses SysUtils,UCNumero;
Const
    MaxC=2048;
    Separadores =[' ',',',';','.'];
    AlfaNumSib=['A'..'Z','a'..'z','0'..'9','/','&'];
Type
    Cadena = Class
      Private
        Longitud : Word;
        Caracteres : Array[1..maxC] of Char;
      Public
        Function getLong:Word;
        Function getChar(i:Word):Char;
        Function getStr:String;
        Function countWord:Word;
        Function nextWord(var i : Word):String;
        Procedure addChar(c:Char);
        Procedure addStr(s:String);
        Procedure delChar(i:word);
        Procedure insChar(i:word;c:Char);
        Procedure modChar(i:word;c:char);
        Function getVowels:Word;
        Function sumaBin:String;
        Function findnumWord(p:String):Word;
        Procedure delWord(p:String);
        Function toDecimal(n:String):Cardinal;
        Function toBinario(n:Cardinal):String;

    End;

implementation

{ Cadena }

procedure Cadena.addChar(c: Char);
begin
     Longitud:=Longitud+1;
     Caracteres[Longitud]:=c;
end;

procedure Cadena.addStr(s: String);
Var
  i : Word;
begin
     Longitud:=Length(s);
     for I := 1 to Longitud do
        Caracteres[i]:=s[i];
end;

function Cadena.countWord: Word;
Var
  i,c : Word;
begin
     i:=1; c:=0;
     while (i<Longitud) do
     Begin
          if (Caracteres[i] in AlfaNumSib)And
             (Caracteres[i+1] in Separadores) then
             c:=c+1;
          i:=i+1;
     End;
     if (Caracteres[i] in AlfaNumSib) Then
        c:=c+1;
     Result:=c;
end;

procedure Cadena.delChar(i: word);
var
  J: Word;
begin
     if (i>0)And(i<=Longitud) then
     Begin
         for J := i to Longitud-1 do
          Caracteres[j]:=Caracteres[j+1];
         Longitud:=Longitud-1;
     End
     Else raise Exception.Create('Error, posicion fuera de rango');
end;

procedure Cadena.delWord(p: String);
Var
  i: Word;
begin
     i:=1;
     while i<=Longitud do
     Begin
        if NextWord(i)=p then
            //delNChar(i-length(p),length(p));
     End;
end;

function Cadena.findnumWord(p: String): Word;
Var
  i,c : Word;
begin
     i:=1;c:=0;
     while i<=Longitud do
     Begin
        if NextWord(i)=p then
            c:=c+1;
     End;
     Result:=c;
end;

function Cadena.getChar(i: Word): Char;
begin
     if (i>0)And(i<=Longitud) then
        Result:=Caracteres[i]
     Else raise Exception.Create('Error, posicion fuera de rango');
end;

function Cadena.getLong: Word;
begin
     Result:=Longitud;
end;

function Cadena.getStr: String;
var
  I: Integer;
  s : String;
begin
     s:='';
     for I := 1 to Longitud do
        s:=s+Caracteres[i];
     Result:=s;
end;

function Cadena.getVowels: Word;
var
  I,c: Integer;
begin
     c:=0;
     for I := 1 to Longitud do
        if getChar(i) in ['a','e','i','o','u'] then
           c:=c+1;
     Result:=c;
end;

procedure Cadena.insChar(i: word; c: Char);
var
  J: Word;
begin
     if (i>0)And(i<=Longitud) then
     Begin
          Longitud:=Longitud+1;
          for J :=Longitud Downto i+1 do
              Caracteres[J]:=Caracteres[J-1];
          Caracteres[i]:=c;
     End
     Else raise Exception.Create('Error, posicion fuera de rango');

end;

procedure Cadena.modChar(i: word; c: char);
begin
     if (i>0)And(i<=Longitud) then
        Caracteres[i]:=c
     Else raise Exception.Create('Error, posicion fuera de rango');

end;

function Cadena.nextWord(var i: Word): String;
Var
   p: String;
begin
     While(i<=Longitud)And(Caracteres[i] in Separadores) do
      i:=i+1;
     p:='';
     While(i<=Longitud)And(Caracteres[i] in AlfaNumSib) do
     Begin
        p:=p+Caracteres[i];
        i:=i+1;
     End;
     Result:=p;
end;

function Cadena.sumaBin: String;
Var
  t : Cardinal;
  n : String;
  i : Word;
begin
     i:=1;t:=0;
     while i<=Longitud do
     Begin
        n:=nextWord(i);
        t:=t+toDecimal(n);
     End;
     Result:=toBinario(t);
end;

function Cadena.toBinario(n: Cardinal): String;
Const
  dig='01';
Var
  s : String;
  d : Byte;
begin
     s:='';
     while n>0 do
     Begin
          d:=n mod 2;
          s:=dig[d+1]+s;
          n:=n div 2;
     End;
     Result:=s;
end;

function Cadena.toDecimal(n: String): Cardinal;
var
  I,k: Integer;
  r : Cardinal;
begin
     k:=1;r:=0;
     for I := Length(n) to 1 do
     Begin
          if n[i]='1' then
             r:=r+1*k;
          k:=k*2;
     End;
     Result:=r;
end;

end.
