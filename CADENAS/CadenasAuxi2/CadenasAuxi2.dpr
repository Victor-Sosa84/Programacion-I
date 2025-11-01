program CadenasAuxi2;

uses
  Vcl.Forms,
  UFPrincipalAuxi2 in 'UFPrincipalAuxi2.pas' {Form1},
  UCCadenasAuxi2 in 'UCCadenasAuxi2.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
