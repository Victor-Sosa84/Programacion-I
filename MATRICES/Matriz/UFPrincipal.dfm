object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'MATRIZ'
  ClientHeight = 561
  ClientWidth = 789
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Menu = MainMenu1
  OnCreate = FormCreate
  TextHeight = 15
  object SGMatriz: TStringGrid
    Left = 48
    Top = 48
    Width = 417
    Height = 201
    ColCount = 1
    FixedCols = 0
    RowCount = 1
    FixedRows = 0
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Segoe UI'
    Font.Style = []
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goEditing, goFixedRowDefAlign]
    ParentFont = False
    ScrollBars = ssNone
    TabOrder = 0
  end
  object ScrollBar1: TScrollBar
    Left = 48
    Top = 264
    Width = 417
    Height = 17
    PageSize = 0
    TabOrder = 1
    OnChange = ScrollBar1Change
  end
  object ScrollBar2: TScrollBar
    Left = 471
    Top = 48
    Width = 17
    Height = 201
    Kind = sbVertical
    PageSize = 0
    TabOrder = 2
    OnChange = ScrollBar2Change
  end
  object Edit1: TEdit
    Left = 471
    Top = 368
    Width = 121
    Height = 39
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -23
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    TabOrder = 3
  end
  object MainMenu1: TMainMenu
    Left = 190
    Top = 312
    object METODOS1: TMenuItem
      Caption = 'METODOS'
      object METODOS2: TMenuItem
        Caption = 'Cargar Matriz'
        OnClick = METODOS2Click
      end
      object MostrarMatriz1: TMenuItem
        Caption = 'Mostrar Matriz'
        OnClick = MostrarMatriz1Click
      end
      object EliminarColumna1: TMenuItem
        Caption = 'Eliminar Columna'
        OnClick = EliminarColumna1Click
      end
      object InsertarColumna1: TMenuItem
        Caption = 'Insertar Columna'
        OnClick = InsertarColumna1Click
      end
      object AadirColumna1: TMenuItem
        Caption = 'A'#241'adir Columna'
        OnClick = AadirColumna1Click
      end
      object EliminarFila1: TMenuItem
        Caption = 'Eliminar Fila'
        OnClick = EliminarFila1Click
      end
      object EliminarFila2: TMenuItem
        Caption = 'Insertar Fila'
        OnClick = EliminarFila2Click
      end
      object AadirColumna2: TMenuItem
        Caption = 'A'#241'adir Fila'
        OnClick = AadirColumna2Click
      end
      object IntercambiarCeldas1: TMenuItem
        Caption = 'Intercambiar Celdas'
        OnClick = IntercambiarCeldas1Click
      end
      object Cargar1: TMenuItem
        Caption = 'Cargar'
        OnClick = Cargar1Click
      end
    end
  end
end
