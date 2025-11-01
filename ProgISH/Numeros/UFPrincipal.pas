unit UFPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus,UCNumero, Vcl.StdCtrls;

type
  TfrmPrincipal = class(TForm)
    MainMenu1: TMainMenu;
    Metodos1: TMenuItem;
    Metodos2: TMenuItem;
    Obtenervalor1: TMenuItem;
    Obtenervalor2: TMenuItem;
    buscardigito1: TMenuItem;
    edValor: TEdit;
    Label1: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure Metodos2Click(Sender: TObject);
    procedure Obtenervalor1Click(Sender: TObject);
    procedure buscardigito1Click(Sender: TObject);
  private
    { Private declarations }
    N : Numero;
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

{$R *.dfm}

procedure TfrmPrincipal.buscardigito1Click(Sender: TObject);
begin
    Label1.Caption:=IntToStr(N.findDigit(StrToInt(edValor.Text)));
end;

procedure TfrmPrincipal.FormCreate(Sender: TObject);
begin
     N := Numero.Create;
end;

procedure TfrmPrincipal.Metodos2Click(Sender: TObject);
begin
     N.setValue(StrToInt(edValor.Text));
end;

procedure TfrmPrincipal.Obtenervalor1Click(Sender: TObject);
begin
    Label1.Caption:=IntToStr(N.getValue);
end;

end.
