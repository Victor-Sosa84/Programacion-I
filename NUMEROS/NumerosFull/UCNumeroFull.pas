unit UCNumeroFull;

interface
Uses Math;

Type
    Numero = Class
      Private
        Valor:Cardinal;
      Public
        Function getDigit(p:Byte):Byte;
        Function getNumDigit:Byte;
        Function getNum:cardinal;
        Function sumDigit10: Byte;
        Function SumAllDigit: Byte;
        Function toRoman: String;
        Function toLiteral2D(n : Word):String;
        Function findDigit(d:Byte):Byte;
        Function frequencyDigit(d:Byte):Byte;
        function obtenerEnBaseN(b: byte): cardinal;
        function obtenerEnBase10(b: byte): cardinal;
        function getNdigit(i,n: cardinal): cardinal;
        Procedure setNum(n: cardinal);
        Procedure addDigitFirst(d:Byte);
        Procedure addDigitLast(d:Byte);
        Procedure insDigit(p:Byte; d:Byte);
        Procedure delDigit(p:Byte);
        Procedure modDigit(p:Byte; d:Byte);
        Procedure Invertir;
        Procedure delNnum(n: cardinal );
        Procedure delNdigit(i,n: cardinal);

        //Auxi
          //ejericicios
          function obtenerMen3Cifras: cardinal;
          procedure ordenarDigDescente;
          procedure ordenarDigAscendente;
          procedure ordenarParOrdImparOrd;


          //Parcial 1
          procedure insertNumOrdDesc(n : word);
          function digitParSum10:word;


       //1 parcial 2025 xdd
       function SepararRepetidos:cardinal;
       procedure delAlldigit2(var n:cardinal; dig: byte);
       function digitoNoEsta2(n:cardinal; dig: byte):boolean;

       procedure delAlldigit(dig: byte);
       function digitoEsta(dig:byte):boolean;
       function digitoNoEsta(dig:byte):boolean;

  End;
implementation

{ Numero }

procedure Numero.addDigitFirst(d: Byte);
begin
     Valor:=Valor*10+d;
end;

procedure Numero.addDigitLast(d: Byte);
var
    k : Cardinal;
begin
     k:=Trunc(Power(10,getNumDigit));
     Valor:=d*k+Valor;
end;

procedure Numero.delAlldigit(dig: byte);
var
   i: integer;
begin
   i:=1;
   while i<=getNumDigit do
     if getDigit(i)=dig then
       delDigit(i)
     else
       i:=i+1;
end;

procedure Numero.delAlldigit2(var n: cardinal; dig: byte);
var naux: Numero;
    i: integer;
begin
   naux:=Numero.Create;
   naux.Valor:=n;
   i:=1;
   while i<=naux.getNumDigit do
     if naux.getDigit(i)=dig then
       naux.delDigit(i)
     else
       i:=i+1;

   n:= naux.Valor;
end;

procedure Numero.delDigit(p: Byte);
Var
    n1,n2 : Cardinal;
begin
   n1:=(Valor div (Trunc(Power(10,p-1)))) div 10;
   n2:=Valor mod Trunc(Power(10,p-1));
   Valor:=n1*Trunc(Power(10,p-1))+n2;
end;

procedure Numero.delNdigit(i, n: cardinal);
var
  j: Integer;
begin
    for j := 1 to n do
    begin
    delDigit(i-(j-1));
    end;
end;

procedure Numero.delNnum(n: cardinal);
var
    i,k,lon: word;
begin
  lon:=Trunc(log10(n)+1);
  if lon=2 then k:=1 else k:=0;
  for i := lon to getNumDigit+k do
  begin
    if getNdigit(i,lon)=n then delNdigit(i,lon);
  end;

end;

function Numero.digitoEsta(dig:byte): boolean;
var i:byte;
    r:boolean;
begin
  i:=1;
  while i<=getNumDigit do
  begin
    if getDigit(i)=dig then
    begin
      r:=true; i:=getNumDigit;
    end else
      r:=false;
    i:=i+1;
  end;
  result:=r;
end;

function Numero.digitoNoEsta(dig: byte): boolean;
var i:byte;
    r: boolean;
begin
    i:=i+1;
    while i<=getNumDigit do begin
       if getDigit(i)=dig then
       begin
          r:=false; i:=getNumDigit;
       end else
              r:=true;
       i:=i+1;
    end;
    result:=r;
end;

function Numero.digitoNoEsta2(n: cardinal; dig: byte): boolean;
var naux: Numero;
    i: byte;
    r: boolean;
    //naux=copia de n para usar los metodos xd, i= var. iterante, r=resultado
begin
  naux:=Numero.Create; naux.Valor:= n; //crear y copiar n
  i:=1; r:=true; //iniciar variables
  while i<=naux.getNumDigit do
  begin
    if naux.getDigit(i)=dig then //comparar si esta
    begin
      r:=false; i:=naux.getNumDigit;
    end else
      r:=true;
    i:=i+1;
  end;
  result:=r;
end;

function Numero.digitParSum10: word;
var
   c,i,j: word;
   m: Integer;
begin
  c:=0;
  for i := 1 to getNumDigit do
  begin
    m:=valor; j:=i+1;
    case getDigit(i) of
      1: while m>0 do
          begin
            if m mod 10 = 9 then
            begin
              c:=c+1; m:=1;
            end;
            m:= m div 10;
          end;
      2: while m>0 do
          begin
            if m mod 10 = 8 then
            begin
              c:=c+1; m:=1;
            end;
            m:= m div 10;
          end;
      3: while m>0 do
         begin
           if m mod 10 = 7 then
           begin
             c:=c+1; m:=1;
           end;
           m:= m div 10;
         end;
      4: while m>0 do
         begin
           if m mod 10 = 6 then
           begin
             c:=c+1; m:=1;
           end;
           m:= m div 10;
         end;
      5: while j<=getNumdigit do
         begin
           if getDigit(j) = 5 then
           begin
             c:=c+1; delDigit(j); j:=getNumDigit;
           end;
           j:=j+1;
         end;
    end;
  end;
  result:=c;
end;

function Numero.findDigit(d: Byte): Byte;
Var
  i,p : Byte;
begin
     i:=1;p:=0;
     while (i<=getNumDigit)And(p=0) do
     Begin
          if getDigit(i)=d then
             p:=i;
          i:=i+1;
     End;
     Result:=p;
end;

function Numero.frequencyDigit(d: Byte): Byte;
Var
  i,p : Byte;
begin
     i:=1;p:=0;
     while (i<=getNumDigit) do
     Begin
          if getDigit(i)=d then
             p:=p+1;
          i:=i+1;
     End;
     Result:=p;
end;

function Numero.getDigit(p: Byte): Byte;
begin
     Result:=((Valor div (Trunc(Power(10,p-1)))) mod 10);
end;

function Numero.getNdigit(i, n: cardinal): cardinal;
var
  j,c: Integer;
begin
  c:=getDigit(i);
  for j := 1 to n-1 do
  begin
    c:=c*10+getDigit(i-1);
    i:=i-1;
  end;
  result:=c;
end;

function Numero.getNum: cardinal;
begin
    Result:=valor;
end;

function Numero.getNumDigit: Byte;
begin
   if valor<>0 then
     Result:=Trunc(Log10(Valor))+1
   else
     result:=1;
end;

procedure Numero.insDigit(p, d: Byte);
Var
    n1,n2 : Cardinal;
begin
   n1:=(Valor div (Trunc(Power(10,p-1))))*10+d;
   n2:=Valor mod Trunc(Power(10,p-1));
   Valor:=n1*Trunc(Power(10,p-1))+n2;
end;

procedure Numero.insertNumOrdDesc(n: word);
var
   i,d: word;
   k: boolean;
  j: Integer;

  //variables del examen xd
  {  d,d2,j,m,p,pos,f: word;
    k: Boolean; }
begin
   while n>0 do
   begin
     k:=False; i:=1;
     d:= n mod 10;
     n:= n div 10;

       if (d<=getDigit(1)) then
       begin
         addDigitFirst(d); k:=True;
       end;
       if (d>=getDigit(getNumDigit)) then
       begin
         addDigitLast(d); k:=True;
       end;

     while (d<>getDigit(i)) and (i<=getNumDigit) do i:=i+1;

     //verificar si el digito no esta
     if (d<>getDigit(i)) and (i>getNumDigit) then
     begin
       j:=1;
       while j<=getNumDigit do
       begin
         if (d>getDigit(j)) and (d<getDigit(j+1)) then
         begin
           insDigit(j+1,d); j:=getNumDigit; k:=True;
         end;
         j:=j+1;
       end;
     end;

     if k = False then insDigit(i+1,d);

   end;


  //intento en el examen xd
  { f:=Valor; k:= False;
   for j := 0 to 9 do
   begin
     m:=n;
     while m>0 do
     begin
       d:=m mod 10;
       m:=m div 10;

       //verificar si es 0 o 9
       if (j=0) and (d=0) then
       begin
         addDigitFirst(d); k:=True;
       end;
       if (j=9) and (d=9) then
       begin
         addDigitLast(d); k:=True;
       end;

       //verificar demas numeros
       if (d = j) and (k = False) then
       begin
           p:= Valor; pos:=1;
           while p>0 do
           begin
             d2:=p mod 10;
             p:=p div 10;
             if d2 = d then
             begin
               insDigit(pos+1,d); k:=True;
             end;
             pos:=pos+1;
           end;
           if (k = False) then
           begin
             p:=Valor; pos:=1;
             while p>0 do
             begin
              d2:=p mod 10;
              p:=p div 10;
              if (d > getDigit(pos-1)) and (d < getDigit(pos+1)) then insDigit(pos+1,d);
              pos:=pos+1;
             end;
           end;
       end;
     end;
   end;  }
end;

procedure Numero.Invertir;
Var
  d,i,f: Byte;
begin
     i:=1; f:=getNumDigit;
     while i<f do
     Begin
          d:=getDigit(i);
          modDigit(i,getDigit(f));
          modDigit(f,d);
          i:=i+1;f:=f-1;
     End;
end;

procedure Numero.modDigit(p, d: Byte);
Var
k,n1,n2 : Cardinal;
begin
     k:=Trunc(Power(10,p-1));
     n1:=((Valor div k) div 10)*10+d;
     n2:=Valor mod k;
     Valor:=n1*k+n2;
end;

function Numero.obtenerEnBase10(b: byte): cardinal;
var n, res, d, k: cardinal;
begin
  n := valor;
  k := 1;
  res := 0;
  while n > 0 do begin
    d := n mod 10;
    n := n div 10;
    res := d*k + res;
    k := k * b;
  end;
  result := res;
end;

function Numero.obtenerEnBaseN(b: byte): cardinal;
var n, res, d, k: cardinal;
begin
  n := valor;
  k := 1;
  res := 0;
  while n > 0 do begin
    d := n mod b;
    n := n div b;
    res := d*k + res;
    k := k * 10;
  end;
  result := res;
end;

function Numero.obtenerMen3Cifras: cardinal;
var n, num, men: cardinal;
begin
  n := valor;
  men := n mod 1000;
  while n > 99 do begin
    num := n mod 1000;
    if (num < men) and (num > 99) then men := num;
    n := n div 10;
  end;
  result := men;
end;

procedure Numero.ordenarDigAscendente;
var n, i, res: cardinal;
  d: byte;
begin
  res := 0;
  for i := 0 to 9 do begin
    n := valor;
    while n > 0 do begin
      d := n mod 10;
      n := n div 10;
      if d = i then res := res * 10 + d;
    end;
  end;
  valor := res;
end;

procedure Numero.ordenarDigDescente;
var n, i, res: cardinal;
  d: byte;
begin
  res := 0;
  for i := 9 downto 0 do begin
    n := valor;
    while n > 0 do begin
      d := n mod 10;
      n := n div 10;
      if d = i then res := res * 10 + d;
    end;
  end;
  valor := res;
end;

procedure Numero.ordenarParOrdImparOrd;
var par, impar, ccero: cardinal;
  d: byte;
begin
  par := 0;
  impar := 0;
  ccero := 0;
  while valor > 0 do begin
    d := valor mod 10;
    valor := valor div 10;
    if d = 0 then begin
      ccero := ccero + 1;
    end else if d mod 2 = 0 then begin
      par := par * 10 + d;
    end else begin
      impar := impar * 10 + d;
    end;
  end;
  valor := par;
  ordenarDigDescente;
  par := valor;
  valor := impar;
  ordenarDigDescente;
  par := par * trunc(power(10, getNumDigit)) + impar;
  valor := par;
  valor := par * trunc(power(10, ccero));
end;

function Numero.SepararRepetidos: cardinal;
var
  repet,norepet,k,ceros: cardinal;
  d,lon: byte;
  i,j: Integer;
  //repet= numeros repetidos, norepet = numeros no repetidos, k=variable de potencia,
  //ceros= cant. de ceros pal final, d=digito, lon=longitud de repet,
  //i,j =variables iterantes
begin
  repet:=0; norepet:=0; i:=1; //inicializar variables
  ceros:=Trunc(Power(10,frequencyDigit(0))); //calcular ceros
  while i<=getNumDigit do
  begin
    d:= getDigit(i); //obtener digito
    if d<>0 then //saltarse los ceros
    begin
      if (frequencyDigit(d)>1) and (digitoNoEsta2(repet, d)) then
      begin
        for j := 1 to frequencyDigit(d) do
          repet:=repet*10+d;
      end else if frequencyDigit(d)=1 then
                   norepet:=norepet*10+d;
    end;
    i:=i+1;
  end;

  //por si no hay repetidos
  if repet<>0 then
    lon:=Trunc(log10(repet)+1)
  else
    lon:=0;

  k:=Trunc(power(10,lon));
  result:= (norepet*k+repet)*ceros;
end;

procedure Numero.setNum(n: cardinal);
begin
    Valor:=n;
end;

function Numero.SumAllDigit: Byte;
var
  a: Byte;
  i: cardinal;
begin
    a:=0;
    for i := 1 to getNumDigit do
    begin
       a:=a+getDigit(i);
    end;
    result:=a;
end;

function Numero.sumDigit10: Byte;
Var
    i,j,k,c,lon : Cardinal;
begin
  lon:=getNumDigit;
  if sumAllDigit>=10 then
  begin

   //verificar ascendentemente
   k:=0; c:=0;  j:=1;
   while (k<10) do
   begin
     for i := 1 to lon do
     begin
        if (getDigit(i)=j) and (k<10) then
        begin
         c:=c+1; k:=k+getDigit(i);
        end;
     end;
   j:=j+1;
   end;

   if k>10 then
   begin

    //verificar descendentemente
    c:=0; j:=9; k:=0;
    while (k<10) do
    begin
      for i := 1 to lon do
      begin
        if (getDigit(i)=j) and (k<10) then
        begin
          c:=c+1; k:=k+getDigit(i);
        end;
      end;
      j:=j-1;
    end;
    if k>10 then c:=0;
   end;
  end else c:=0;

  result:=c;
end;

function Numero.toLiteral2D(n:word): String;
Const
     Un : Array[1..15] of String=('UNO','DOS','TRES','CUATRO','CINCO','SEIS','SIETE','OCHO','NUEVE','DIEZ','ONCE','DOCE','TRECE','CATORCE','QUINCE');
     Dec: Array[1..9] of String=('DIEZ','VEINTE','TREINTA','CUARENTA','CINCUENTA','SECENTA','SETENTA','OCHENTA','NOVENTA');
begin
     if (n>0)and(n<=15) then
         Result:=Un[n]
     Else Result:=Dec[n div 10]+' y '+Un[n mod 10];
end;

function Numero.toRoman: String;
Const
    Dig : Array[1..4,0..9] of String=
          (('','I','II','III','IV','V','VI','VII','VIII','IX'),
           ('','X','XX','XXX','XL','L','LX','LXX','LXXX','XC'),
           ('','C','CC','CCC','CD','D','DC','DCC','DCCC','CM'),
           ('','M','MM','MMM','Mv','v','vM','vMM','vMMM','Ml'));
var
  I: Integer;
  s : String;
begin
     s:='';
     for I := 1 to getNumDigit do
      s:=Dig[i,getDigit(i)]+s;

     Result:=s;
end;

end.
