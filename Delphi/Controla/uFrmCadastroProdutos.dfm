inherited frmCadastroProdutos: TfrmCadastroProdutos
  Align = alTop
  Caption = ''
  ClientHeight = 749
  ClientWidth = 1010
  Position = poDesigned
  OnCreate = FormCreate
  ExplicitWidth = 1026
  ExplicitHeight = 788
  TextHeight = 15
  object Label2: TLabel [0]
    Left = 64
    Top = 140
    Width = 97
    Height = 30
    Caption = 'Descri'#231#227'o:'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -21
    Font.Name = 'Segoe UI Semibold'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label3: TLabel [1]
    Left = 64
    Top = 65
    Width = 75
    Height = 30
    Caption = 'C'#243'digo:'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -21
    Font.Name = 'Segoe UI Semibold'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label4: TLabel [2]
    Left = 64
    Top = 233
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
  object Label5: TLabel [3]
    Left = 56
    Top = 269
    Width = 120
    Height = 30
    Caption = 'Pre'#231'o Custo:'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -21
    Font.Name = 'Segoe UI Semibold'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label6: TLabel [4]
    Left = 310
    Top = 269
    Width = 124
    Height = 30
    Caption = 'Pre'#231'o Venda:'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -21
    Font.Name = 'Segoe UI Semibold'
    Font.Style = [fsBold]
    ParentFont = False
  end
  inherited PanelTitulo: TPanel
    Width = 1010
    ExplicitWidth = 1010
    inherited Label1: TLabel
      Width = 326
      Caption = 'Cadastro de Produtos'
      ExplicitWidth = 326
    end
  end
  inherited panelRodape: TPanel
    Top = 662
    Width = 1010
    Height = 87
    Color = clBackground
    ParentBackground = False
    ExplicitTop = 662
    ExplicitWidth = 1010
    ExplicitHeight = 87
    object btnProdSecao: TButton [0]
      Left = 560
      Top = 14
      Width = 130
      Height = 50
      Caption = 'Rel.Prod/Se'#231#227'o'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      OnClick = btnProdSecaoClick
    end
    inherited btn_pesquisar: TButton [1]
      Left = 239
      Top = 14
      Width = 100
      Height = 50
      TabOrder = 1
      OnClick = btn_pesquisarClick
      ExplicitLeft = 239
      ExplicitTop = 14
      ExplicitWidth = 100
      ExplicitHeight = 50
    end
    inherited btn_sair: TButton [2]
      Left = 890
      Top = 14
      Width = 100
      Height = 50
      TabOrder = 2
      OnClick = btn_sairClick
      ExplicitLeft = 890
      ExplicitTop = 14
      ExplicitWidth = 100
      ExplicitHeight = 50
    end
    inherited btn_novo: TButton [3]
      Left = 9
      Top = 14
      Width = 100
      Height = 50
      TabOrder = 3
      OnClick = btn_novoClick
      ExplicitLeft = 9
      ExplicitTop = 14
      ExplicitWidth = 100
      ExplicitHeight = 50
    end
    inherited btn_excluir: TButton
      Left = 451
      Top = 14
      Width = 100
      Height = 50
      TabOrder = 4
      OnClick = btn_excluirClick
      ExplicitLeft = 451
      ExplicitTop = 14
      ExplicitWidth = 100
      ExplicitHeight = 50
    end
    inherited btn_gravar: TButton [5]
      Left = 115
      Top = 14
      Width = 100
      Height = 50
      TabOrder = 5
      OnClick = btn_gravarClick
      ExplicitLeft = 115
      ExplicitTop = 14
      ExplicitWidth = 100
      ExplicitHeight = 50
    end
    object Button1: TButton [6]
      Left = 717
      Top = 14
      Width = 130
      Height = 50
      Caption = 'Rel. Produtos'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 6
      OnClick = Button1Click
    end
    inherited btn_caneclar: TButton
      Left = 345
      Top = 14
      Width = 100
      Height = 50
      TabOrder = 7
      OnClick = btn_caneclarClick
      ExplicitLeft = 345
      ExplicitTop = 14
      ExplicitWidth = 100
      ExplicitHeight = 50
    end
  end
  inherited Panel2: TPanel
    Left = 319
    Width = 691
    Height = 605
    ExplicitLeft = 319
    ExplicitWidth = 691
    ExplicitHeight = 605
    object Label8: TLabel
      Left = 16
      Top = 400
      Width = 4
      Height = 21
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold, fsItalic]
      ParentFont = False
    end
    object Edit1: TEdit
      Left = 51
      Top = 115
      Width = 345
      Height = 33
      CharCase = ecUpperCase
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      OnChange = Edit1Change
    end
    object btn_buscar: TButton
      Left = 423
      Top = 106
      Width = 105
      Height = 42
      Caption = 'Buscar'
      TabOrder = 1
      OnClick = btn_buscarClick
    end
    object btn_sairPes: TButton
      Left = 432
      Top = 248
      Width = 75
      Height = 25
      Caption = 'Sair'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'Segoe UI Semibold'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 2
      OnClick = btn_sairPesClick
    end
    object Panel3: TPanel
      Left = 51
      Top = 15
      Width = 406
      Height = 74
      Color = clHighlight
      ParentBackground = False
      TabOrder = 3
      object Label7: TLabel
        Left = 127
        Top = 9
        Width = 188
        Height = 32
        Caption = 'Buscar Produtos'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWhite
        Font.Height = -24
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold, fsUnderline]
        ParentFont = False
      end
    end
    object StringGridProd: TStringGrid
      Left = 16
      Top = 154
      Width = 401
      Height = 197
      TabOrder = 4
      OnSelectCell = StringGridProdSelectCell
      RowHeights = (
        24
        24
        24
        24
        24)
    end
    object btn_ant: TButton
      Left = 40
      Top = 360
      Width = 75
      Height = 25
      Caption = 'Anterior'
      TabOrder = 5
      OnClick = btn_antClick
    end
    object Button2: TButton
      Left = 280
      Top = 360
      Width = 75
      Height = 25
      Caption = 'Pr'#243'ximo'
      TabOrder = 6
      OnClick = Button2Click
    end
  end
  object CbxProdutoSecao: TComboBox
    Left = 131
    Top = 240
    Width = 252
    Height = 23
    CharCase = ecUpperCase
    TabOrder = 3
    OnChange = CbxProdutoSecaoChange
  end
  object edtCodigoProduto: TEdit
    Left = 64
    Top = 96
    Width = 337
    Height = 38
    CharCase = ecUpperCase
    Enabled = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -21
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    TabOrder = 4
  end
  object edtProDescricao: TEdit
    Left = 64
    Top = 176
    Width = 249
    Height = 38
    CharCase = ecUpperCase
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -21
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    TabOrder = 5
    OnChange = edtProDescricaoChange
  end
  object edtProdPrecoCusto: TEdit
    Left = 56
    Top = 305
    Width = 225
    Height = 38
    CharCase = ecUpperCase
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -21
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    TabOrder = 6
    OnChange = edtProdPrecoCustoChange
    OnExit = edtProdPrecoCustoExit
  end
  object edtProdPrecoVenda: TEdit
    Left = 310
    Top = 305
    Width = 124
    Height = 38
    CharCase = ecUpperCase
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -21
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    TabOrder = 7
    OnChange = edtProdPrecoVendaChange
    OnExit = edtProdPrecoVendaExit
  end
end
