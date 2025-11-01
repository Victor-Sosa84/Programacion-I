program Archivos;

uses
  Vcl.Forms,
  UFPrincipal in 'UFPrincipal.pas' {frmPrincipal},
  UCArchivo in 'UCArchivo.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.Run;
end.
