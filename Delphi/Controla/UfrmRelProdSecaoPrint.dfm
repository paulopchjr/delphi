object frmProdSecaoPrint: TfrmProdSecaoPrint
  Left = 0
  Top = 0
  Caption = 'frmProdSecaoPrint'
  ClientHeight = 441
  ClientWidth = 756
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  TextHeight = 15
  object RLReportProSecao: TRLReport
    Left = -80
    Top = -104
    Width = 794
    Height = 1123
    Borders.Sides = sdCustom
    Borders.DrawLeft = False
    Borders.DrawTop = False
    Borders.DrawRight = False
    Borders.DrawBottom = True
    DataSource = frmDm.DataSource1
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = []
    object bandTitulo: TRLBand
      Left = 38
      Top = 38
      Width = 718
      Height = 35
      BandType = btHeader
      Borders.Sides = sdCustom
      Borders.DrawLeft = False
      Borders.DrawTop = False
      Borders.DrawRight = False
      Borders.DrawBottom = True
      object Label1: TLabel
        Left = 304
        Top = 16
        Width = 61
        Height = 18
        Caption = 'Controla'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -15
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RLSystemInfo1: TRLSystemInfo
        Left = 32
        Top = 11
        Width = 39
        Height = 21
        Text = ''
      end
      object RLSystemInfo2: TRLSystemInfo
        Left = 648
        Top = 11
        Width = 39
        Height = 16
        Info = itHour
        Text = ''
      end
    end
    object bandCabecalho: TRLBand
      Left = 38
      Top = 73
      Width = 718
      Height = 56
      BandType = btTitle
      object RLLabel1: TRLLabel
        Left = 0
        Top = 0
        Width = 718
        Height = 24
        Align = faTop
        Alignment = taCenter
        Caption = 'Relat'#243'rio de Produtos por Se'#231#227'o '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -21
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RLLabel2: TRLLabel
        Left = 0
        Top = 24
        Width = 718
        Height = 16
        Align = faTop
        Alignment = taCenter
      end
    end
    object RLGroup1: TRLGroup
      Left = 38
      Top = 129
      Width = 718
      Height = 112
      DataFields = 'SECAO'
      object headergroup: TRLBand
        Left = 0
        Top = 0
        Width = 718
        Height = 49
        BandType = btHeader
        Borders.Sides = sdCustom
        Borders.DrawLeft = False
        Borders.DrawTop = False
        Borders.DrawRight = False
        Borders.DrawBottom = True
        object RLLabel3: TRLLabel
          Left = 24
          Top = 6
          Width = 107
          Height = 16
          Caption = 'Codigo Se'#231#227'o:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -15
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object RLLabel4: TRLLabel
          Left = 272
          Top = 6
          Width = 52
          Height = 16
          Caption = 'Se'#231#227'o:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -15
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object RLDBText1: TRLDBText
          Left = 144
          Top = 6
          Width = 108
          Height = 16
          DataField = 'CODIGO_SECAO'
          DataSource = frmDm.DataSource1
          Text = ''
        end
        object RLDBText2: TRLDBText
          Left = 330
          Top = 6
          Width = 50
          Height = 16
          DataField = 'SECAO'
          DataSource = frmDm.DataSource1
          Text = ''
        end
        object RLLabel5: TRLLabel
          Left = 24
          Top = 27
          Width = 83
          Height = 16
          Caption = 'C'#243'd.Produto'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object RLLabel6: TRLLabel
          Left = 137
          Top = 26
          Width = 66
          Height = 16
          Caption = 'Descri'#231#227'o'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object RLLabel7: TRLLabel
          Left = 418
          Top = 27
          Width = 83
          Height = 16
          Caption = 'Valor Venda'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object RLLabel8: TRLLabel
          Left = 303
          Top = 26
          Width = 77
          Height = 16
          Caption = 'Valor Custo'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object RLLabel9: TRLLabel
          Left = 530
          Top = 27
          Width = 56
          Height = 16
          Caption = 'Margem'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
      end
      object bandDetail: TRLBand
        Left = 0
        Top = 49
        Width = 718
        Height = 57
        object RLDBText3: TRLDBText
          Left = 24
          Top = 6
          Width = 55
          Height = 16
          DataField = 'CODIGO'
          DataSource = frmDm.DataSource1
          Text = ''
        end
        object RLDBText4: TRLDBText
          Left = 137
          Top = 6
          Width = 80
          Height = 16
          DataField = 'DESCRICAO'
          DataSource = frmDm.DataSource1
          Text = ''
        end
        object RLDBText5: TRLDBText
          Left = 418
          Top = 6
          Width = 125
          Height = 16
          DataField = 'VALOR_DE_VENDA'
          DataSource = frmDm.DataSource1
          Text = ''
        end
        object RLDBText6: TRLDBText
          Left = 303
          Top = 6
          Width = 124
          Height = 19
          DataField = 'VALOR_DE_CUSTO'
          DataSource = frmDm.DataSource1
          Text = ''
        end
        object RLDBText7: TRLDBText
          Left = 530
          Top = 6
          Width = 63
          Height = 16
          DataField = 'MARGEM'
          DataSource = frmDm.DataSource1
          Text = ''
        end
      end
    end
    object bandfooter: TRLBand
      Left = 38
      Top = 241
      Width = 718
      Height = 72
      BandType = btFooter
      Borders.Sides = sdCustom
      Borders.DrawLeft = False
      Borders.DrawTop = False
      Borders.DrawRight = False
      Borders.DrawBottom = False
      object RLSystemInfo3: TRLSystemInfo
        Left = 648
        Top = 53
        Width = 29
        Height = 16
        Alignment = taRightJustify
        Borders.Sides = sdCustom
        Borders.DrawLeft = False
        Borders.DrawTop = False
        Borders.DrawRight = False
        Borders.DrawBottom = False
        Info = itPageNumber
        Text = ''
      end
      object RLLabel10: TRLLabel
        Left = 579
        Top = 53
        Width = 35
        Height = 16
        Caption = 'Pagina:'
      end
    end
  end
end
