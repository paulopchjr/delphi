object frmRel: TfrmRel
  Left = 0
  Top = 0
  Caption = 'frmRel'
  ClientHeight = 441
  ClientWidth = 624
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  TextHeight = 15
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 624
    Height = 57
    Align = alTop
    Color = clYellow
    ParentBackground = False
    TabOrder = 0
    object Label1: TLabel
      Left = 272
      Top = 13
      Width = 139
      Height = 32
      Caption = 'Rel'#225'torio de '
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -24
      Font.Name = 'Segoe UI Semibold'
      Font.Style = [fsBold]
      ParentFont = False
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 57
    Width = 624
    Height = 41
    Align = alTop
    TabOrder = 1
    object Sair: TButton
      Left = 592
      Top = 6
      Width = 75
      Height = 25
      Caption = 'Sair'
      TabOrder = 0
      OnClick = SairClick
    end
    object btnvisualizar: TButton
      Left = 400
      Top = 6
      Width = 75
      Height = 25
      Caption = 'Visualizar'
      TabOrder = 1
    end
    object btnImprmir: TButton
      Left = 504
      Top = 6
      Width = 75
      Height = 25
      Caption = 'Imprimir'
      TabOrder = 2
    end
  end
  object StringGrid1: TStringGrid
    Left = 0
    Top = 98
    Width = 624
    Height = 343
    Align = alClient
    TabOrder = 2
    RowHeights = (
      24
      24
      24
      24
      24)
  end
end
