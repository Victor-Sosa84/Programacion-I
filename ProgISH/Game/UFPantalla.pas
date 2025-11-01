unit UFPantalla;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs,UCSoko, System.ImageList, Vcl.ImgList,
  Vcl.Menus, Vcl.StdCtrls;

type
  TForm1 = class(TForm)
    ImageList1: TImageList;
    MainMenu1: TMainMenu;
    Etapas1: TMenuItem;
    Etapas2: TMenuItem;
    Etapa21: TMenuItem;
    Etapa22: TMenuItem;
    Label1: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure FormDblClick(Sender: TObject);
    procedure FormPaint(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure Etapas2Click(Sender: TObject);
    procedure Etapa21Click(Sender: TObject);
    procedure Etapa22Click(Sender: TObject);
  private
    { Private declarations }
    Juego : Terreno;
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  i,j,i1,j2: integer;

implementation

{$R *.dfm}

procedure TForm1.Etapa21Click(Sender: TObject);
var
    x,y,k,l,a: word;
begin
    Juego.CargarEtapa(2);
    i:=16; j:=13;

    i1:=17; j2:=22;

    //Y:=(1080 div 2) div 2;
     for k := 1 to Juego.Filas do
     Begin
      //   X:=(1920 div 2) div 2;
         for l := 1 to Juego.Columnas do
         Begin
           a:=juego.getElemento(k,l);
          // ImageList1.Draw(Canvas,X,Y,a);
          // X:=X+32;
            juego.cambiar(k,l,a)
         End;
         //Y:=Y+32;
     End;

     repaint;
end;

procedure TForm1.Etapa22Click(Sender: TObject);
var
    x,y,k,l,a: word;
begin
    Juego.CargarEtapa(3);
    i:=19; j:=9;

    i1:=17; j2:=22;

    //Y:=(1080 div 2) div 2;
     for k := 1 to Juego.Filas do
     Begin
      //   X:=(1920 div 2) div 2;
         for l := 1 to Juego.Columnas do
         Begin
           a:=juego.getElemento(k,l);
          // ImageList1.Draw(Canvas,X,Y,a);
          // X:=X+32;
            juego.cambiar(k,l,a)
         End;
         //Y:=Y+32;
     End;

     repaint;
end;

procedure TForm1.Etapas2Click(Sender: TObject);
var
    x,y,k,l,a: word;
begin
    Juego.CargarEtapa(1);
    i:=7; j:=2;

    i1:=17; j2:=22;

    //Y:=(1080 div 2) div 2;
     for k := 1 to Juego.Filas do
     Begin
      //   X:=(1920 div 2) div 2;
         for l := 1 to Juego.Columnas do
         Begin
           a:=juego.getElemento(k,l);
          // ImageList1.Draw(Canvas,X,Y,a);
          // X:=X+32;
            juego.cambiar(k,l,a)
         End;
         //Y:=Y+32;
     End;

     repaint;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
     Juego := Terreno.Create;
end;

procedure TForm1.FormDblClick(Sender: TObject);
begin
     application.Terminate;
end;

procedure TForm1.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
    if key=27 then application.Terminate;
    case key of

        38: begin
              case juego.getElemento(i-1,j) of
               0: begin juego.intercambiar(i,j,i-1,j); Dec(i) end;
               2: begin
                    case juego.getElemento(i-2,j) of
                    0:begin
                        juego.intercambiar(i-1,j,i-2,j);
                        juego.intercambiar(i,j,i-1,j);
                        Dec(i)
                      end;
                    5:begin
                        juego.cambiar(i-1,j,4);
                        juego.cambiar(i-2,j,0);
                        juego.intercambiar(i-1,j,i-2,j);
                        juego.intercambiar(i,j,i-1,j);
                        Dec(i)
                      end;
                    end;
                  end;
                4:begin
                    case juego.getElemento(i-2,j) of
                    0:begin
                        juego.cambiar(i-1,j,2);
                        juego.cambiar(i-2,j,0);
                        juego.intercambiar(i-1,j,i-2,j);
                        juego.intercambiar(i,j,i-1,j);
                        Dec(i)
                      end;
                    5:begin
                        juego.cambiar(i-2,j,0);
                        juego.intercambiar(i-1,j,i-2,j);
                        juego.intercambiar(i,j,i-1,j);
                        Dec(i)
                      end;
                    end;
                  end;
                5:begin
                    juego.cambiar(i-1,j,0); juego.intercambiar(i,j,i-1,j); Dec(i);
                  end;
              end;

            end;

        39: begin
              case juego.getElemento(i,j+1) of
               0: begin juego.intercambiar(i,j,i,j+1); Inc(j); end;
               2: begin
                    case juego.getElemento(i,j+2) of
                    0:begin
                        juego.intercambiar(i,j+1,i,j+2);
                        juego.intercambiar(i,j,i,j+1);
                        Inc(j);
                      end;
                    5:begin
                        juego.cambiar(i,j+1,4);
                        juego.cambiar(i,j+2,0);
                        juego.intercambiar(i,j+1,i,j+2);
                        juego.intercambiar(i,j,i,j+1);
                        Inc(j)
                      end;
                    end;
                  end;
               4: begin
                    case juego.getElemento(i,j+2) of
                    0:begin
                        juego.cambiar(i,j+1,2);
                        juego.cambiar(i,j+2,0);
                        juego.intercambiar(i,j+1,i,j+2);
                        juego.intercambiar(i,j,i,j+1);
                        Inc(j)
                      end;
                    5:begin
                        juego.cambiar(i,j+2,0);
                        juego.intercambiar(i,j+1,i,j+2);
                        juego.intercambiar(i,j,i,j+1);
                        Inc(j)
                      end;
                    end;
                  end;
                5:begin
                    juego.cambiar(i,j+1,0); juego.intercambiar(i,j,i,j+1); Inc(j);
                  end;
              end;
            end;

        37: begin
              case juego.getElemento(i,j-1) of
               0: begin juego.intercambiar(i,j,i,j-1); Dec(j) end;
               2: begin
                    case juego.getElemento(i,j-2) of
                    0:begin
                        juego.intercambiar(i,j-1,i,j-2);
                        juego.intercambiar(i,j,i,j-1);
                        Dec(j)
                      end;
                    5:begin
                        juego.cambiar(i,j-1,4);
                        juego.cambiar(i,j-2,0);
                        juego.intercambiar(i,j-1,i,j-2);
                        juego.intercambiar(i,j,i,j-1);
                        Dec(j)
                      end;
                    end;
                  end;
               4: begin
                    case juego.getElemento(i,j-2) of
                    0:begin
                        juego.cambiar(i,j-1,2);
                        juego.cambiar(i,j-2,0);
                        juego.intercambiar(i,j-1,i,j-2);
                        juego.intercambiar(i,j,i,j-1);
                        Dec(j)
                      end;
                    5:begin
                        juego.cambiar(i,j-2,0);
                        juego.intercambiar(i,j-1,i,j-2);
                        juego.intercambiar(i,j,i,j-1);
                        Dec(j)
                      end;
                    end;
                  end;
                5:begin
                    juego.cambiar(i,j-1,0); juego.intercambiar(i,j,i,j-1); Dec(j);
                  end;
              end;
            end;
        40: begin
              case juego.getElemento(i+1,j) of
               0: begin juego.intercambiar(i,j,i+1,j); Inc(i) end;
               2: begin
                    case juego.getElemento(i+2,j) of
                    0:begin
                        juego.intercambiar(i+1,j,i+2,j);
                        juego.intercambiar(i,j,i+1,j);
                        Inc(i)
                      end;
                    5:begin
                        juego.cambiar(i+1,j,4);
                        juego.cambiar(i+2,j,0);
                        juego.intercambiar(i+1,j,i+2,j);
                        juego.intercambiar(i,j,i+1,j);
                        Inc(i)
                      end;
                    end;
                  end;
                4:begin
                    case juego.getElemento(i+2,j) of
                    0:begin
                        juego.cambiar(i+1,j,2);
                        juego.cambiar(i+2,j,0);
                        juego.intercambiar(i+1,j,i+2,j);
                        juego.intercambiar(i,j,i+1,j);
                        Inc(i)
                      end;
                    5:begin
                        juego.cambiar(i+2,j,0);
                        juego.intercambiar(i+1,j,i+2,j);
                        juego.intercambiar(i,j,i+1,j);
                        Inc(i)
                      end;
                    end;
                  end;
                5:begin
                    juego.cambiar(i+1,j,0); juego.intercambiar(i,j,i+1,j); Inc(i);
                  end;
              end;
            end;
    end;
    if juego.getElemento(i1,j2)=0 then juego.cambiar(i1,j2,5);
    if juego.getElemento(i1,j2+1)=0 then juego.cambiar(i1,j2+1,5);
    if juego.getElemento(i1,j2+2)=0 then juego.cambiar(i1,j2+2,5);

    if (juego.getElemento(i1,j2)=4) and (juego.getElemento(i1,j2+1)=4) and (juego.getElemento(i1,j2)=4) then
    begin
      label1.Caption:='You Win!'; label1.Font.Color:=clAqua;
    end else
    begin
      label1.Caption:='Keep Going!'; label1.Font.Color:=clWhite;
    end;

    repaint;
end;

procedure TForm1.FormPaint(Sender: TObject);
var k,l,X,Y,a: Integer;
begin
     Y:=(1080 div 2) div 2;
     for k := 1 to Juego.Filas do
     Begin
         X:=(1920 div 2) div 2;
         for l := 1 to Juego.Columnas do
         Begin
           a:= Juego.getElemento(k,l);
           ImageList1.Draw(Canvas,X,Y,a);
           X:=X+32;
         End;
         Y:=Y+32;
     End;
end;

end.
