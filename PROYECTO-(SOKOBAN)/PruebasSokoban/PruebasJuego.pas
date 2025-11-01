unit PruebasJuego;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.Imaging.jpeg,
  Vcl.StdCtrls, System.ImageList, Vcl.ImgList;

type
  TForm1 = class(TForm)
    Image1: TImage;
    Label1: TLabel;
    ImageList1: TImageList;
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormPaint(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    x , y : integer;
    auto,info: tbitmap;
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.FormCreate(Sender: TObject);
begin
    y:= 0;
    x:= 0;
    auto:= tbitmap.Create;
    info:= tbitmap.Create;
end;

procedure TForm1.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     label1.Caption:= IntToStr(key);
    case key of
       37: image1.left:= image1.left -20; //izquierda
       38: image1.Top := image1.Top -20 ; //arriba
       39: image1.left := image1.left +20; //derecha
       40: image1.Top := image1.Top +20;  //abajo
    end;

    auto.LoadFromFile('images2.BMP');
    info.LoadFromFile('autoAzul.BMP');

   case key of
       37: begin
               imagelist1.Replace(0,auto,nil);
              if x>0 then x := x -20; //izquierda
           end;
       38: begin
              imagelist1.Replace(0,info,nil);
              if y>0 then y := y -20 ; //arriba
            end;
       39: begin
              imagelist1.Replace(0,info,nil);

            if x<form1.ClientHeight then x := x +20; //derecha
           end;
       40: begin
                imagelist1.Replace(0,info,nil);
            if y<form1.ClientWidth then y := y +20;  //abajo
           end;
    end;
   repaint;
   imagelist1.Add(info,nil);
end;

procedure TForm1.FormKeyPress(Sender: TObject; var Key: Char);
begin
     // label1.Caption:= key;
end;

procedure TForm1.FormKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
     // label1.Caption:= IntToStr(key);
end;

procedure TForm1.FormPaint(Sender: TObject);
begin
      imagelist1.Draw(Canvas,x,y,0);
end;

end.
