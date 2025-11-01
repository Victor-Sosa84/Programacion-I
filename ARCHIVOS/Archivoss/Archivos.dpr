program Archivos;

uses
  Vcl.Forms,
  UFPrincipal in 'UFPrincipal.pas' {frmPrincipal},
  UCArchivoTexto in 'UCArchivoTexto.pas',
  UCCadenaFull in '..\CadenasFull\UCCadenaFull.pas',
  UCNumeroFull in '..\NumerosFull\1\UCNumeroFull.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.Run;
end.
