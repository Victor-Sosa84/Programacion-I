program VectoresClassroom;

uses
  Vcl.Forms,
  UFPrincipal in 'UFPrincipal.pas' {frmPrincipal},
  UCVectorClassroom in 'UCVectorClassroom.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.Run;
end.
