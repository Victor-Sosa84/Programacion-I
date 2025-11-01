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
    Width = 15
    Height = 32
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -27
    Font.Name = 'Consolas'
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
    Top = 72
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
      object Longitud1: TMenuItem
        Caption = 'Longitud'
        OnClick = Longitud1Click
      end
      object InsertarCaracter1: TMenuItem
        Caption = 'Insertar Caracter'
        OnClick = InsertarCaracter1Click
      end
      object EliminarCaracter1: TMenuItem
        Caption = 'Eliminar Caracter'
        OnClick = EliminarCaracter1Click
      end
      object ModificarCaracter1: TMenuItem
        Caption = 'Modificar Caracter'
        OnClick = ModificarCaracter1Click
      end
      object AadirCaracter1: TMenuItem
        Caption = 'A'#241'adir Caracter (Al final)'
        OnClick = AadirCaracter1Click
      end
      object ObtenerCaracter1: TMenuItem
        Caption = 'Obtener Caracter'
        OnClick = ObtenerCaracter1Click
      end
      object ContarPalabras1: TMenuItem
        Caption = 'Contar Palabras'
        OnClick = ContarPalabras1Click
      end
      object ContarVocales1: TMenuItem
        Caption = 'Contar Vocales'
        OnClick = ContarVocales1Click
      end
      object EliminarPalabra1: TMenuItem
        Caption = 'Eliminar Palabra'
        OnClick = EliminarPalabra1Click
      end
      object EliminarNChar1: TMenuItem
        Caption = 'Eliminar N Char'
        OnClick = EliminarNChar1Click
      end
      object InsertarPalabra1: TMenuItem
        Caption = 'Insertar Palabra'
        OnClick = InsertarPalabra1Click
      end
      object ReemplazarPalabra1: TMenuItem
        Caption = 'Reemplazar Palabra'
        OnClick = ReemplazarPalabra1Click
      end
      object SumarBinarios1: TMenuItem
        Caption = 'Sumar Binarios'
        OnClick = SumarBinarios1Click
      end
    end
  end
end
