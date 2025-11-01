program ArchivosMyAuxi;

uses
  Vcl.Forms,
  UFPrincipalMy in 'UFPrincipalMy.pas' {frmPrincipal},
  UCArchivoTextoMy in 'UCArchivoTextoMy.pas',
  UCCadenaFull in '..\..\..\CadenasFull\UCCadenaFull.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.Run;
end.
