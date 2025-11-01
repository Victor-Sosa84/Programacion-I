object frmPrincipal: TfrmPrincipal
  Left = 936
  Top = 374
  Caption = 'MyEditor'
  ClientHeight = 1021
  ClientWidth = 1785
  Color = clBtnFace
  CustomTitleBar.CaptionAlignment = taCenter
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Menu = MainMenu1
  Position = poDesigned
  WindowState = wsMaximized
  OnCreate = FormCreate
  TextHeight = 15
  object Memo1: TMemo
    Left = 0
    Top = 0
    Width = 1785
    Height = 1021
    Align = alClient
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -33
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    ScrollBars = ssBoth
    TabOrder = 0
  end
  object MainMenu1: TMainMenu
    Left = 312
    Top = 200
    object Archivo1: TMenuItem
      Caption = 'Archivo'
      object Archivo2: TMenuItem
        Caption = 'Abrir'
        OnClick = Archivo2Click
      end
      object Guardar1: TMenuItem
        Caption = 'Guardar'
        OnClick = Guardar1Click
      end
      object BuscarPalabra1: TMenuItem
        Caption = 'Buscar Palabra'
        OnClick = BuscarPalabra1Click
      end
      object BorrarPalabra1: TMenuItem
        Caption = 'Borrar Palabra'
        OnClick = BorrarPalabra1Click
      end
      object Input1: TMenuItem
        Caption = 'Contar Palabras'
        OnClick = Input1Click
      end
      object Convertirmayusculas1: TMenuItem
        Caption = 'Convertir mayusculas'
        OnClick = Convertirmayusculas1Click
      end
      object Sumarnumeros1: TMenuItem
        Caption = 'Sumar numeros'
        OnClick = Sumarnumeros1Click
      end
      object Palabramsrepetida1: TMenuItem
        Caption = 'Palabra m'#225's repetida'
        OnClick = Palabramsrepetida1Click
      end
      object EncontraryReemplazar1: TMenuItem
        Caption = 'Encontrar y Reemplazar'
        OnClick = EncontraryReemplazar1Click
      end
      object Matriz1: TMenuItem
        Caption = 'Matriz'
        OnClick = Matriz1Click
      end
      object Negativos1: TMenuItem
        Caption = 'Negativos'
        OnClick = Negativos1Click
      end
    end
  end
  object OpenDialog1: TOpenDialog
    Left = 304
    Top = 128
  end
  object SaveDialog1: TSaveDialog
    DefaultExt = 'txt'
    Filter = 'Archivos Texto|*.txt|Todos los Archivos|*.*'
    Left = 400
    Top = 128
  end
end
