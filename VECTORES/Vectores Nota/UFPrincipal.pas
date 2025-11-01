unit UFPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  UCVectorNota,Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Grids, Vcl.StdCtrls,
  Vcl.Menus;

type
  TfrmPrincipal = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Edit4: TEdit;
    SGNota: TStringGrid;
    Button1: TButton;
    MainMenu1: TMainMenu;
    Metodos1: TMenuItem;
    Metodos2: TMenuItem;
    OrdenarPorCodigo1: TMenuItem;
    Label5: TLabel;
    Edit5: TEdit;
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Metodos2Click(Sender: TObject);
    procedure OrdenarPorCodigo1Click(Sender: TObject);
  private
    { Private declarations }
    Uni: Universidad;
  public
    { Public declarations }
    Procedure Visualizar;
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

{$R *.dfm}

procedure TfrmPrincipal.Button1Click(Sender: TObject);
Var
  N : Nota;
begin
     N.Registro:=StrToInt(Edit1.Text);
     N.Nombre:=Edit2.Text;
     N.Materia:=Edit3.Text;
     N.Semestre:=StrToInt(Edit4.Text);
     N.Nota:=StrToFloat(Edit5.Text);
     Uni.AddElement(N);
     Visualizar;
end;

procedure TfrmPrincipal.FormCreate(Sender: TObject);
begin
     SGNota.Cells[0,0]:='Registro';
     SGNota.Cells[1,0]:='Nombre';
     SGNota.Cells[2,0]:='Materia';
     SGNota.Cells[3,0]:='Semestre';
     SGNota.Cells[4,0]:='Nota';
     Uni:= Universidad.Create;
end;

procedure TfrmPrincipal.Metodos2Click(Sender: TObject);
begin
     Uni.SortName;
     Visualizar;
end;

procedure TfrmPrincipal.OrdenarPorCodigo1Click(Sender: TObject);
begin
    Uni.SortRegister;
    Visualizar;
end;

procedure TfrmPrincipal.Visualizar;
Var
   I : Word;
begin
     SGNota.RowCount:=Uni.Dim+1;
     for I := 1 to Uni.Dim do
     Begin
         SGNota.Cells[0,i]:=IntToStr(Uni.GetElement(i).Registro);
         SGNota.Cells[1,i]:=Uni.GetElement(i).Nombre;
         SGNota.Cells[2,i]:=Uni.GetElement(i).Materia;
         SGNota.Cells[3,i]:=IntToStr(Uni.GetElement(i).Semestre);
         SGNota.Cells[4,i]:=FloatToStr(Uni.GetElement(i).Nota);
     End;

end;

end.
