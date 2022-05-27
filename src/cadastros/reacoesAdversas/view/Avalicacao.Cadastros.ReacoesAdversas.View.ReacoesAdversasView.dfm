object ReacoesAdversasView: TReacoesAdversasView
  Left = 0
  Top = 0
  Caption = 'Rea'#231#245'es Adversas'
  ClientHeight = 217
  ClientWidth = 523
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object PGControl: TPageControl
    Left = 0
    Top = 0
    Width = 523
    Height = 217
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
        Caption = 'Codigo:'
      end
      object LBDescricao: TLabel
        Left = 32
        Top = 64
        Width = 50
        Height = 13
        Caption = 'Descri'#231#227'o:'
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
      object EDTDescricao: TEdit
        Left = 88
        Top = 61
        Width = 249
        Height = 21
        TabOrder = 1
      end
    end
  end
end
