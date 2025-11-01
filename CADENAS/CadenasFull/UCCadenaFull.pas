unit UCCadenaFull;

interface
Uses SysUtils, Math;
Const
    MaxC=2048;

    letras = ['a'..'z', 'A'..'Z', 'À'..'Ü', 'à'..'ü'];
    vocales = ['a', 'e', 'i', 'o', 'u', 'A', 'E', 'I', 'O', 'U', 'À'..'Ü', ' '..' '] - [' ', ' '];
    Consonantes=letras-Vocales;

    Separadores = [' ',',',';',':','/'];
    AlfaNumSib = ['A'..'Z','a'..'z','.','-'];
    Numeros=['0'..'9'];
    Digitos=['0'..'9','-','.','+',','];
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
        Procedure setStr(s:String);
        Procedure delChar(i:word);
        Procedure insChar(i:word;c:Char);
        Procedure modChar(i:word;c:char);
        Procedure delWord(p:String);
        Procedure delNChar(i,j:Word);
        Procedure insWord(i : word; p: String);
        Procedure replaceWord(p, q : String );
        Procedure invertWords;
        Procedure invertCadena;
        Procedure delWordPosAndLength(i,j : word);
        Function invertStr(s: string):string;
        Function getVowels:Word;
        Function sumaBin:string;
        Function toDecimal(s:string):Cardinal;
        Function toBinario(n:integer):string;
        Function mostRepeatWord:string;


        //SC
        Function nextNumber(var i:Word):String;
        Function NumWordCons:Word;
        Function findWord(p:String):Word;
        Function word2Voc:Word;
        Function ContarVocalPal( s : String):Word;
        Function countNumber:Word;
        Function dateToStr:String;
        Function toMonth(m:Byte):String;
        Function numToText(s:String):String;

        //Auxi
          //copias de funciones existentes
          procedure toUpper;
          procedure toLower;
          function getInt: cardinal;

          //manejo a nivel de palabras
          function nWord(p: cardinal): String;
          procedure delWordPos(p: word);

          //ejercicios con palabras
          procedure eliminarPalconSub(sub: string);
          procedure elimPalVocRepe;
          function getMaxLengthPal: string;
          procedure insWordPal(s: string; p: word); //nose q hace

          //ejercicios
          procedure sumarNumeros;
          procedure reemplazarConPals(s: string); //nose q hace
          function obtenerMayBin: string;
          function sumarBinarios: cardinal;
          procedure sumarHoras;

        //1 Parcial
        Function digComun: word;
        Function verificarN(n: word;s:string): boolean;
        Function cantPal:word;

        //1 parcial 1-2025 xdd
        function RedondearCadena(dec: byte):String;
        function RedondearNumero(s: string; dec: byte):string;
    End;

implementation

{ Cadena }

procedure Cadena.addChar(c: Char);
begin
     Longitud:=Longitud+1;
     Caracteres[Longitud]:=c;
end;

procedure Cadena.setStr(s: String);
Var
  i : Word;
begin
     Longitud:=Length(s);
     for I := 1 to Longitud do
        Caracteres[i]:=s[i];
end;

function Cadena.cantPal: word;
var
    c,i: word;
    p: string;
begin
   i:=1; c:=0;
   while i<=longitud do
   begin
     p:=nextWord(i);
     c:=c+1;
   end;
   result:=c;
end;

function Cadena.ContarVocalPal(s: String): Word;
var
  I,c: Integer;
begin
     c:=0;
     for I := 1 to Length(s) do
        if s[i] in Vocales then
          c:=c+1;
     result:=c;
end;

function Cadena.countNumber: Word;
Var
  i,c : Word;
  n : String;
begin
      while i<Longitud do
      Begin
          n:=NextNumber(i);
          if Length(n)>0 then
            c:=c+1;
      End;
      Result:=c;
end;

function Cadena.countWord: word;
var i, c: word;
begin
    i:=1; c:=0;
    while i<longitud do
    begin
      if (Caracteres[i] in AlfaNumSib) and (Caracteres[i+1] in Separadores) then c:=c+1;
      i:=i+1;
    end;
    if (Caracteres[i] in AlfaNumSib) then c:=c+1;
    result:=c;
end;

function Cadena.dateToStr: String;
Var
   i : Word;
   d,m,a: String;
begin
     i:=1;
     d:= nextWord(i);
     m:= nextWord(i);
     a:= nextWord(i);

     Result:=NumToText(d)+' de '+toMonth(StrtoInt(m))+' de '+NumToText(a);
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

procedure Cadena.delWordPos(p: word);
var i, c: word;
pal: string;
begin
  if (p>0) and (p<=countWord) then begin
   i:=1; c:=1;
   while c<>p do begin
      if not (Caracteres[i] in separadores) And (Caracteres[i+1] in separadores)  then c:=c+1;
      i:=i+1;
   end;
   while Caracteres[i] in separadores do i:=i+1;
   while not (Caracteres[i] in separadores) and (i<=Longitud)do
    delChar(i);
  end else raise Exception.Create('Error: posicion no valida');
end;

procedure Cadena.delWordPosAndLength(i, j: word);
begin
   while j>0 do
   begin
     delChar(i);
     j:=j-1;
   end;
end;

function Cadena.digComun: word;
var
    i,j,d,k,c,f: word;
    r: integer;
    p: string;
    b: boolean;
begin
   r:=-1; k:=cantPal; f:=1;
   for j := 0 to 9 do
   begin
     i:=1; c:=0;
     while i<=longitud do
     begin
       p:=nextWord(i);
       b:=verificarN(j,p);
       if b=True then c:=c+1;
       if (b=True) and (r<>j) and (k=c) then
       begin
         if r=-1 then r:=0;
         r:=r*10+j;
       end;
       if (b=True) and (r=0) and (k=c) then f:=10;
     end;
   end;
   if f=10 then r:=r*f;
   if r=-1 then r:=0;

   result:=r;
end;

procedure Cadena.eliminarPalconSub(sub: string);
var
  i: word;
  pal: string;
begin
  i := 1;
  while i <= countWord do begin
    pal := nWord(i);
    if pos(sub, pal) > 0 then delWordPos(i)
    else  i := i + 1;
  end;
end;

procedure Cadena.elimPalVocRepe;
var
  i, k: word;
  pal, aux: string;
  b: boolean;
begin
  i := 1;
  while i <= countWord do begin
    pal := nWord(i);
    pal := lowerCase(pal);
    aux := '';
    b := false;
    for k := 1 to length(pal) do begin
      if pal[k] in vocales then begin
         if pos(pal[k], aux) = 0 then aux := aux + pal[k]
         else begin
          b := true;
          break;
         end;
      end;
    end;
    if b then delWordPos(i)
    else i := i + 1;
  end;
end;

function Cadena.findNumWord(p: String): Word;
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

function Cadena.findWord(p: String): Word;
Var
  Pos,i : Word;
begin
      i:=1;Pos:=0;
      while (i<Longitud)And(Pos=0) do
      Begin
          if NextWord(i)=p then
              Pos:=i-Length(p);
      End;
      Result:=Pos;
end;

function Cadena.getChar(i: Word): Char;
begin
     if (i>0)And(i<=Longitud) then
        Result:=Caracteres[i]
     Else raise Exception.Create('Error, posicion fuera de rango');
end;

function Cadena.getInt: cardinal;
var i, res: word;
begin
  res := 0;
  for i := 1 to Longitud do begin
      res := res * 10 + (ord(caracteres[i]) - 48);
  end;
  result := res;
end;

function Cadena.getLong: Word;
begin
     Result:=Longitud;
end;

function Cadena.getMaxLengthPal: string;
var i: word;
  pal, max: string;
begin
  i := 1;
  max := '';
  while i <= longitud do begin
    pal := nextWord(i);
    if length(pal) > length(max) then max := pal;
  end;
  result := max;
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

procedure Cadena.insWordPal(s: string; p: word);
var i, c, j: word;
begin
  if (p>0) and (p<=countWord) then begin
   i:=1; c:=1;
   while c<>p do begin
      if not (Caracteres[i] in separadores) And (Caracteres[i+1] in separadores)  then c:=c+1;
      i:=i+1;
   end;

   insChar(i, ' ');
   insChar(i, ' ');
   i := i + 1;
   for j := 1 to length(s) do begin
    inschar(i+j, s[j]);
   end;
  end else raise Exception.Create('Error: posicion no valida');
end;

procedure Cadena.invertCadena;
var
    i,j : word;
    inic, fin: char;
begin
   j:=0;
   for i:=1 to (longitud div 2) do
   begin
     inic:=getChar(j+1);
     fin:=getChar(longitud-j);
     modChar(j+1,fin);
     modChar(longitud-j,inic);
     j:=j+1;
   end;
end;

Function Cadena.invertStr(s: string):string;
var
  i,j: Integer;
  aux: Char;
begin
    j:=0;
    for i := 1 to length(s) div 2 do
    begin
       aux:=s[j+1];
       s[j+1]:=s[length(s)-j];
       s[length(s)-j]:=aux;
       j:=j+1;
    end;
    result:=s;
end;

procedure Cadena.invertWords;
var
  c,i: word;
  p, s , aux: string;
begin
  invertCadena; i:=1; c:=1;
  while i<=longitud do
  begin
    s:=nextWord(i);
    s:=invertStr(s);
    p:=nWord(c);
    replaceWord(p,s);
    c:=c+1;
  end;
end;

procedure Cadena.modChar(i: word; c: char);
begin
     if (i>0)And(i<=Longitud) then
        Caracteres[i]:=c
     Else raise Exception.Create('Error, posicion fuera de rango');

end;

function Cadena.mostRepeatWord: string;
var
  i,j,k,m,c:word;
  p,mp: string;
begin
  i:= CountWord; j:=1; m:=0; c:=0;
  while i>0 do
  begin
    p:= nextWord(j);
    k:=findNumWord(p);
    if k>m then begin
      mp:=p; m:=k;
    end;
    if k=m then c:=c+1;
    i:=i-1;
  end;
  if (c = CountWord) and (k=m) then result:='Todos se repiten igual'
  else result:=mp;
end;

function Cadena.nextNumber(var i: Word): String;
Var
   p : String;
begin
     while (i<=Longitud)And(Caracteres[i] in Separadores) do
          i:=i+1;
     p:='';
     while (i<=Longitud)And (Caracteres[i] in Digitos - [',']) do
     Begin
          p:=p+Caracteres[i];
          i:=i+1;
     End;
     Result:=p;
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
   while (i<=Longitud) and (Caracteres[i] in AlfaNumSib+Numeros) do
   begin
     p:=p+Caracteres[i];
     i:=i+1;
   end;
   result:=p;
end;

//error en el 4
function toLiteral(n:integer):string;
Const
     Un : Array[1..29] of String=('Uno','Dos','Tres','Cuatro','Cinco','Seis','Siete','Ocho','Nueve','Diez','Once','Doce','Trece','Catorce','Quince','Dieciseis','Diecisiete','Dieciocho','Diecinueve','Veinte','Veintiuno','Veintidos','Veintitres','Veinticuatro','Veinticinco','Veintiseis','Veintisiete','Veintiocho','Veintinueve');
     Dec: Array[1..9] of String=('Diez','Veinte','Treinta','Cuarenta','Cincuenta','Sesenta','Setenta','Ochenta','Noventa');
     Cen: Array[1..9] of String=('Ciento','Doscientos','Trescientos','Cuatrocientos','Quinientos','Seiscientos','Setecientos','Ochocientos','Novecientos');
     Mil: Array[2..9] of String=('Dos','Tres','Cuatro','Cinco','Seis','Siete','Ocho','Nueve');
var
    lon: byte;
    n1: word;
    k: String;
begin
   lon:=Trunc(log10(n)+1);
   case lon of
     1: result:=Un[n];
     2: if (n>0) and (n<=29) then Result:=Un[n]
        Else
        begin
          if n mod 10 = 0 then result:=Dec[n div 10]
          else Result:=Dec[n div 10]+' y '+Un[n mod 10];
        end;
     3: if n mod 100 = 0 then result:='Cien'
        else
        begin
          n1:=n; n1:=n1 mod 100;
          if (n1>0) and (n1<=29) then Result:=Cen[n div 100]+' '+Un[n1]
          Else
          begin
            if n1 mod 10 = 0 then result:=Cen[n div 100]+' '+Dec[n1 div 10]
            else Result:=Cen[n div 100]+' '+Dec[n1 div 10]+' y '+Un[n1 mod 10];
          end;
        end;
     4: if (n div 1000 = 1) and (n mod 1000 = 0) then result:='Mil'
        else
        begin
         if n mod 100 = 0 then
         begin
            n1:=n; n1:=n1 mod 1000; n1:=n1 div 100;
            if (n div 1000 = 1) and (n mod 1000 = 100) then result:='Mil Cien'
            else if n mod 1000 = 100 then result:=Mil[n div 1000]+' Mil Cien'
                 else result:=Mil[n div 1000]+' Mil '+Cen[n1]
         end else
             begin
               n1:=n; n1:=n1 mod 1000; n1:=n1 div 100;
               if (n1>0) and (n1<=29) then
               begin
                 if n div 1000 = 1 then result:=' Mil'+Cen[n1 div 100]+' '+Un[n1]
                 else result:=Mil[n div 1000]+' Mil '+Cen[n1 div 100]+' '+Un[n1]
               end else
               begin
                if n1 mod 10 = 0 then
                begin
                  if n div 1000 = 1 then result:='Mil '+Cen[n1 div 100]+' '+Dec[n1 div 10]
                  else result:=Mil[n div 1000]+' Mil '+Cen[n1 div 100]+' '+Dec[n1 div 10]
                end
                else
                begin
                  if n div 1000 = 1 then result:='Mil '+Cen[n1 div 100]+' '+Dec[n1 div 10]+' y '+Un[n1 mod 10]
                  else result:=Mil[n div 1000]+' Mil '+Cen[n1 div 100]+' '+Dec[n1 div 10]+' y '+Un[n1 mod 10]
                end;
               end;
             end;
        end;
   end;
end;

function Cadena.numToText(s: String): String;
var
  d: word;
begin
  d:=StrToInt(s);
  if d=1 then s:='Primero'
  else s:=toLiteral(d);
  result:=s;
end;

function Cadena.NumWordCons: Word;
Var
  p : String;
  i,c : Word;
begin
     c:=0;i:=1;
     while (i<=Longitud) do
     Begin
        p:=NextWord(i);
        if (LowerCase(p[1])[1] in Consonantes)
        And(LowerCase(p[length(p)])[1] in Consonantes) then
          c:=c+1;
     End;

end;

function Cadena.nWord(p: cardinal): String;
Var
   k,c: word;
   pal : String;
begin
     if (p>0) and (p<=cantPal) then
     Begin
          k:=1;
          while p>0 do
          begin
               Pal:=nextWord(k);
               p:=p-1;
           end;
           result:=Pal;
     End
     Else raise Exception.Create('La posicion no es valida');
end;


function Cadena.obtenerMayBin: string;
var i: word;
  cad, may: string;
begin
  i := 1;
  may := '';
  while i <= longitud do begin
    cad := nextWord(i);
    if length(cad) > length(may) then may := cad
    else if (length(cad) = length(may)) and (cad > may) then may := cad;
  end;
  result := may;
end;

function Cadena.RedondearNumero(s: string; dec: byte):string;
var lon, ult: byte;
  i,n: Integer;
  aux,aux2: string;
begin
   //Nombres de variables xD
   //i=iterador, n = decimales del numero, lon= longitud de n,
   //ult = ultimo digito de n, aux=obtener los decimales del numero(Ej: si s=0.123, aux=123)
   //aux2= copia de lo que quedo de los decimales (Ej:si s=0.123, aux2=0.)

   aux2:=s[1]+s[2];

   for i := 3 to s.Length do
     aux:= aux + s[i];

   n:= StrToInt(aux);
   lon:= Trunc(log10(n)+1);

   if lon<dec then // aumentar decimales
     for i := 1 to dec-lon do
       s:= s + '0'
   else if lon>dec then // hacer el redondeo
        begin
          while lon>dec do
          begin
             ult:= n mod 10; n:=n div 10;
             if ult > 4 then
               n:=n+1;
             lon:= lon-1;
          end;
          s:= aux2 + IntToStr(n);

          if (dec=0) and (s[3]='1') then   //redondear solo si es sin decimal
                s:= IntToStr(StrToInt(s[1])+1)
              else if (dec=0) and (s[3]='0') then
                     s:=s[1];
        end;

   result:=s;
end;

function Cadena.RedondearCadena(dec: byte):String;
var i:word;
    cad, cadaux: String;
begin
  //Nombre de variables xD
  //i=iterador (por referencia), cad=copiar la cadena con el numero redondeado, cadaux=afinar detalles xd
  i:=1;
  while i<=longitud do
  begin
    cad:= cad + RedondearNumero(nextNumber(i), dec) + ', ';
  end;

  //eliminar ultima ', ' xd
  cadaux:='';
  for i := 1 to cad.Length-2 do
     cadaux:= cadaux + cad[i];

  result:= cadaux;
end;

procedure Cadena.reemplazarConPals(s: string);
var i, j: word;
  cad: string;
  x: Cadena;
begin
  i := 1; j := 1;
  x := cadena.Create;
  x.setStr(s);

  while i <= CountWord do begin
    cad := nword(i);
    if cad = '{?}' then begin
      delWordPos(i);
      insWordPal(x.nextWord(j), i);
    end;
    i := i+1;
  end;
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

function Cadena.sumarBinarios: cardinal;
var sum: cardinal;
i: word;
cad: string;
begin
  i := 1;
  sum := 0;
  while i <= longitud do begin
    cad := nextWord(i);
    sum := sum + toDecimal(cad);
  end;
  result := sum;
end;

procedure Cadena.sumarHoras;
var i, h, m, s: word;
cad: string;
begin
  i := 1; h := 0; m := 0; s := 0;
  while i <= longitud do begin
    cad := nextWord(i);
    h := h + StrToInt(cad[1]+cad[2]);
    m := m + StrToInt(cad[4]+cad[5]);
    s := s + StrToInt(cad[7]+cad[8]);
  end;
  m := m + s div 60;
  s := s mod 60;
  h := h + m div 60;
  m := m mod 60;
  cad := '';
  cad := cad + IntToStr(h) + ':' + IntToStr(m) + ':' + intToStr(s);
  setStr(cad);
end;

procedure Cadena.sumarNumeros;
var aux: cardinal;
  I:word;
  cad: string;
begin
  i := 1;
  aux := 0;
  while i<=longitud do begin
    cad := nextWord(i);
    aux := aux + StrToInt(cad);
  end;
  //equivalente a hacer result
  setStr(IntToStr(aux));
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

procedure Cadena.toLower;
var i: word;
begin
  for i := 1 to Longitud do begin
    if caracteres[i] in (letras - ['a'..'z', 'à'..'ü'])  then begin
      caracteres[i] := chr(ord(caracteres[i]) + 32);
    end;
  end;
end;

function Cadena.toMonth(m: Byte): String;
Const
    meses:Array[1..12] of String=('Enero','Febrero','Marzo','Abril','Mayo','Junio','Julio','Agosto','Septiembre','Octubre','Noviembre','Diciembre');
begin
    Result:=Meses[m];
end;

procedure Cadena.toUpper;
var i: word;
begin
  for i := 1 to Longitud do begin
    if caracteres[i] in (letras - ['À'..'Ü', 'A'..'Z']) then begin
      caracteres[i] := chr(ord(caracteres[i]) - 32);
    end;
  end;
end;

function Cadena.verificarN(n: word;s: string): boolean;
var
    r: boolean;
    p: word;
  i: Integer;
begin
  p:=0; i:=1; r:= False;
  while (i<=length(s)) do
  begin
    p:=StrToInt(s[i]);
    if p=n then
    begin
    r:=True; i:=length(s)
    end else r:=False;
    i:=i+1;
  end;
  result:=r;
end;

function Cadena.word2Voc: Word;
Var
  i,c : Word;
  p   : String;
begin
     i:=1;c:=0;
     while i<=Longitud do
     begin
        p:=nextWord(i);
        if ContarVocalPal(p)>2 Then
          c:=c+1;
     end;
     Result:=c;
end;

end.
