unit UFPrincipal;

interface

uses
  UCMatriz, Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Grids, Vcl.StdCtrls, Vcl.Menus;

type
  TForm1 = class(TForm)
    SGMatriz: TStringGrid;
    MainMenu1: TMainMenu;
    ScrollBar1: TScrollBar;
    ScrollBar2: TScrollBar;
    METODOS1: TMenuItem;
    METODOS2: TMenuItem;
    MostrarMatriz1: TMenuItem;
    EliminarColumna1: TMenuItem;
    Edit1: TEdit;
    InsertarColumna1: TMenuItem;
    EliminarFila1: TMenuItem;
    EliminarFila2: TMenuItem;
    AadirColumna1: TMenuItem;
    AadirColumna2: TMenuItem;
    IntercambiarCeldas1: TMenuItem;
    Cargar1: TMenuItem;
    procedure FormCreate(Sender: TObject);
    procedure ScrollBar1Change(Sender: TObject);
    procedure ScrollBar2Change(Sender: TObject);
    procedure METODOS2Click(Sender: TObject);
    procedure MostrarMatriz1Click(Sender: TObject);
    procedure EliminarColumna1Click(Sender: TObject);
    procedure InsertarColumna1Click(Sender: TObject);
    procedure EliminarFila1Click(Sender: TObject);
    procedure EliminarFila2Click(Sender: TObject);
    procedure AadirColumna1Click(Sender: TObject);
    procedure AadirColumna2Click(Sender: TObject);
    procedure IntercambiarCeldas1Click(Sender: TObject);
    procedure Cargar1Click(Sender: TObject);
  private
    { Private declarations }
    m : Matriz;
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.AadirColumna1Click(Sender: TObject);
begin
    m.addColum
end;

procedure TForm1.AadirColumna2Click(Sender: TObject);
begin
    m.addFila
end;

procedure TForm1.Cargar1Click(Sender: TObject);
begin
  m.
end;

procedure TForm1.EliminarColumna1Click(Sender: TObject);
begin
    m.delColum(StrToInt(edit1.Text));
end;

procedure TForm1.EliminarFila1Click(Sender: TObject);
begin
    m.delFila(StrToInt(edit1.Text))
end;

procedure TForm1.EliminarFila2Click(Sender: TObject);
begin
    m.insFila(StrToInt(edit1.Text))
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
    m:= matriz.Create;
end;

procedure TForm1.InsertarColumna1Click(Sender: TObject);
begin
    m.insColum(StrToInt(edit1.Text));
end;

procedure TForm1.IntercambiarCeldas1Click(Sender: TObject);
begin
    m.intercElement(StrToInt(InputBox('','Fila 2: ','')),StrToInt(InputBox('','Columna 2: ','')),StrToInt(InputBox('','Fila 1: ','')),StrToInt(InputBox('','Columna 1: ','')));
end;

procedure TForm1.METODOS2Click(Sender: TObject);
var
  i,j: Integer;
begin
    m.Redimensionar(sgmatriz.RowCount, sgmatriz.ColCount);
    for i := 1 to m.Filas do
      for j := 1 to m.Columnas do
        m.modElement(i,j,StrToFloat(sgmatriz.Cells[j-1,i-1]));
end;

procedure TForm1.MostrarMatriz1Click(Sender: TObject);
var
  i,j: Integer;
begin
    sgmatriz.RowCount:= M.Filas;
    sgmatriz.ColCount:= m.Columnas;
    for i := 1 to m.Filas do
      for j := 1 to m.Columnas do
        sgmatriz.Cells[j-1,i-1]:= FloatToStr(m.obtElement(i,j));
end;

procedure TForm1.ScrollBar1Change(Sender: TObject);
begin
    SGMatriz.RowCount:= ScrollBar1.Position;
end;

procedure TForm1.ScrollBar2Change(Sender: TObject);
begin
    SGMatriz.ColCount:= ScrollBar2.Position;
end;

end.
