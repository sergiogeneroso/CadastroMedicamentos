object MedicamentoView: TMedicamentoView
  Left = 0
  Top = 0
  Caption = 'Medicamento'
  ClientHeight = 546
  ClientWidth = 608
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object PGControl: TPageControl
    Left = 0
    Top = 0
    Width = 608
    Height = 546
    ActivePage = TSGeral
    Align = alClient
    TabOrder = 0
    object TSGeral: TTabSheet
      Caption = 'Geral'
      object LBCodigo: TLabel
        Left = 45
        Top = 27
        Width = 37
        Height = 13
        Alignment = taRightJustify
        Caption = 'Codigo:'
      end
      object LBNome: TLabel
        Left = 51
        Top = 64
        Width = 31
        Height = 13
        Alignment = taRightJustify
        Caption = 'Nome:'
      end
      object LBRegistroAnvisa: TLabel
        Left = 3
        Top = 101
        Width = 79
        Height = 13
        Alignment = taRightJustify
        Caption = 'Registro Anvisa:'
      end
      object LBValidade: TLabel
        Left = 38
        Top = 141
        Width = 44
        Height = 13
        Alignment = taRightJustify
        Caption = 'Validade:'
      end
      object LBTelefone: TLabel
        Left = 36
        Top = 181
        Width = 46
        Height = 13
        Alignment = taRightJustify
        Caption = 'Telefone:'
      end
      object LBPreco: TLabel
        Left = 51
        Top = 221
        Width = 31
        Height = 13
        Alignment = taRightJustify
        Caption = 'Preco:'
      end
      object LBQuantidade: TLabel
        Left = 22
        Top = 256
        Width = 60
        Height = 13
        Alignment = taRightJustify
        Caption = 'Quantidade:'
      end
      object LBFabricante: TLabel
        Left = 27
        Top = 296
        Width = 55
        Height = 13
        Alignment = taRightJustify
        Caption = 'Fabricante:'
      end
      object LBAdicionarReacaoAdversa: TLabel
        Left = 27
        Top = 336
        Width = 185
        Height = 13
        Alignment = taRightJustify
        Caption = 'Adicionar Rea'#231#227'o Adversa por Codigo:'
      end
      object EDTCodigo: TEdit
        Left = 88
        Top = 24
        Width = 49
        Height = 21
        Enabled = False
        NumbersOnly = True
        ReadOnly = True
        TabOrder = 0
      end
      object EDTNome: TEdit
        Left = 88
        Top = 61
        Width = 249
        Height = 21
        TabOrder = 1
      end
      object MEDRegistroAnvisa: TMaskEdit
        Left = 88
        Top = 98
        Width = 249
        Height = 21
        EditMask = '0.0000.0000.000-0;0;_'
        MaxLength = 17
        TabOrder = 2
        Text = ''
      end
      object MEDValidade: TMaskEdit
        Left = 88
        Top = 138
        Width = 249
        Height = 21
        EditMask = '00/00/0000;1;_'
        MaxLength = 10
        TabOrder = 3
        Text = '  /  /    '
      end
      object MEDTelefone: TMaskEdit
        Left = 88
        Top = 178
        Width = 249
        Height = 21
        EditMask = '(00)0000-0000;0;_'
        MaxLength = 13
        TabOrder = 4
        Text = ''
      end
      object MEDPreco: TMaskEdit
        Left = 88
        Top = 218
        Width = 246
        Height = 21
        TabOrder = 5
        Text = ''
      end
      object EDTQuantiade: TEdit
        Left = 88
        Top = 253
        Width = 249
        Height = 21
        NumbersOnly = True
        TabOrder = 6
      end
      object CBFabricante: TComboBox
        Left = 88
        Top = 293
        Width = 249
        Height = 21
        Style = csDropDownList
        TabOrder = 7
      end
      object GBReacoesAdversas: TGroupBox
        Left = 22
        Top = 360
        Width = 547
        Height = 121
        Caption = 'Rea'#231#245'es Adversas'
        TabOrder = 8
        object DBReacoesAdversas: TDBGrid
          Left = 2
          Top = 15
          Width = 543
          Height = 104
          Align = alClient
          DataSource = DSReacoesAdversas
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'Tahoma'
          TitleFont.Style = []
          Columns = <
            item
              Expanded = False
              FieldName = 'Codigo'
              Title.Caption = 'C'#211'DIGO'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'Descricao'
              ReadOnly = True
              Title.Caption = 'DESCRI'#199#195'O'
              Width = 440
              Visible = True
            end>
        end
      end
      object EDTReacaoAdversaId: TEdit
        Left = 218
        Top = 333
        Width = 47
        Height = 21
        NumbersOnly = True
        TabOrder = 9
      end
      object BBAdicionarReacaoAdversa: TBitBtn
        Left = 283
        Top = 331
        Width = 75
        Height = 25
        Caption = 'Adicionar'
        TabOrder = 10
        OnClick = BBAdicionarReacaoAdversaClick
      end
    end
  end
  object CDSReacoesAdversas: TClientDataSet
    PersistDataPacket.Data = {
      470000009619E0BD010000001800000002000000000003000000470006436F64
      69676F04000100000000000944657363726963616F0100490000000100055749
      4454480200020014000000}
    Active = True
    Aggregates = <>
    Params = <>
    Left = 428
    Top = 256
    object CDSReacoesAdversasCodigo: TIntegerField
      FieldName = 'Codigo'
    end
    object CDSReacoesAdversasDescricao: TStringField
      FieldName = 'Descricao'
    end
  end
  object DSReacoesAdversas: TDataSource
    DataSet = CDSReacoesAdversas
    Left = 532
    Top = 248
  end
end
