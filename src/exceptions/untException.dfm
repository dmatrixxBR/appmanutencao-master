object frmExceptions: TfrmExceptions
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  Caption = 'Exception'
  ClientHeight = 251
  ClientWidth = 330
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 24
    Top = 19
    Width = 77
    Height = 25
    Caption = 'Valor 01'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -21
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label2: TLabel
    Left = 24
    Top = 99
    Width = 77
    Height = 25
    Caption = 'Valor 02'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -21
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object EditA: TEdit
    Left = 128
    Top = 16
    Width = 33
    Height = 33
    Alignment = taCenter
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -21
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
    Text = '10'
  end
  object EditB: TEdit
    Left = 128
    Top = 96
    Width = 33
    Height = 33
    Alignment = taCenter
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -21
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 1
    Text = '0'
  end
  object RgOperacao: TRadioGroup
    Left = 200
    Top = 8
    Width = 105
    Height = 209
    Caption = 'Opera'#231#245'es'
    Items.Strings = (
      'Somar'
      'Subtrair'
      'Multiplicar'
      'Dividir')
    TabOrder = 2
  end
  object Button1: TButton
    Left = 24
    Top = 168
    Width = 137
    Height = 49
    Caption = 'Calcular'
    TabOrder = 3
    OnClick = Button1Click
  end
end
