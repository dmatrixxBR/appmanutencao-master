object FThreads: TFThreads
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'FThreads'
  ClientHeight = 374
  ClientWidth = 235
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 35
    Width = 94
    Height = 13
    Caption = 'N'#250'mero de Threads'
  end
  object Label2: TLabel
    Left = 8
    Top = 70
    Width = 70
    Height = 13
    Caption = 'Tempo Milisecs'
  end
  object edtThreads: TEdit
    Left = 104
    Top = 32
    Width = 121
    Height = 21
    NumbersOnly = True
    TabOrder = 0
  end
  object edtTime: TEdit
    Left = 104
    Top = 67
    Width = 121
    Height = 21
    NumbersOnly = True
    TabOrder = 1
  end
  object Executar: TButton
    Left = 8
    Top = 288
    Width = 217
    Height = 49
    Caption = 'Executar'
    TabOrder = 2
    OnClick = ExecutarClick
  end
  object Memo1: TMemo
    Left = 8
    Top = 105
    Width = 217
    Height = 177
    Lines.Strings = (
      'Memo1')
    TabOrder = 3
  end
  object ProgressBar1: TProgressBar
    Left = 8
    Top = 339
    Width = 217
    Height = 17
    TabOrder = 4
  end
end
