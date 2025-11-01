unit UCCadena;

interface
Uses SysUtils;
Const
    MaxC=2048;
    Separadores = [' ',',','.',';'];
    AlfaNumSib = ['A'..'Z','a'..'z'];
Type
    Cadena = Class
      Private
        Longitud : Word;
        Caracteres : Array[1..maxC] of Char;
      Public
        Function getLong:Word;
        Function getChar(i:Word):Char;
        Function getStr:String;
        Function countWord:word;
        Function nextWord(var i : word):String;
        Function findnumWord(p:String):Word;
        Procedure addChar(c:Char);
        Procedure addStr(s:String);
        Procedure delChar(i:word);
        Procedure insChar(i:word;c:Char);
        Procedure modChar(i:word;c:char);
        Procedure delWord(p:String);
        Procedure delNChar(i,j:Word);
        Procedure insWord(i : word; p: String);
        Procedure replaceWord(p, q : String );
        Function getVowels:Word;
        Function sumaBin:string;
        Function toDecimal(s:string):Cardinal;
        Function toBinario(n:integer):string;
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

function Cadena.countWord: word;
var i, c: word;
begin
    i:=1; c:=0;
    while i<longitud do
    begin
      if (Caracteres[i] in AlfaNumSib) and (Caracteres[i+1] in Separadores) then
        i:=i+1; c:=c+1;
    end;
    if (Caracteres[i] in AlfaNumSib) then
      c:=c+1;
    result:=c;
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

procedure Cadena.delNChar(i, j: Word);
var
   k: Word;
begin
   k:=i;
   while i<(k+j) do
   begin
     delChar(k);
     i:=i+1;
   end;
end;

procedure Cadena.delWord(p: String);
var
   i: Word;
begin
  i:=1;
  while i<=longitud do
  begin
    if nextWord(i)=p then delNChar(i-length(p),length(p));
  end;
end;

function Cadena.findnumWord(p: String): Word;
var
   c,i: Word;
begin
   i:=1; c:=0;
   while i<=Longitud do
   begin
     if nextWord(i)=p then c:=c+1;
   end;
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

procedure Cadena.insWord(i: word; p: String);
var
    k : Word;
begin
  k:=1;
  while k<=length(p) do
  begin
    insChar(i+(k-1),p[k]);
    k:=k+1;
  end;
end;

procedure Cadena.modChar(i: word; c: char);
begin
     if (i>0)And(i<=Longitud) then
        Caracteres[i]:=c
     Else raise Exception.Create('Error, posicion fuera de rango');

end;

function Cadena.nextWord(var i: word): String;
Var
   p: String;
begin
   while (i<=Longitud) and (Caracteres[i] in Separadores) do
   begin
     i:=i+1;
   end;
   p:='';
   while (i<=Longitud) and (Caracteres[i] in AlfaNumSib) do
   begin
     p:=p+Caracteres[i];
     i:=i+1;
   end;
   result:=p;
end;

procedure Cadena.replaceWord(p, q: String);
var
   i : Word;
begin
  i:=1;
  while i<=Longitud do
  begin
    if nextWord(i)=p then
    begin
      delWord(p);
      if i-length(p)>longitud then 
      begin
        longitud:=longitud+1;
        insWord(i-length(p), q);
        delChar(longitud);
      end else insWord(i-length(p), q);
    end;
  end;
end;

function Cadena.sumaBin: string;
Var
    t: Cardinal;
    n: String;
    i: Word;
begin
  i:=1; t:=0;
  while i<=longitud do
  begin
     n:=nextWord(i);
     t:=t+toDecimal(n);
  end;
  result:=toBinario(t);
end;

function Cadena.toBinario(n: integer): string;
Var
    d: String;
begin
   d:='';
   while n>1 do
   begin
     d:= IntToStr(n mod 2) + d;
     n:=n div 2;
   end;
   d:= IntToStr(n div 2) + d;
   result:=d;
end;

function Cadena.toDecimal(s: string): Cardinal;
Var
    i,k,c: Word;
    d: Cardinal;
begin
   k:=1; d:=0;
  for i:=length(s) to 1 do
  begin
    c:=StrToInt(s[i]);
    d:=d+c*k;
    k:=k*2;
  end;
  result:=d;
end;

end.
