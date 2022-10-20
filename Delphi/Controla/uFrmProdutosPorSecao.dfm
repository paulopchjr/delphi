object frmProdSecao: TfrmProdSecao
  Left = 0
  Top = 0
  Caption = 'Pesquisa Produtos Por Se'#231#227'o'
  ClientHeight = 441
  ClientWidth = 767
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  OnCreate = FormCreate
  TextHeight = 15
  object Label2: TLabel
    Left = 115
    Top = 91
    Width = 61
    Height = 30
    Caption = 'Se'#231#227'o:'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -21
    Font.Name = 'Segoe UI Semibold'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 767
    Height = 49
    Align = alTop
    Color = clYellow
    ParentBackground = False
    TabOrder = 0
    object Label1: TLabel
      Left = 224
      Top = 8
      Width = 379
      Height = 40
      Alignment = taCenter
      Caption = 'Pesquisa Produtos por Se'#231#227'o'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -29
      Font.Name = 'Segoe UI Semibold'
      Font.Style = [fsBold]
      ParentFont = False
    end
  end
  object btn_buscar: TButton
    Left = 640
    Top = 87
    Width = 75
    Height = 50
    Caption = 'Buscar'
    TabOrder = 1
    OnClick = btn_buscarClick
  end
  object cbxSecao: TComboBox
    Left = 182
    Top = 100
    Width = 211
    Height = 23
    TabOrder = 2
  end
  object SGProdSecao: TStringGrid
    Left = 88
    Top = 160
    Width = 627
    Height = 177
    FixedRows = 0
    TabOrder = 3
    RowHeights = (
      24
      24
      24
      24
      24)
  end
end
