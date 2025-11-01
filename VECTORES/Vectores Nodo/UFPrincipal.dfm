object frmPrincipal: TfrmPrincipal
  Left = 0
  Top = 0
  Caption = 'Nodos'
  ClientHeight = 499
  ClientWidth = 842
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Menu = MainMenu1
  OnCreate = FormCreate
  TextHeight = 13
  object Label1: TLabel
    Left = 40
    Top = 32
    Width = 28
    Height = 13
    Caption = 'NOCP'
  end
  object Label2: TLabel
    Left = 40
    Top = 64
    Width = 85
    Height = 13
    Caption = 'Fecha hora Salida'
  end
  object Label3: TLabel
    Left = 40
    Top = 104
    Width = 94
    Height = 13
    Caption = 'Fecha hora Llegada'
  end
  object Label4: TLabel
    Left = 144
    Top = 173
    Width = 3
    Height = 13
  end
  object Label5: TLabel
    Left = 72
    Top = 173
    Width = 45
    Height = 13
    Caption = 'Velocidad'
  end
  object Label6: TLabel
    Left = 40
    Top = 133
    Width = 43
    Height = 13
    Caption = 'Distancia'
  end
  object Edit1: TEdit
    Left = 144
    Top = 32
    Width = 89
    Height = 21
    TabOrder = 0
  end
  object Edit2: TEdit
    Left = 144
    Top = 59
    Width = 89
    Height = 21
    TabOrder = 1
  end
  object Edit3: TEdit
    Left = 144
    Top = 101
    Width = 89
    Height = 21
    TabOrder = 2
  end
  object SGNota: TStringGrid
    Left = 40
    Top = 216
    Width = 521
    Height = 145
    ColCount = 4
    FixedCols = 0
    RowCount = 1
    FixedRows = 0
    TabOrder = 3
    ColWidths = (
      71
      207
      64
      64)
  end
  object Button1: TButton
    Left = 405
    Top = 128
    Width = 75
    Height = 25
    Caption = 'Adicionar'
    TabOrder = 4
    OnClick = Button1Click
  end
  object Edit4: TEdit
    Left = 144
    Top = 128
    Width = 89
    Height = 21
    TabOrder = 5
  end
  object MainMenu1: TMainMenu
    Left = 654
    Top = 365
    object Metodos1: TMenuItem
      Caption = 'Metodos'
      object Velocidad1: TMenuItem
        Caption = 'Velocidad'
        OnClick = Velocidad1Click
      end
      object Velocidad2: TMenuItem
        Caption = 'Velocidad Mayor'
        OnClick = Velocidad2Click
      end
    end
  end
end
