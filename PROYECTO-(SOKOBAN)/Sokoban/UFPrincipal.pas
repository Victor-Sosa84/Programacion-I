unit UFPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, System.ImageList,
  Vcl.ImgList, Vcl.Menus, UCJuego, Vcl.ExtCtrls, Vcl.Imaging.pngimage,
  Vcl.MPlayer;

type
  TForm1 = class(TForm)
    Label1: TLabel;
    MainMenu1: TMainMenu;
    NIVELES1: TMenuItem;
    NIVELES2: TMenuItem;
    Nivel21: TMenuItem;
    Nivel22: TMenuItem;
    ImageList1: TImageList;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    MediaPlayer1: TMediaPlayer;
    Timer1: TTimer;
    Label5: TLabel;
    Label6: TLabel;
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
    procedure NIVELES2Click(Sender: TObject);
    procedure Nivel21Click(Sender: TObject);
    procedure Nivel22Click(Sender: TObject);
    procedure FormPaint(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
  private
    { Private declarations }
    Juego : Terreno;
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  i,j, i1,j1, i2,j2, i3,j3, //Posicion de Inicio del Personaje y Cajas
  con,con1,con2,con3,can,mov,n: integer;  //Contadores

implementation

{$R *.dfm}

procedure TForm1.FormCreate(Sender: TObject);
var
  f,c : word;
begin
    Juego := Terreno.Create;

    label4.Left:= 1920 div 2 - (label4.Width div 2);
    label6.Left:= 1920 div 2 - (label6.Width div 2);

    //Empezar Musica
    MediaPlayer1.FileName := ExtractFilePath(ParamStr(0)) + 'Musica_Fondo_BrawlStars.mp3';
    MediaPlayer1.Open; MediaPlayer1.Play;

    n:=0;
    juego.CargarNivel(n);

    i:=5; j:=5;    //Posicion Inicio del Personaje
    i1:=3; j1:=4;  //Posicion Caja 1
    i2:=3; j2:=6;  //Posicion Caja 2
    i3:=3; j3:=8;  //Posicion Caja 3

    for f := 1 to juego.Filas do
      for c := 1 to juego.Columnas do
        juego.cambiar(f,c,juego.getElement(f,c));
end;

procedure TForm1.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
    if key=27 then application.Terminate; //Salir con Esc

    if n=0 then
    begin
      label1.Visible:=False; label2.Visible:=False; label3.Visible:=False;
    end else
    begin
      label1.Visible:=True; label2.Visible:=True; label3.Visible:=True;
    end;

    case key of
        //Arriba
        38: begin
              Inc(mov); Juego.cambiar(i,j,8);
              case juego.getElement(i-1,j) of
               0: begin juego.intercambiar(i,j,i-1,j); Dec(i) end;
               2: begin
                    case juego.getElement(i-2,j) of
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
                    case juego.getElement(i-2,j) of
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
        //Derecha
        39: begin
              Inc(mov); juego.cambiar(i,j,7);
              case juego.getElement(i,j+1) of
               0: begin juego.intercambiar(i,j,i,j+1); Inc(j); end;
               2: begin
                    case juego.getElement(i,j+2) of
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
                    case juego.getElement(i,j+2) of
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
        //Izquierda
        37: begin
              Inc(mov); juego.cambiar(i,j,6);
              case juego.getElement(i,j-1) of
               0: begin juego.intercambiar(i,j,i,j-1); Dec(j) end;
               2: begin
                    case juego.getElement(i,j-2) of
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
                    case juego.getElement(i,j-2) of
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
        //Abajo
        40: begin
              Inc(mov); juego.cambiar(i,j,3);
              case juego.getElement(i+1,j) of
               0: begin juego.intercambiar(i,j,i+1,j); Inc(i) end;
               2: begin
                    case juego.getElement(i+2,j) of
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
                    case juego.getElement(i+2,j) of
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

    //Contador de Cajas y Verificación de los Lugares
    case juego.getElement(i1,j1) of
     4: con1:=1;
     0: begin con1:=0; juego.cambiar(i1,j1,5); end;
     else con1:=0;
    end;

    case juego.getElement(i2,j2) of
     4: con2:=1;
     0: begin con2:=0; juego.cambiar(i2,j2,5); end;
     else con2:=0;
    end;

    case juego.getElement(i3,j3) of
     4: con3:=1;
     0: begin con3:=0; juego.cambiar(i3,j3,5); end;
     else con3:=0;
    end;

    con:=con1+con2+con3;

    label2.Caption:='Cajas en su lugar: '+IntToStr(can)+'/'+IntToStr(con);

    //Verificacion de Ganar
    if (con=can) and (con<>0) then
    begin
      label1.Caption:='Ganaste!'; label1.font.Color:=clAqua;
    end else
    begin
      label1.caption:='Tú puedes!'; label1.Font.Color:=clWhite;
    end;

    label3.Caption:='Número de Movimientos: '+IntToStr(mov);

    repaint;
end;

procedure TForm1.FormPaint(Sender: TObject);
var
  f,c,x,y: integer;
begin
    y:=1080 div 2 - (juego.filas*64 div 2);
    for f := 1 to juego.Filas do
    begin
      x:=1920 div 2 - (juego.columnas*64 div 2);
      for c := 1 to juego.Columnas do
      begin
        ImageList1.Draw(Canvas,x,y,juego.getElement(f,c));
        x:=x+64;
      end;
      y:=y+64;
    end;
end;

procedure TForm1.Nivel21Click(Sender: TObject);
var
  f,c : word;
begin
    n:=2;
    juego.CargarNivel(n);

    i:=7; j:=7; //Posicion de Inicio del Personaje

    i1:=7; j1:=8; //Caja 1
    i2:=5; j2:=4; //Caja 2
    i3:=5; j3:=5; //Caja 3

    can:= 3; mov:=0;

    label1.Visible:=True; label2.Visible:=True; label3.Visible:=True;
    label6.Visible:=False;

    label1.caption:='Tú puedes!'; label1.Font.Color:=clWhite;
    label2.Caption:='Cajas en su lugar: 3/0';
    label3.Caption:='Número de Movimientos: 0';
    label5.Caption:='Nivel 2';

    label2.Left:= 1920 div 2 - (label2.Width div 2);
    label5.Left:= 1920 div 2 - (label5.Width div 2);

    for f := 1 to juego.Filas do
      for c := 1 to juego.Columnas do
        juego.cambiar(f,c,juego.getElement(f,c));

    repaint;
end;

procedure TForm1.Nivel22Click(Sender: TObject);
var
  f,c : word;
begin
    n:=3;
    juego.CargarNivel(n);

    i:=8; j:=7; //Posicion de Inicio del Personaje

    i1:=4; j1:=6; //Caja 1
    i2:=5; j2:=6; //Caja 2
    i3:=6; j3:=6; //Caja 3

    can:= 3; mov:=0;

    label1.Visible:=True; label2.Visible:=True; label3.Visible:=True;
    label6.Visible:=False;

    label1.caption:='Tú puedes!'; label1.Font.Color:=clWhite;
    label2.Caption:='Cajas en su lugar: 3/0';
    label3.Caption:='Número de Movimientos: 0';
    label5.Caption:='Nivel 3';

    label2.Left:= 1920 div 2 - (label2.Width div 2);
    label5.Left:= 1920 div 2 - (label5.Width div 2);

    for f := 1 to juego.Filas do
      for c := 1 to juego.Columnas do
        juego.cambiar(f,c,juego.getElement(f,c));

    repaint;
end;

procedure TForm1.NIVELES2Click(Sender: TObject);
var
  f,c : word;
begin
    n:=1;
    juego.CargarNivel(n);

    i:=4; j:=5; //Posicion de Inicio del Personaje

    i1:=6; j1:=6; //Caja 1
    i2:=7; j2:=6; //Caja 2
    i3:=8; j3:=6; //Caja 3

    can:=3; mov:=0;

    label1.Visible:=True; label2.Visible:=True; label3.Visible:=True;
    label6.Visible:=False;

    label1.caption:='Tú puedes!'; label1.Font.Color:=clWhite;
    label2.Caption:='Cajas en su lugar: 3/1';
    label3.Caption:='Número de Movimientos: 0';
    label5.Caption:='Nivel 1';

    label2.Left:= 1920 div 2 - (label2.Width div 2);
    label5.Left:= 1920 div 2 - (label5.Width div 2);

    for f := 1 to juego.Filas do
      for c := 1 to juego.Columnas do
        juego.cambiar(f,c,juego.getElement(f,c));

    repaint;
end;

//Poner en Bucle Musica
procedure TForm1.Timer1Timer(Sender: TObject);
begin
   if MediaPlayer1.Mode = mpStopped then
    begin
      MediaPlayer1.Open;
      MediaPlayer1.Play;
    end;
end;

end.
