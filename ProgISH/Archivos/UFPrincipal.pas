unit UFPrincipal;

interface

uses
  UCArchivo,Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus, Vcl.StdCtrls;

type
  TfrmPrincipal = class(TForm)
    MainMenu1: TMainMenu;
    Metodos1: TMenuItem;
    Metodos2: TMenuItem;
    Cerrararchivo1: TMenuItem;
    ODAbrir: TOpenDialog;
    Memo1: TMemo;
    Guardararchivo1: TMenuItem;
    SDGuardar: TSaveDialog;
    procedure Metodos2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Guardararchivo1Click(Sender: TObject);
  private
    { Private declarations }
    MyArchivo : ArchivoTexto;
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

{$R *.dfm}

procedure TfrmPrincipal.FormCreate(Sender: TObject);
begin
     MyArchivo := ArchivoTexto.Create;
end;

procedure TfrmPrincipal.Guardararchivo1Click(Sender: TObject);
begin
     if SDGuardar.Execute then
     Begin
          MyArchivo.Open(SDGuardar.FileName,Escritura);
          MyArchivo.writeLns(Memo1.Lines);
     End;
end;

procedure TfrmPrincipal.Metodos2Click(Sender: TObject);
begin
     if ODAbrir.Execute then
     Begin
          MyArchivo.Open(ODAbrir.FileName,Lectura);
          Memo1.Lines.Assign(MyArchivo.readLns);
     End;
end;

end.
