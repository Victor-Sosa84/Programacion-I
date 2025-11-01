unit UCArchivo;

interface
Uses System.Classes;
Type
    TModo=(Lectura,Escritura,Adicion);
    ArchivoTexto = Class
      Private
             Nombre : String;
             PF     : TextFile;
      Public
            Procedure Open(Path:String;Modo:TModo);
            Procedure Close;
            Function readLns:TStringList;
            Procedure writeLns(ln : TStrings);
    End;

implementation

{ ArchivoTexto }

procedure ArchivoTexto.Close;
begin
     CloseFile(PF);
end;

procedure ArchivoTexto.Open(Path: String; Modo: TModo);
begin
     Nombre:=Path;
     AssignFile(PF,Nombre);
     case Modo of
         Lectura:Reset(PF) ;
         Escritura:Rewrite(PF);
         Adicion:Append(PF);
     end;
end;

function ArchivoTexto.readLns: TStringList;
Var
  ls : TStringList;
  s : String;
begin
     ls := TStringList.Create;

     while not EOF(PF) do
     begin
          ReadLn(PF,s);
          ls.Add(s);
     end;

     Result:=ls;
end;

procedure ArchivoTexto.writeLns(ln: TStrings);
begin

end;

end.
