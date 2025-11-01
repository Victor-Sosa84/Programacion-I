object frmPrincipal: TfrmPrincipal
  Left = 0
  Top = 0
  Caption = 'CADENAS'
  ClientHeight = 441
  ClientWidth = 624
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Menu = MainMenu1
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 15
  object Label1: TLabel
    Left = 120
    Top = 144
    Width = 8
    Height = 33
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -27
    Font.Name = 'Brush Script MT'
    Font.Style = [fsItalic]
    ParentFont = False
  end
  object Edit1: TEdit
    Left = 120
    Top = 24
    Width = 265
    Height = 23
    TabOrder = 0
  end
  object Edit2: TEdit
    Left = 120
    Top = 64
    Width = 265
    Height = 23
    TabOrder = 1
  end
  object MainMenu1: TMainMenu
    Left = 184
    Top = 224
    object Metodos1: TMenuItem
      Caption = 'Metodos'
      object Metodos2: TMenuItem
        Caption = 'Cambiar texto'
        OnClick = Metodos2Click
      end
      object MostrarTexto1: TMenuItem
        Caption = 'Mostrar Texto'
        OnClick = MostrarTexto1Click
      end
      object InsertarCaracter1: TMenuItem
        Caption = 'Insertar Caracter'
        OnClick = InsertarCaracter1Click
      end
      object adiccionar1: TMenuItem
        Caption = 'adiccionar'
        OnClick = adiccionar1Click
      end
      object delChar1: TMenuItem
        Caption = 'delChar'
        OnClick = delChar1Click
      end
      object Contarvocales1: TMenuItem
        Caption = 'Contar vocales'
        OnClick = Contarvocales1Click
      end
      object ContarPalabras1: TMenuItem
        Caption = 'Contar Palabras'
        OnClick = ContarPalabras1Click
      end
    end
  end
end
