unit UFPrincipalFull;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Menus, UCNumeroFull;

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
    Invertir1: TMenuItem;
    ConvertiraRomano1: TMenuItem;
    ConvertiraLiteral1: TMenuItem;
    EncontrarDigito1: TMenuItem;
    EncontrarDigito2: TMenuItem;
    ConvertiraBaseN1: TMenuItem;
    ConvertiraBaseN2: TMenuItem;
    EliminarNnumero1: TMenuItem;
    EliminarNdigitos1: TMenuItem;
    EliminarNdigitos2: TMenuItem;
    MASMETODOS1: TMenuItem;
    MASMETODOS2: TMenuItem;
    OrdenarDigitoDescendente1: TMenuItem;
    CantidadDigitosParesQueSuman101: TMenuItem;
    SepararRepetidos1: TMenuItem;
    EliminarDigito2: TMenuItem;
    DigitoEsta1: TMenuItem;
    DigitoNoEsta1: TMenuItem;
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
    procedure Invertir1Click(Sender: TObject);
    procedure ConvertiraRomano1Click(Sender: TObject);
    procedure ConvertiraLiteral1Click(Sender: TObject);
    procedure EncontrarDigito1Click(Sender: TObject);
    procedure EncontrarDigito2Click(Sender: TObject);
    procedure ConvertiraBaseN1Click(Sender: TObject);
    procedure ConvertiraBaseN2Click(Sender: TObject);
    procedure EliminarNnumero1Click(Sender: TObject);
    procedure EliminarNdigitos1Click(Sender: TObject);
    procedure EliminarNdigitos2Click(Sender: TObject);
    procedure MASMETODOS2Click(Sender: TObject);
    procedure OrdenarDigitoDescendente1Click(Sender: TObject);
    procedure CantidadDigitosParesQueSuman101Click(Sender: TObject);
    procedure SepararRepetidos1Click(Sender: TObject);
    procedure EliminarDigito2Click(Sender: TObject);
    procedure DigitoEsta1Click(Sender: TObject);
    procedure DigitoNoEsta1Click(Sender: TObject);
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

procedure TForm2.CantidadDigitosParesQueSuman101Click(Sender: TObject);
begin
    label1.Caption:= IntToStr(n.digitParSum10);
end;

procedure TForm2.ConvertiraBaseN1Click(Sender: TObject);
begin
    label1.Caption:= IntToStr(n.obtenerEnBaseN(StrToInt(edit1.Text)));
end;

procedure TForm2.ConvertiraBaseN2Click(Sender: TObject);
begin
    label1.Caption:= IntToStr(n.obtenerEnBase10(StrToInt(edit1.Text)));
end;

procedure TForm2.ConvertiraLiteral1Click(Sender: TObject);
begin
    label1.Caption:= n.toLiteral2D(StrToInt(edit1.text));
end;

procedure TForm2.ConvertiraRomano1Click(Sender: TObject);
begin
    label1.Caption:= n.toRoman;
end;

procedure TForm2.DigitoEsta1Click(Sender: TObject);
begin
  if n.DigitoEsta(StrToInt(Edit2.Text)) then
    label1.Caption:='ESTA EL DIGITO'
  else
    label1.Caption:='NO ESTA EL DIGITO';
end;

procedure TForm2.DigitoNoEsta1Click(Sender: TObject);
begin
    if n.DigitoNoEsta(StrToInt(Edit2.Text)) then
    label1.Caption:='NO ESTA EL DIGITO'
  else
    label1.Caption:='ESTA EL DIGITO';
end;

procedure TForm2.EliminarDigito1Click(Sender: TObject);
begin
    n.delDigit(StrToInt(edit1.Text));
end;

procedure TForm2.EliminarDigito2Click(Sender: TObject);
begin
   n.delAlldigit(StrToInt(Edit2.Text));
end;

procedure TForm2.EliminarNdigitos1Click(Sender: TObject);
begin
   n.delNdigit(StrToInt(edit1.Text),StrToInt(edit2.Text));
end;

procedure TForm2.EliminarNdigitos2Click(Sender: TObject);
begin
    label1.Caption:=IntToStr(n.getNdigit(StrToInt(edit1.Text),StrToInt(edit2.Text)));
end;

procedure TForm2.EliminarNnumero1Click(Sender: TObject);
begin
    n.delNnum(StrToInt(edit1.text));
end;

procedure TForm2.EncontrarDigito1Click(Sender: TObject);
begin
    label1.Caption:= 'El digito esta en la posición: ' + IntToStr(n.findDigit(StrToInt(edit1.Text)));
end;

procedure TForm2.EncontrarDigito2Click(Sender: TObject);
begin
    label1.Caption:= IntToStr(n.frequencyDigit(StrToInt(edit1.Text)));
end;

procedure TForm2.FormCreate(Sender: TObject);
begin
   n:=Numero.Create;
end;

procedure TForm2.Invertir1Click(Sender: TObject);
begin
    n.Invertir;
end;

procedure TForm2.MASMETODOS2Click(Sender: TObject);
begin
    n.insertNumOrdDesc(StrToInt(edit1.Text));

     label1.Caption:=IntToStr(n.getNum);
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

procedure TForm2.OrdenarDigitoDescendente1Click(Sender: TObject);
begin
    n.ordenarDigDescente;
end;

procedure TForm2.SepararRepetidos1Click(Sender: TObject);
begin
    label1.Caption:=IntToStr(n.SepararRepetidos);
end;

procedure TForm2.SumarDigitos1Click(Sender: TObject);
begin
    label1.Caption:=IntToStr(n.SumAllDigit);
end;

end.
