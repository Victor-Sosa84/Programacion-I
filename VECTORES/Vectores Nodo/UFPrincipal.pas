unit UFPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  UCVectorNodo,Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Grids, Vcl.StdCtrls,
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
    SGNota: TStringGrid;
    Button1: TButton;
    MainMenu1: TMainMenu;
    Metodos1: TMenuItem;
    Velocidad1: TMenuItem;
    Label5: TLabel;
    Label6: TLabel;
    Edit4: TEdit;
    Velocidad2: TMenuItem;
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Velocidad1Click(Sender: TObject);
    procedure Velocidad2Click(Sender: TObject);
  private
    { Private declarations }
    n: vector;
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
  Nod : Nodo;
begin
     Nod.Nodo:=StrToInt(Edit1.Text);
     Nod.FechHorS:=StrToInt(Edit2.Text);
     Nod.FechHorL:=StrToInt(Edit3.Text);
     Nod.Distancia:=StrToInt(Edit4.Text);
     n.AddElement(Nod);
     Visualizar;
end;

procedure TfrmPrincipal.FormCreate(Sender: TObject);
begin
     SGNota.Cells[0,0]:='Nodo';
     SGNota.Cells[1,0]:='FechHorSal';
     SGNota.Cells[2,0]:='FechHorLleg';
     SGNota.Cells[3,0]:='Distancia';
     n:= vector.Create;
end;

procedure TfrmPrincipal.Velocidad1Click(Sender: TObject);
var
  n1,n2,d,fs,fl: word;
  i: Integer;
begin
    n1:=StrToInt(InputBox('','Nodo 1',''));
    n2:=StrToInt(InputBox('','Nodo 2',''));

    i:=1;
    while i<=N.Dim do
    begin
      if i=n1 then
      begin
        fs:= StrToInt(SGNota.Cells[1,i]);
        d:= StrToInt(SGNota.Cells[3,i]);
      end;
      if i=n2 then begin
        fl:= StrToInt(SGNota.Cells[2,i]);
      end;
      Inc(i);
    end;

    label4.Caption:= FloatToStr(n.Velocidad(d,fs,fl));
end;

procedure TfrmPrincipal.Velocidad2Click(Sender: TObject);
begin
  ShowMessage('Velocidad Mayor Es: '+ FloatToStr(n.VelocidadMayor));
end;

procedure TfrmPrincipal.Visualizar;
Var
   I : Word;
begin
     SGNota.RowCount:=n.Dim+1;
     for I := 1 to n.Dim do
     Begin
         SGNota.Cells[0,i]:=IntToStr(n.GetElement(i).Nodo);
         SGNota.Cells[1,i]:=IntToStr(n.GetElement(i).FechHorS);
         SGNota.Cells[2,i]:=IntToStr(n.GetElement(i).FechHorL);
         SGNota.Cells[3,i]:=IntToStr(n.GetElement(i).Distancia);
     End;

end;

end.
