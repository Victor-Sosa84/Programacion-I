unit UCNumero;

interface
Uses Math;
Type
    Numero = Class
      Private
        Valor : Cardinal;
      Public
        Function getDigit(p:Byte):Byte;
        Function getNumDigit:Byte;
        Function getValue:Cardinal;
        Function findDigit(d:Byte):Byte;
        Function frequencyDigit(d:Byte):Byte;
        Procedure setValue(v:Cardinal);
        Procedure addDigitFirst(d:Byte);
        Procedure addDigitLast(d:Byte);
        Procedure insDigit(p:Byte; d:Byte);
        Procedure delDigit(p:Byte);
        Procedure modDigit(p:Byte; d:Byte);

    End;
implementation


{ Numero }

procedure Numero.addDigitFirst(d: Byte);
begin
     Valor:=Valor*10+d;
end;

procedure Numero.addDigitLast(d: Byte);
Var
    k : Cardinal;
begin
     k:=Trunc(Power(10,getNumDigit));
     Valor:=d*k+Valor;
end;

procedure Numero.delDigit(p: Byte);
Var
   k,n1,n2 : Cardinal;
begin
     k:=Trunc(Power(10,p-1));
     n1:=((Valor div k) div 10);
     n2:=Valor mod k;
     Valor:=n1*k+n2;
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

function Numero.getNumDigit: Byte;
begin
     Result:=Trunc(Log10(Valor))+1;
end;

function Numero.getValue: Cardinal;
begin
     Result:=Valor;
end;

procedure Numero.insDigit(p, d: Byte);
Var
   k,n1,n2 : Cardinal;
begin
     k:=Trunc(Power(10,p-1));
     n1:=(Valor div k)*10+d;
     n2:=Valor mod k;
     Valor:=n1*k+n2;
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

procedure Numero.setValue(v: Cardinal);
begin
     Valor:=v;
end;

end.
