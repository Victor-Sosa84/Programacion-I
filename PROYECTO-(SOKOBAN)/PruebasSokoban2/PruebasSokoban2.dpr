program PruebasSokoban2;

uses
  Vcl.Forms,
  UFPrincipal in 'UFPrincipal.pas' {Form1},
  UCPersonaje in 'UCPersonaje.pas',
  UCCaja in 'UCCaja.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
