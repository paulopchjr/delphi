object Form2: TForm2
  Left = 0
  Top = 0
  Caption = 'Form2'
  ClientHeight = 441
  ClientWidth = 624
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  TextHeight = 15
  object StringGrid1: TStringGrid
    Left = 0
    Top = 0
    Width = 624
    Height = 400
    Align = alClient
    ColCount = 12
    RowCount = 12
    TabOrder = 0
  end
  object Panel1: TPanel
    Left = 0
    Top = 400
    Width = 624
    Height = 41
    Align = alBottom
    TabOrder = 1
    ExplicitLeft = 248
    ExplicitTop = 272
    ExplicitWidth = 185
    object Button2: TButton
      Left = 1
      Top = 6
      Width = 622
      Height = 34
      Align = alBottom
      Caption = 'Executar Logica 2;'
      TabOrder = 0
      OnClick = Button2Click
    end
  end
end
