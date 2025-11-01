object Form2: TForm2
  Left = 0
  Top = 0
  Caption = 'Form2'
  ClientHeight = 511
  ClientWidth = 820
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
    Left = 136
    Top = 272
    Width = 256
    Height = 81
    Caption = '                '
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -60
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
  end
  object Edit1: TEdit
    Left = 128
    Top = 25
    Width = 345
    Height = 89
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -60
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
  end
  object Edit2: TEdit
    Left = 128
    Top = 145
    Width = 345
    Height = 89
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -60
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
  end
  object MainMenu1: TMainMenu
    Left = 499
    Top = 35
    object METODOS1: TMenuItem
      Caption = 'METODOS'
      object ObtenerNumero1: TMenuItem
        Caption = 'Obtener Numero'
        OnClick = ObtenerNumero1Click
      end
      object MostrarDigito1: TMenuItem
        Caption = 'Mostrar Numero'
        OnClick = MostrarDigito1Click
      end
      object METODOS2: TMenuItem
        Caption = 'A'#241'adir Digito Inicio'
        OnClick = METODOS2Click
      end
      object AadirDigitoFinal1: TMenuItem
        Caption = 'A'#241'adir Digito Final'
        OnClick = AadirDigitoFinal1Click
      end
      object NumeroDeDigitos1: TMenuItem
        Caption = 'Numero De Digitos'
        OnClick = NumeroDeDigitos1Click
      end
      object ModificarDigito1: TMenuItem
        Caption = 'Modificar Digito'
        OnClick = ModificarDigito1Click
      end
      object ObtenerDigito1: TMenuItem
        Caption = 'Obtener Digito'
        OnClick = ObtenerDigito1Click
      end
      object ModificarDigito2: TMenuItem
        Caption = 'Insertar Digito'
        OnClick = ModificarDigito2Click
      end
      object EliminarDigito1: TMenuItem
        Caption = 'Eliminar Digito'
        OnClick = EliminarDigito1Click
      end
      object SumarDigitos1: TMenuItem
        Caption = 'Sumar Digitos'
        OnClick = SumarDigitos1Click
      end
      object MayorSumaDeDigitosQueDen101: TMenuItem
        Caption = 'Mayor Suma De Digitos Que Den 10'
        OnClick = MayorSumaDeDigitosQueDen101Click
      end
      object Invertir1: TMenuItem
        Caption = 'Invertir'
        OnClick = Invertir1Click
      end
      object ConvertiraRomano1: TMenuItem
        Caption = 'Convertir a Romano'
        OnClick = ConvertiraRomano1Click
      end
      object ConvertiraLiteral1: TMenuItem
        Caption = 'Convertir a Literal (2 Digitos)'
        OnClick = ConvertiraLiteral1Click
      end
      object EncontrarDigito1: TMenuItem
        Caption = 'Encontrar Digito'
        OnClick = EncontrarDigito1Click
      end
      object EncontrarDigito2: TMenuItem
        Caption = 'Frecuencia de Digito'
        OnClick = EncontrarDigito2Click
      end
      object ConvertiraBaseN1: TMenuItem
        Caption = 'Convertir a Base N'
        OnClick = ConvertiraBaseN1Click
      end
      object ConvertiraBaseN2: TMenuItem
        Caption = 'Convertir a Base 10'
        OnClick = ConvertiraBaseN2Click
      end
      object EliminarNnumero1: TMenuItem
        Caption = 'Eliminar N numero'
        OnClick = EliminarNnumero1Click
      end
      object EliminarNdigitos1: TMenuItem
        Caption = 'Eliminar N digitos'
        OnClick = EliminarNdigitos1Click
      end
      object EliminarNdigitos2: TMenuItem
        Caption = 'Obtener N digitos'
        OnClick = EliminarNdigitos2Click
      end
    end
    object MASMETODOS1: TMenuItem
      Caption = 'MAS METODOS'
      object MASMETODOS2: TMenuItem
        Caption = 'Ordenar Digito Insertado'
        OnClick = MASMETODOS2Click
      end
      object OrdenarDigitoDescendente1: TMenuItem
        Caption = 'Ordenar Numero Descendente'
        OnClick = OrdenarDigitoDescendente1Click
      end
      object CantidadDigitosParesQueSuman101: TMenuItem
        Caption = 'Cantidad Digitos Pares Que Suman 10'
        OnClick = CantidadDigitosParesQueSuman101Click
      end
      object SepararRepetidos1: TMenuItem
        Caption = 'Separar Repetidos'
        OnClick = SepararRepetidos1Click
      end
      object EliminarDigito2: TMenuItem
        Caption = 'Eliminar Digito (todos)'
        OnClick = EliminarDigito2Click
      end
      object DigitoEsta1: TMenuItem
        Caption = 'Digito Esta'
        OnClick = DigitoEsta1Click
      end
      object DigitoNoEsta1: TMenuItem
        Caption = 'Digito No Esta'
        OnClick = DigitoNoEsta1Click
      end
    end
  end
end
