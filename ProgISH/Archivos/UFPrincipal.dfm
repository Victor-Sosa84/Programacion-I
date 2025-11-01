object frmPrincipal: TfrmPrincipal
  Left = 0
  Top = 0
  Caption = 'ARCHIVO TEXTO'
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
  object Memo1: TMemo
    Left = 0
    Top = 0
    Width = 624
    Height = 441
    Align = alClient
    TabOrder = 0
    ExplicitLeft = 8
    ExplicitTop = 8
    ExplicitWidth = 401
    ExplicitHeight = 241
  end
  object MainMenu1: TMainMenu
    Left = 248
    Top = 88
    object Metodos1: TMenuItem
      Caption = 'Metodos'
      object Metodos2: TMenuItem
        Caption = 'Abrir archivo'
        OnClick = Metodos2Click
      end
      object Guardararchivo1: TMenuItem
        Caption = 'Guardar archivo'
        OnClick = Guardararchivo1Click
      end
      object Cerrararchivo1: TMenuItem
        Caption = 'Cerrar archivo'
      end
    end
  end
  object ODAbrir: TOpenDialog
    Filter = 'Archivos Texto|*.txt|Todos los archivos|*.*'
    Left = 360
    Top = 88
  end
  object SDGuardar: TSaveDialog
    DefaultExt = 'txt'
    Left = 408
    Top = 184
  end
end
