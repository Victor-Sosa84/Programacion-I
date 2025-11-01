program NumerosFull;

uses
  Vcl.Forms,
  UFPrincipalFull in 'UFPrincipalFull.pas' {Form2},
  UCNumeroFull in 'UCNumeroFull.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm2, Form2);
  Application.Run;
end.
