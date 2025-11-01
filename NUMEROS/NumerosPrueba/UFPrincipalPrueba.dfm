object Form2: TForm2
  Left = 0
  Top = 0
  Caption = 'Form2'
  ClientHeight = 514
  ClientWidth = 754
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
    Left = 545
    Top = 261
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
    end
  end
end
