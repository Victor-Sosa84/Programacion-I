unit UFPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus,UCCadena, Vcl.StdCtrls;

type
  TfrmPrincipal = class(TForm)
    MainMenu1: TMainMenu;
    Metodos1: TMenuItem;
    Metodos2: TMenuItem;
    MostrarTexto1: TMenuItem;
    Edit1: TEdit;
    Label1: TLabel;
    Longitud1: TMenuItem;
    InsertarCaracter1: TMenuItem;
    Edit2: TEdit;
    EliminarCaracter1: TMenuItem;
    ModificarCaracter1: TMenuItem;
    ContarVocales1: TMenuItem;
    AadirCaracter1: TMenuItem;
    ObtenerCaracter1: TMenuItem;
    ContarPalabras1: TMenuItem;
    EliminarPalabra1: TMenuItem;
    EliminarNChar1: TMenuItem;
    InsertarPalabra1: TMenuItem;
    ReemplazarPalabra1: TMenuItem;
    SumarBinarios1: TMenuItem;
    procedure FormCreate(Sender: TObject);
    procedure Metodos2Click(Sender: TObject);
    procedure MostrarTexto1Click(Sender: TObject);
    procedure Longitud1Click(Sender: TObject);
    procedure InsertarCaracter1Click(Sender: TObject);
    procedure EliminarCaracter1Click(Sender: TObject);
    procedure ModificarCaracter1Click(Sender: TObject);
    procedure ContarVocales1Click(Sender: TObject);
    procedure AadirCaracter1Click(Sender: TObject);
    procedure ObtenerCaracter1Click(Sender: TObject);
    procedure ContarPalabras1Click(Sender: TObject);
    procedure EliminarPalabra1Click(Sender: TObject);
    procedure EliminarNChar1Click(Sender: TObject);
    procedure InsertarPalabra1Click(Sender: TObject);
    procedure ReemplazarPalabra1Click(Sender: TObject);
    procedure SumarBinarios1Click(Sender: TObject);
  private
    { Private declarations }
    C : Cadena;
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

{$R *.dfm}

procedure TfrmPrincipal.AadirCaracter1Click(Sender: TObject);
begin
   c.addChar(Edit1.Text[1]);
end;

procedure TfrmPrincipal.ContarPalabras1Click(Sender: TObject);
begin
    label1.Caption:=IntToStr(c.findnumWord(edit1.text));
end;

procedure TfrmPrincipal.ContarVocales1Click(Sender: TObject);
begin
    label1.Caption:=IntToStr(c.getVowels);
end;

procedure TfrmPrincipal.EliminarCaracter1Click(Sender: TObject);
begin
   c.delChar(StrToInt(Edit1.Text));
end;

procedure TfrmPrincipal.EliminarNChar1Click(Sender: TObject);
begin
    c.delNChar(StrToInt(edit1.Text),StrToInt(edit2.text));
end;

procedure TfrmPrincipal.EliminarPalabra1Click(Sender: TObject);
begin
    c.delWord(edit1.text);
end;

procedure TfrmPrincipal.FormCreate(Sender: TObject);
begin
     C := Cadena.Create;
end;

procedure TfrmPrincipal.InsertarCaracter1Click(Sender: TObject);
begin
    c.insChar(StrToInt(Edit1.Text),Edit2.Text[1]);
end;

procedure TfrmPrincipal.InsertarPalabra1Click(Sender: TObject);
begin
    c.insWord(StrToInt(edit1.Text),edit2.text);
end;

procedure TfrmPrincipal.Longitud1Click(Sender: TObject);
begin
   label1.Caption:=IntToStr(c.getLong);
end;

procedure TfrmPrincipal.Metodos2Click(Sender: TObject);
begin
     C.addStr(Edit1.Text);
end;

procedure TfrmPrincipal.ModificarCaracter1Click(Sender: TObject);
begin
   c.modChar(StrToInt(Edit1.Text),Edit2.Text[1]);
end;

procedure TfrmPrincipal.MostrarTexto1Click(Sender: TObject);
begin
    Label1.Caption:= C.getStr;
end;

procedure TfrmPrincipal.ObtenerCaracter1Click(Sender: TObject);
begin
   label1.caption:=c.getChar(StrToInt(Edit1.Text));
end;

procedure TfrmPrincipal.ReemplazarPalabra1Click(Sender: TObject);
begin
    c.replaceWord(edit1.Text,edit2.Text);
end;

procedure TfrmPrincipal.SumarBinarios1Click(Sender: TObject);
begin
    label1.Caption:= c.sumaBin;
end;

end.
