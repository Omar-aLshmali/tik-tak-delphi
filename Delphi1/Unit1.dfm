object Form1: TForm1
  Left = 214
  Top = 220
  Caption = 'Tik Tak Toe'
  ClientHeight = 796
  ClientWidth = 1337
  Color = clWhite
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Segoe UI'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object play1: TLabel
    Left = 712
    Top = 208
    Width = 128
    Height = 29
    Caption = 'Spieler 1 : '
    Color = clWindow
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -23
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentColor = False
    ParentFont = False
  end
  object play2: TLabel
    Left = 712
    Top = 272
    Width = 128
    Height = 29
    Caption = 'Spieler 2 : '
    Color = clWindow
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -23
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentColor = False
    ParentFont = False
  end
  object draw_result: TLabel
    Left = 712
    Top = 320
    Width = 196
    Height = 29
    Caption = 'Unentschieden : '
    Color = clWindow
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -23
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentColor = False
    ParentFont = False
  end
  object begin_play: TLabel
    Left = 442
    Top = 154
    Width = 8
    Height = 29
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -23
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object btn1: TButton
    Left = 360
    Top = 217
    Width = 97
    Height = 73
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -20
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
    OnClick = btnClick
  end
  object btn2: TButton
    Left = 463
    Top = 217
    Width = 97
    Height = 73
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -20
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 1
    OnClick = btnClick
  end
  object btn3: TButton
    Left = 566
    Top = 217
    Width = 97
    Height = 73
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -20
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ModalResult = 1
    ParentFont = False
    TabOrder = 2
    OnClick = btnClick
  end
  object btn4: TButton
    Left = 360
    Top = 296
    Width = 97
    Height = 73
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -20
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ModalResult = 1
    ParentFont = False
    TabOrder = 3
    OnClick = btnClick
  end
  object btn5: TButton
    Left = 463
    Top = 296
    Width = 97
    Height = 73
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -20
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 4
    OnClick = btnClick
  end
  object btn6: TButton
    Left = 566
    Top = 296
    Width = 97
    Height = 73
    BiDiMode = bdLeftToRight
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -20
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentBiDiMode = False
    ParentFont = False
    TabOrder = 5
    OnClick = btnClick
  end
  object btn7: TButton
    Left = 360
    Top = 375
    Width = 97
    Height = 73
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -20
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 6
    OnClick = btnClick
  end
  object btn8: TButton
    Left = 463
    Top = 375
    Width = 97
    Height = 73
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -20
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 7
    OnClick = btnClick
  end
  object btn9: TButton
    Left = 566
    Top = 375
    Width = 97
    Height = 73
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -20
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 8
    OnClick = btnClick
  end
  object New_play: TButton
    Left = 200
    Top = 304
    Width = 115
    Height = 41
    Caption = 'Neues Spiel'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 9
    OnClick = New_playClick
  end
  object New_begin: TButton
    Left = 200
    Top = 351
    Width = 115
    Height = 41
    Caption = 'Neu Anfangen'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 10
    OnClick = New_beginClick
  end
  object End_play: TButton
    Left = 200
    Top = 398
    Width = 115
    Height = 41
    Caption = 'Beenden'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 11
    OnClick = End_playClick
  end
  object CheckBox1: TCheckBox
    Left = 442
    Top = 480
    Width = 153
    Height = 49
    Caption = 'Schwer spielen'
    Color = clWindow
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentColor = False
    ParentFont = False
    TabOrder = 12
  end
  object play: TButton
    Left = 200
    Top = 257
    Width = 115
    Height = 41
    Caption = 'Start'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 13
    OnClick = playClick
  end
  object RadioGroup1: TRadioGroup
    Left = -2
    Top = 8
    Width = 67
    Height = 153
    Caption = 'Farbe Auswahl'
    ItemIndex = 0
    Items.Strings = (
      'Wei'#223
      'Gr'#252'n'
      'Rot'
      'Gelb')
    TabOrder = 14
    OnClick = RadioGroup1Click
  end
  object Button1: TButton
    Left = 71
    Top = 16
    Width = 115
    Height = 58
    Caption = 'Farbe Ausw'#228'hlen'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 15
    OnClick = Button1Click
  end
  object BitBtn1: TBitBtn
    Left = 71
    Top = 80
    Width = 115
    Height = 57
    Caption = 'Farbe Timer'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 16
    OnClick = BitBtn1Click
  end
  object Timer1: TTimer
    Enabled = False
    Interval = 3000
    OnTimer = Timer1Timer
    Top = 216
  end
  object ColorDialog1: TColorDialog
    Top = 176
  end
end
