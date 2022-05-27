object FRMCrudBase: TFRMCrudBase
  Left = 0
  Top = 0
  Caption = 'CrudBase'
  ClientHeight = 441
  ClientWidth = 793
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  PixelsPerInch = 96
  TextHeight = 13
  object PNFooter: TPanel
    Left = 0
    Top = 400
    Width = 793
    Height = 41
    Align = alBottom
    TabOrder = 0
    ExplicitLeft = 240
    ExplicitTop = 360
    ExplicitWidth = 185
    object BTNNovo: TButton
      Left = 432
      Top = 8
      Width = 75
      Height = 25
      Caption = 'Novo'
      TabOrder = 0
      OnClick = BTNNovoClick
    end
    object BTNAlterar: TButton
      Left = 520
      Top = 8
      Width = 75
      Height = 25
      Caption = 'Alterar'
      TabOrder = 1
      OnClick = BTNAlterarClick
    end
    object BTNSalvar: TButton
      Left = 608
      Top = 8
      Width = 75
      Height = 25
      Caption = 'Salvar'
      TabOrder = 2
      OnClick = BTNSalvarClick
    end
    object BTNCancelar: TButton
      Left = 697
      Top = 8
      Width = 75
      Height = 25
      Caption = 'Cancelar'
      TabOrder = 3
      OnClick = BTNCancelarClick
    end
    object BTNPrimeiro: TButton
      Left = 8
      Top = 8
      Width = 25
      Height = 25
      Caption = '<<'
      TabOrder = 4
    end
    object BTNAnterior: TButton
      Left = 39
      Top = 8
      Width = 25
      Height = 25
      Caption = '<'
      TabOrder = 5
    end
    object BTNProximo: TButton
      Left = 72
      Top = 8
      Width = 25
      Height = 25
      Caption = '>'
      TabOrder = 6
    end
    object BTNUltimo: TButton
      Left = 103
      Top = 8
      Width = 25
      Height = 25
      Caption = '>>'
      TabOrder = 7
    end
  end
end
