object frmCadastroPadrao: TfrmCadastroPadrao
  Left = 0
  Top = 0
  Caption = 'frmCadastroPadrao'
  ClientHeight = 441
  ClientWidth = 795
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  TextHeight = 15
  object PanelTitulo: TPanel
    Left = 0
    Top = 0
    Width = 795
    Height = 57
    Align = alTop
    Color = clYellow
    ParentBackground = False
    TabOrder = 0
    object Label1: TLabel
      Left = 491
      Top = 1
      Width = 133
      Height = 45
      Caption = 'Cadastro'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -32
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
  end
  object panelRodape: TPanel
    Left = 0
    Top = 400
    Width = 795
    Height = 41
    Align = alBottom
    TabOrder = 1
    object btn_novo: TButton
      Left = 1
      Top = -2
      Width = 97
      Height = 43
      Caption = 'Novo'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
    end
    object btn_gravar: TButton
      Left = 120
      Top = -2
      Width = 97
      Height = 43
      Caption = 'Salvar'
      Enabled = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
    end
    object btn_pesquisar: TButton
      Left = 247
      Top = -2
      Width = 97
      Height = 43
      Caption = 'Pesquisar'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 2
    end
    object btn_excluir: TButton
      Left = 512
      Top = -2
      Width = 97
      Height = 43
      Caption = 'Excluir'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 3
    end
    object btn_sair: TButton
      Left = 698
      Top = -2
      Width = 97
      Height = 43
      Caption = 'Sair'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 4
    end
    object btn_caneclar: TButton
      Left = 384
      Top = 6
      Width = 75
      Height = 27
      Caption = 'Cancelar'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 5
    end
  end
  object Panel2: TPanel
    Left = 304
    Top = 57
    Width = 491
    Height = 343
    Align = alRight
    TabOrder = 2
    Visible = False
  end
end
