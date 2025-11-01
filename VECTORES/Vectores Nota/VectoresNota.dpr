program VectoresNota;

uses
  Vcl.Forms,
  UFPrincipal in 'UFPrincipal.pas' {frmPrincipal},
  UCVectorNota in 'UCVectorNota.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.Run;
end.
