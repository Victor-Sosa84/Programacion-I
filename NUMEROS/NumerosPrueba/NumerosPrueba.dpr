program NumerosPrueba;

uses
  Vcl.Forms,
  UFPrincipalPrueba in 'UFPrincipalPrueba.pas' {Form2},
  UCNumeroPrueba in 'UCNumeroPrueba.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm2, Form2);
  Application.Run;
end.
