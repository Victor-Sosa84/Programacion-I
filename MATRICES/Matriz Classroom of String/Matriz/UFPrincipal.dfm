object frmPrincipal: TfrmPrincipal
  Left = 0
  Top = 0
  Caption = 'MATRIZ'
  ClientHeight = 965
  ClientWidth = 1667
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Menu = MainMenu1
  OnCreate = FormCreate
  TextHeight = 13
  object SGMatriz: TStringGrid
    Left = 48
    Top = 32
    Width = 969
    Height = 545
    ColCount = 1
    FixedCols = 0
    RowCount = 1
    FixedRows = 0
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goEditing, goFixedRowDefAlign]
    TabOrder = 0
  end
  object ScrollBar1: TScrollBar
    Left = 48
    Top = 583
    Width = 969
    Height = 73
    Max = 128
    Min = 1
    PageSize = 0
    Position = 1
    TabOrder = 1
    OnChange = ScrollBar1Change
  end
  object ScrollBar2: TScrollBar
    Left = 1016
    Top = 32
    Width = 65
    Height = 617
    Kind = sbVertical
    Max = 128
    Min = 1
    PageSize = 0
    Position = 1
    TabOrder = 2
    OnChange = ScrollBar2Change
  end
  object MainMenu1: TMainMenu
    Left = 1232
    Top = 448
    object Metodos1: TMenuItem
      Caption = 'Metodos'
      object Metodos2: TMenuItem
        Caption = 'Cargar Matriz'
        OnClick = Metodos2Click
      end
      object MostrarMatriz1: TMenuItem
        Caption = 'Mostrar Matriz'
        OnClick = MostrarMatriz1Click
      end
      object Cargaraleatorio1: TMenuItem
        Caption = 'Cargar aleatorio'
        OnClick = Cargaraleatorio1Click
      end
      object EliminarFila1: TMenuItem
        Caption = 'Eliminar Fila'
        OnClick = EliminarFila1Click
      end
      object OrdenarFilas1: TMenuItem
        Caption = 'Ordenar Filas'
        OnClick = OrdenarFilas1Click
      end
      object OrdenarColumnas1: TMenuItem
        Caption = 'Ordenar Columnas'
        OnClick = OrdenarColumnas1Click
      end
      object OrdenarTodoxfilas1: TMenuItem
        Caption = 'Ordenar Todo x filas'
        OnClick = OrdenarTodoxfilas1Click
      end
    end
  end
end
