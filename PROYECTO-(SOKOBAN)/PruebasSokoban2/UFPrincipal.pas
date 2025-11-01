unit UFPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UCPersonaje, UCCaja, Vcl.ExtCtrls,
  Vcl.StdCtrls;
const
    maxC = 6;
type
  TForm1 = class(TForm)
    shPersonaje: TShape;
    Label1: TLabel;
    shCaja1: TShape;
    shCaja2: TShape;
    shCaja3: TShape;
    procedure FormCreate(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    x,y: integer;

    p: Personaje;
    Cajas: Array [1..maxC] of Caja;
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.FormCreate(Sender: TObject);
begin
    personaje.Create;
    caja.Create;

    x:=0;
    y:=0;

    shPersonaje.Left:=x;
    shPersonaje.Top:=y;

end;

procedure TForm1.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
    label1.Caption:= inttostr(key);

    case key of
      37: begin
            x:= p.move(key,x,y);
            if x>shCaja1.Left then shCaja1.left:=x;
          end;
      38: begin
            y:= p.move(key,x,y);
          end;
      39: begin
            x:= p.move(key,x,y);
          end;
      40: begin
            y:= p.move(key,x,y);
          end;
    end;
    shPersonaje.Left:=x;
    shPersonaje.Top:=y;

    if key = 27 then application.terminate; //salir con escape (ESC)
end;

end.
