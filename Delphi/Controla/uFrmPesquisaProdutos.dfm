inherited frmPesquisaProdutos: TfrmPesquisaProdutos
  Caption = 'Pesquisa Produtos'
  ExplicitTop = -29
  TextHeight = 15
  inherited Label2: TLabel
    Left = 183
    Width = 234
    Caption = 'Buscar Por   Produtos'
    ExplicitLeft = 183
    ExplicitWidth = 234
  end
  inherited Panel1: TPanel
    inherited Label1: TLabel
      Left = 163
      Top = 0
      ExplicitLeft = 163
      ExplicitTop = 0
    end
  end
  inherited Edit1: TEdit
    OnChange = Edit1Change
  end
  inherited btn_buscar: TButton
    OnClick = btn_buscarClick
  end
  inherited ListBox1: TListBox
    Items.Strings = (
      'CODIGO | DESCRICAO | PRECOCUSTO | PRECOVENDA | SECAO')
    OnDblClick = ListBox1DblClick
  end
  object edtcod: TEdit
    Left = 104
    Top = 296
    Width = 121
    Height = 23
    Enabled = False
    TabOrder = 5
  end
  object edtdesc: TEdit
    Left = 104
    Top = 325
    Width = 121
    Height = 23
    Enabled = False
    TabOrder = 6
  end
  object edtpc: TEdit
    Left = 104
    Top = 354
    Width = 121
    Height = 23
    Enabled = False
    TabOrder = 7
  end
  object edtpv: TEdit
    Left = 104
    Top = 383
    Width = 121
    Height = 23
    Enabled = False
    TabOrder = 8
  end
  object cbxse: TComboBox
    Left = 272
    Top = 295
    Width = 145
    Height = 23
    Enabled = False
    TabOrder = 9
  end
  object Button1: TButton
    Left = 264
    Top = 352
    Width = 75
    Height = 25
    Caption = 'Button1'
    TabOrder = 10
  end
end
