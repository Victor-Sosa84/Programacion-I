unit UFPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs,UCMatrizClassroomString, Vcl.StdCtrls, Vcl.Grids,
  Vcl.Menus;

type
  TfrmPrincipal = class(TForm)
    MainMenu1: TMainMenu;
    Metodos1: TMenuItem;
    Metodos2: TMenuItem;
    MostrarMatriz1: TMenuItem;
    SGMatriz: TStringGrid;
    ScrollBar1: TScrollBar;
    ScrollBar2: TScrollBar;
    EliminarFila1: TMenuItem;
    OrdenarFilas1: TMenuItem;
    OrdenarColumnas1: TMenuItem;
    OrdenarTodoxfilas1: TMenuItem;
    Cumpleaos1: TMenuItem;
    MayorAo1: TMenuItem;
    MayorAo2: TMenuItem;
    Ordenar1: TMenuItem;
    procedure FormCreate(Sender: TObject);
    procedure ScrollBar1Change(Sender: TObject);
    procedure ScrollBar2Change(Sender: TObject);
    procedure Metodos2Click(Sender: TObject);
    procedure MostrarMatriz1Click(Sender: TObject);
    procedure EliminarFila1Click(Sender: TObject);
    procedure OrdenarFilas1Click(Sender: TObject);
    procedure OrdenarColumnas1Click(Sender: TObject);
    procedure OrdenarTodoxfilas1Click(Sender: TObject);
    procedure Cumpleaos1Click(Sender: TObject);
    procedure MayorAo1Click(Sender: TObject);
    procedure MayorAo2Click(Sender: TObject);
    procedure Ordenar1Click(Sender: TObject);
  private
    { Private declarations }
    M : Matriz;
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

{$R *.dfm}

procedure TfrmPrincipal.Cumpleaos1Click(Sender: TObject);
begin
    ShowMessage(m.Birthday(StrToDate(InputBox('Cumpleaños','Escriba fecha usando /',''))));
end;

procedure TfrmPrincipal.EliminarFila1Click(Sender: TObject);
begin
     M.delFila(StrToInt(InputBox('Metriz','Digite fila a eliminar','1')))
end;

procedure TfrmPrincipal.FormCreate(Sender: TObject);
begin
     M := Matriz.Create;
end;

procedure TfrmPrincipal.MayorAo1Click(Sender: TObject);
begin
    ShowMessage(IntToStr(m.HighestYear));
end;

procedure TfrmPrincipal.MayorAo2Click(Sender: TObject);
begin
  ShowMessage(m.HighestBirthday(InputBox('Mayor Cumpleaños','Dia',''),InputBox('Mayor Cumpleaños','Mes','')));
end;

procedure TfrmPrincipal.Metodos2Click(Sender: TObject);
var
  I: Integer;
  J: Integer;
begin
     M.Dimensionar(SGMatriz.RowCount,SGMatriz.ColCount);
     for I := 1 to M.Filas do
        for J := 1 to M.Columnas do
          M.setCelda(i,j,SGMatriz.Cells[j-1,i-1])
end;

procedure TfrmPrincipal.MostrarMatriz1Click(Sender: TObject);
Var
  i,j : Word;
begin
     SGMatriz.ColCount:=M.Columnas;
     SGMatriz.RowCount:=M.Filas;
     for I := 1 to M.Filas do
        for J := 1 to M.Columnas do
            SGMatriz.Cells[j-1,i-1]:=M.getCelda(i,j);
end;

procedure TfrmPrincipal.Ordenar1Click(Sender: TObject);
begin
    M.ordenarShell;
end;

procedure TfrmPrincipal.OrdenarColumnas1Click(Sender: TObject);
begin
     M.ColumnSort;
end;

procedure TfrmPrincipal.OrdenarFilas1Click(Sender: TObject);
begin
     M.RowSort;
end;

procedure TfrmPrincipal.OrdenarTodoxfilas1Click(Sender: TObject);
begin
     M.FullSort;
end;

procedure TfrmPrincipal.ScrollBar1Change(Sender: TObject);
begin
     SGMatriz.ColCount:=ScrollBar1.Position;
end;

procedure TfrmPrincipal.ScrollBar2Change(Sender: TObject);
begin
     SGMatriz.RowCount:=ScrollBar2.Position;
end;

end.
