object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 453
  ClientWidth = 841
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  TextHeight = 15
  object Label1: TLabel
    Left = 120
    Top = 64
    Width = 4
    Height = 21
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Segoe UI Semibold'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object StringGrid1: TStringGrid
    Left = 0
    Top = 0
    Width = 841
    Height = 412
    Align = alClient
    ColCount = 11
    RowCount = 26
    TabOrder = 0
  end
  object Panel1: TPanel
    Left = 0
    Top = 412
    Width = 841
    Height = 41
    Align = alBottom
    TabOrder = 1
    object Button1: TButton
      Left = 262
      Top = 8
      Width = 163
      Height = 25
      Caption = 'Executar Logica 1'
      TabOrder = 0
      OnClick = Button1Click
    end
    object Button2: TButton
      Left = 598
      Top = 8
      Width = 75
      Height = 25
      Caption = 'L'#243'gica 2'
      TabOrder = 1
      OnClick = Button2Click
    end
  end
end
