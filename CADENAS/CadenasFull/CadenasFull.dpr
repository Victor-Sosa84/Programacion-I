program CadenasFull;

uses
  Vcl.Forms,
  UFPrincipalFull in 'UFPrincipalFull.pas' {frmPrincipal},
  UCCadenaFull in 'UCCadenaFull.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.Run;
end.
