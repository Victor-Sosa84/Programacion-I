program NumerosSC;

uses
  Vcl.Forms,
  UFPrincipalSC in 'UFPrincipalSC.pas' {frmPrincipal},
  UCNumerosSC in 'UCNumerosSC.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.Run;
end.
