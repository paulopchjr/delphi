object frmteste: Tfrmteste
  Left = 0
  Top = 0
  Caption = 'frmteste'
  ClientHeight = 441
  ClientWidth = 624
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  TextHeight = 15
  object Button1: TButton
    Left = 520
    Top = 104
    Width = 75
    Height = 25
    Caption = 'Button1'
    TabOrder = 0
    OnClick = Button1Click
  end
  object StringGridProd: TStringGrid
    Left = 184
    Top = 136
    Width = 320
    Height = 120
    TabOrder = 1
    OnSelectCell = StringGridProdSelectCell
  end
end
