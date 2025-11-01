unit UFPrincipalPrueba;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Menus, UCNumeroPrueba;

type
  TForm2 = class(TForm)
    Edit1: TEdit;
    MainMenu1: TMainMenu;
    Label1: TLabel;
    METODOS1: TMenuItem;
    METODOS2: TMenuItem;
    AadirDigitoFinal1: TMenuItem;
    NumeroDeDigitos1: TMenuItem;
    ModificarDigito1: TMenuItem;
    ModificarDigito2: TMenuItem;
    EliminarDigito1: TMenuItem;
    ObtenerDigito1: TMenuItem;
    MostrarDigito1: TMenuItem;
    ObtenerNumero1: TMenuItem;
    Edit2: TEdit;
    MayorSumaDeDigitosQueDen101: TMenuItem;
    SumarDigitos1: TMenuItem;
    procedure FormCreate(Sender: TObject);
    procedure MostrarDigito1Click(Sender: TObject);
    procedure ObtenerNumero1Click(Sender: TObject);
    procedure METODOS2Click(Sender: TObject);
    procedure AadirDigitoFinal1Click(Sender: TObject);
    procedure NumeroDeDigitos1Click(Sender: TObject);
    procedure ModificarDigito1Click(Sender: TObject);
    procedure ObtenerDigito1Click(Sender: TObject);
    procedure ModificarDigito2Click(Sender: TObject);
    procedure EliminarDigito1Click(Sender: TObject);
    procedure MayorSumaDeDigitosQueDen101Click(Sender: TObject);
    procedure SumarDigitos1Click(Sender: TObject);
  private
    n: Numero;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation

{$R *.dfm}

procedure TForm2.AadirDigitoFinal1Click(Sender: TObject);
begin
    n.addDigitLast(StrToInt(edit1.Text));
end;

procedure TForm2.EliminarDigito1Click(Sender: TObject);
begin
    n.delDigit(StrToInt(edit1.Text));
end;

procedure TForm2.FormCreate(Sender: TObject);
begin
   n:=Numero.Create;
end;

procedure TForm2.MayorSumaDeDigitosQueDen101Click(Sender: TObject);
begin
    label1.Caption:=IntToStr(n.sumDigit10);
end;

procedure TForm2.METODOS2Click(Sender: TObject);
begin
    n.addDigitFirst(StrToInt(edit1.Text));
end;

procedure TForm2.ModificarDigito1Click(Sender: TObject);
begin
    n.modDigit(StrToInt(edit1.Text),StrToInt(edit2.Text));
end;

procedure TForm2.ModificarDigito2Click(Sender: TObject);
begin
    n.insDigit(StrToInt(edit1.Text),StrToInt(edit2.Text));
end;

procedure TForm2.MostrarDigito1Click(Sender: TObject);
begin
    label1.Caption:=IntToStr(n.getNum);
end;

procedure TForm2.NumeroDeDigitos1Click(Sender: TObject);
begin
    label1.Caption:=IntToStr(n.getNumDigit);
end;

procedure TForm2.ObtenerDigito1Click(Sender: TObject);
begin
    label1.Caption:=IntToStr(n.getDigit(StrToInt(edit1.Text)));
end;

procedure TForm2.ObtenerNumero1Click(Sender: TObject);
begin
    n.setNum(StrToInt(edit1.Text));
end;

procedure TForm2.SumarDigitos1Click(Sender: TObject);
begin
    label1.Caption:=IntToStr(n.SumAllDigit);
end;

end.
