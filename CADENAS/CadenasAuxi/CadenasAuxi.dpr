program CadenasAuxi;

uses
  Vcl.Forms,
  UFPrincipalAuxi in 'UFPrincipalAuxi.pas' {Form1},
  UCCadenasAuxi in 'UCCadenasAuxi.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
