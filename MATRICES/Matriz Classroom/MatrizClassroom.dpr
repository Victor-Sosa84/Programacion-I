program MatrizClassroom;

uses
  Vcl.Forms,
  UFPrincipal in 'UFPrincipal.pas' {frmPrincipal},
  UCMatrizClassroom in 'UCMatrizClassroom.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.Run;
end.
