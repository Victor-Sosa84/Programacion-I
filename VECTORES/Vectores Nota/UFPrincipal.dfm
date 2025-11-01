object frmPrincipal: TfrmPrincipal
  Left = 0
  Top = 0
  Caption = 'Productos'
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
    Width = 40
    Height = 13
    Caption = 'Registro'
  end
  object Label2: TLabel
    Left = 40
    Top = 64
    Width = 37
    Height = 13
    Caption = 'Nombre'
  end
  object Label3: TLabel
    Left = 40
    Top = 104
    Width = 36
    Height = 13
    Caption = 'Materia'
  end
  object Label4: TLabel
    Left = 40
    Top = 133
    Width = 45
    Height = 13
    Caption = 'Semestre'
  end
  object Label5: TLabel
    Left = 40
    Top = 165
    Width = 23
    Height = 13
    Caption = 'Nota'
  end
  object Edit1: TEdit
    Left = 96
    Top = 32
    Width = 89
    Height = 21
    TabOrder = 0
  end
  object Edit2: TEdit
    Left = 96
    Top = 59
    Width = 89
    Height = 21
    TabOrder = 1
  end
  object Edit3: TEdit
    Left = 96
    Top = 101
    Width = 89
    Height = 21
    TabOrder = 2
  end
  object Edit4: TEdit
    Left = 96
    Top = 133
    Width = 89
    Height = 21
    TabOrder = 3
  end
  object SGNota: TStringGrid
    Left = 40
    Top = 216
    Width = 521
    Height = 145
    FixedCols = 0
    RowCount = 1
    FixedRows = 0
    TabOrder = 4
    ColWidths = (
      71
      207
      64
      72
      64)
  end
  object Button1: TButton
    Left = 405
    Top = 128
    Width = 75
    Height = 25
    Caption = 'Adicionar'
    TabOrder = 5
    OnClick = Button1Click
  end
  object Edit5: TEdit
    Left = 96
    Top = 162
    Width = 89
    Height = 21
    TabOrder = 6
  end
  object MainMenu1: TMainMenu
    Left = 644
    Top = 264
    object Metodos1: TMenuItem
      Caption = 'Metodos'
      object Metodos2: TMenuItem
        Caption = 'Ordenar Por Nombre'
        OnClick = Metodos2Click
      end
      object OrdenarPorCodigo1: TMenuItem
        Caption = 'Ordenar Por Registro'
        OnClick = OrdenarPorCodigo1Click
      end
    end
  end
end
