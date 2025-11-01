program VectoresString;

uses
  Vcl.Forms,
  UFPrincipal in 'UFPrincipal.pas' {frmPrincipal},
  UCVectorString in 'UCVectorString.pas',
  UCCadenaFull in 'E:\RAD Prog1\CadenasFull\UCCadenaFull.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.Run;
end.
