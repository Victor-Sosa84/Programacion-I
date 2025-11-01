program VectoresNodo;

uses
  Vcl.Forms,
  UFPrincipal in 'UFPrincipal.pas' {frmPrincipal},
  UCVectorNodo in 'UCVectorNodo.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.Run;
end.
