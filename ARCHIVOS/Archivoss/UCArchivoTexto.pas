unit UCArchivoTexto;

interface
Uses System.Classes,UCCadenaFull,SysUtils;

Type
    Tmodo=(lectura,escritura);
    ArchivoTexto = Class
      Private
          Nombre : String;
          PF     : TextFile;
          Contenido : TStrings;

      Public
          Constructor Create();overload;
          Procedure Open(mode:Tmodo;path : String);
          Procedure setName(path : String);
          Procedure Close;
          function palMasRepetida(l: TStrings): String;
          Function readLines:TStringList;
          Procedure saveLines();
          Function findWord(p:String;l:TStrings):String;
          Procedure delWord(p:String;l:TStrings);
          Procedure findandreplace(pb,pr:String;l:TStrings);
          Function sumValues(l:TStrings):Real;
          Function mostrepeatedWord(l:TStrings):String;
          Function searchNumber(name:String;l:TStrings):String;
          Function contarPalabras(l:TStrings):Word;
          Procedure mayuscula(l:TStrings);
          Function Sumar(l:TStrings):Real;


          //2 parcial
          Procedure matriz(l:TStrings);

          //3 parcial
          function negativos(l: TStrings): TStrings;
    End;

implementation

{ ArchivoTexto }

procedure ArchivoTexto.Close;
begin
     CloseFile(PF);
end;

function ArchivoTexto.contarPalabras(l: TStrings): Word;
Var
  C: Cadena;
  s: String;
  i,R: Word;
begin
     C:=Cadena.Create;
     i:=0; R:=0;
     while i<l.Count do
     Begin
         C.setStr(l[i]);
         R:=R+C.countWord;
         i:=i+1;
     End;
     Result:=R;
end;

constructor ArchivoTexto.Create();
begin
  inherited Create;

end;

procedure ArchivoTexto.delWord(p: String;l:TStrings);
Var
    C : Cadena; j,i:Word;
begin
     C:=Cadena.Create;
     i:=0;
     while (i<l.Count) do
     begin
         C.setStr(l[i]);
         repeat
           j:=C.findWord(p);
           if j>0 then C.delWordPosAndLength(j,length(p))
         until j=0 ;
         l[i]:=C.getStr;
         i:=i+1;
     end;

end;

procedure ArchivoTexto.FindAndReplace(pb, pr: String;l:TStrings);
Var
    C : Cadena; j,i:Word;
begin
     C:=Cadena.Create;
     i:=0;
     while (i<l.Count) do
     begin
         C.setStr(l[i]);
         repeat
           j:=C.findWord(pb);
           if j>0 then
           begin
                C.delWordPosAndLength(j,length(pb));
                C.InsWord(j,pr);
           end;
         until j=0 ;
         l[i]:=C.getStr;
         i:=i+1;
     end;

end;

function ArchivoTexto.FindWord(p: String;l:TStrings): String;
Var
    //R: TStringList;
    C : Cadena; j,i:Word;
    Pos : String;
begin
     C:=Cadena.Create;
     i:=0;Pos:='';
     //R:=readLines;
     while (i<l.Count)And(Pos='') do
     begin
         C.setStr(l[i]);
         j:=C.findWord(p);
         if j>0 then Pos:='Fila: '+IntToStr(i+1)+' - '+'Nro caracter: '+IntToStr(j);
         i:=i+1;
     end;
     Result:=Pos;
end;

procedure ArchivoTexto.matriz(l:TStrings);
var
  c: cadena;
  i,j: Integer;
  n: word;
  aux: string;
  k: Integer;
begin
   c:= cadena.Create;
   n:=1;
   for i := 1 to 3 do
   begin
     c.setStr(l[i+1]);
     for j := 1 to 3 do
     begin
       aux:= c.nextWord(n);
       for k := 1 to length(aux) do
          c.addChar(aux[k]);
       c.addChar(' ');
     end;
     c.delChar(c.getLong);
     l[i]:= c.getStr;
   end;
end;

procedure ArchivoTexto.mayuscula(l: TStrings);
Var
  C : Cadena;
  i : Word;
begin
     C:=Cadena.Create;
     i:=0;
     while (i<l.Count) do
     Begin
          C.setStr(l[i]);
          C.toUpper;
          l[i]:=C.getStr;
          i:=i+1;
     End;
end;

function ArchivoTexto.mostrepeatedWord(l: TStrings): String;
begin

end;

function ArchivoTexto.negativos(l: TStrings):TStrings;
var
  c,c2: cadena;
  i: Word; j: integer;
  a,r: string;

  lineas: TStrings;
begin
  c:= cadena.Create;
  c2:= cadena.Create;
  lineas:= l;
  for j := 0 to l.Count do
  begin
    i:=1;
    c.setStr(l[j]); r:='';
    while i<=c.getLong do
    begin
      a:= c.nextWord(i);
      if a[1]='-' then
      begin
        c2.setStr(a);
        c2.delChar(1);
        a:=c2.getStr;
        a:='(' + a + ')';
      end;
      if i>c.getLong then r:=r+a else r:=r+a+' ';
      lineas[j]:=r;
    end;
  end;
  result:= Lineas;
end;

procedure ArchivoTexto.Open(mode :TModo;path : String);
begin
     AssignFile(PF,path);
     case mode of
         lectura:Reset(PF);
         escritura:Rewrite(PF);
     end;

end;

function ArchivoTexto.PalMasRepetida(l: TStrings): String;
Var
  C : Cadena; S:String; i:Word;
Begin
     C:=Cadena.Create;
     i:=0;s:='';
     while (i<l.Count) do
     begin
         s:=s+' '+l[i]; i:=i+1;
     end;
     C.setStr(s);
     Result:=C.mostRepeatWord;
end;

function ArchivoTexto.readLines: TStringList;
Var
  s : String;
  Lineas : TStringList;
begin
     Lineas:=TStringList.Create;
     while not EOF(PF) do
     Begin
        Readln(PF,s);
        Lineas.Add(s);
     End;
     Contenido.Assign(Lineas);
     Result:=Lineas;
end;

procedure ArchivoTexto.saveLines();
Var
  s:String;
  I: Integer;
begin
    for s in Contenido do
     Writeln(PF,s);
end;

function ArchivoTexto.searchNumber(name: String; l: TStrings): String;
Var
    C : Cadena; j,i,t:Word;
    Pos,Nro : String;
begin
     C:=Cadena.Create;
     i:=0;Pos:='';
     while (i<l.Count)And(Pos='') do
     begin
         C.setStr(l[i]);t:=1;
         Nro:=C.nextWord(t);
         if C.nextWord(t)=name then
            Pos:=Nro;
     end;
     Result:=Pos;

end;

procedure ArchivoTexto.setName(path: String);
begin
     Nombre:=Path;
end;

function ArchivoTexto.Sumar(l: TStrings): Real;
Var
   n : Real;i:Word;
begin
     i:=0;n:=0;
     while (i<l.Count) do
     Begin
           if Length(l[i])>0 then
              n:=n+StrToFloat(l[i]);
           i:=i+1;
     End;
     Result:=n;
end;

function ArchivoTexto.sumValues(l:TStrings): Real;
begin

end;

end.
