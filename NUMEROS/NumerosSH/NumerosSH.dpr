program NumerosSH;

uses
  Vcl.Forms,
  UFPrincipalSH in 'UFPrincipalSH.pas' {frmPrincipal},
  UCNumerosSH in 'UCNumerosSH.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.Run;
end.
