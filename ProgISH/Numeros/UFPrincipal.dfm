object frmPrincipal: TfrmPrincipal
  Left = 0
  Top = 0
  Caption = 'NUMEROS'
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
    Left = 128
    Top = 104
    Width = 34
    Height = 15
    Caption = 'Label1'
  end
  object edValor: TEdit
    Left = 120
    Top = 24
    Width = 121
    Height = 23
    TabOrder = 0
  end
  object MainMenu1: TMainMenu
    Left = 208
    Top = 192
    object Metodos1: TMenuItem
      Caption = 'Metodos'
      object Metodos2: TMenuItem
        Caption = 'Cambiar Valor'
        OnClick = Metodos2Click
      end
      object Obtenervalor1: TMenuItem
        Caption = 'Obtener valor'
        OnClick = Obtenervalor1Click
      end
      object Obtenervalor2: TMenuItem
        Caption = 'adicionar digito'
      end
      object buscardigito1: TMenuItem
        Caption = 'buscar digito'
        OnClick = buscardigito1Click
      end
    end
  end
end
