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
  TextHeight = 15
  object Label1: TLabel
    Left = 120
    Top = 192
    Width = 345
    Height = 32
    Caption = '                       '
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -27
    Font.Name = 'Consolas'
    Font.Style = [fsItalic]
    ParentFont = False
  end
  object Edit1: TEdit
    Left = 120
    Top = 88
    Width = 265
    Height = 39
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -23
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
  end
  object Edit2: TEdit
    Left = 120
    Top = 138
    Width = 265
    Height = 39
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -23
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
  end
  object MainMenu1: TMainMenu
    Left = 184
    Top = 224
    object Metodos1: TMenuItem
      Caption = 'METODOS'
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
        Caption = 'Palabra Repetida'
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
      object PalabraN1: TMenuItem
        Caption = 'Palabra N'
        OnClick = PalabraN1Click
      end
      object InvertirPalabras1: TMenuItem
        Caption = 'Invertir Palabras'
        OnClick = InvertirPalabras1Click
      end
      object InvertirCadena1: TMenuItem
        Caption = 'Invertir Cadena'
        OnClick = InvertirCadena1Click
      end
    end
    object MSMETODOS1: TMenuItem
      Caption = 'M'#193'S METODOS'
      object FechaaLiteral1: TMenuItem
        Caption = 'Fecha a Literal'
        OnClick = FechaaLiteral1Click
      end
      object DigitoComun1: TMenuItem
        Caption = 'Digito Comun'
        OnClick = DigitoComun1Click
      end
      object CantidaddePalabras1: TMenuItem
        Caption = 'Cantidad de Palabras'
        OnClick = CantidaddePalabras1Click
      end
      object CountWord1: TMenuItem
        Caption = 'CountWord'
        OnClick = CountWord1Click
      end
      object delWordPosAndLength1: TMenuItem
        Caption = 'delWordPosAndLength'
        OnClick = delWordPosAndLength1Click
      end
      object mostRepeatWord1: TMenuItem
        Caption = 'mostRepeatWord'
        OnClick = mostRepeatWord1Click
      end
      object Redondeo1: TMenuItem
        Caption = 'Redondeo'
        OnClick = Redondeo1Click
      end
      object nextNumberConPunto1: TMenuItem
        Caption = 'nextNumber'
        OnClick = nextNumberConPunto1Click
      end
    end
  end
end
