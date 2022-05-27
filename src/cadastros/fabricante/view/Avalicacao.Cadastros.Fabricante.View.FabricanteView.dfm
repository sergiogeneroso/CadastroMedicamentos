object FabricanteView: TFabricanteView
  Left = 0
  Top = 0
  Caption = 'Fabricante'
  ClientHeight = 217
  ClientWidth = 522
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object LBCodigo: TLabel
    Left = 45
    Top = 27
    Width = 37
    Height = 13
    Caption = 'Codigo:'
  end
  object LBNome: TLabel
    Left = 51
    Top = 64
    Width = 31
    Height = 13
    Caption = 'Nome:'
  end
  object EDTCodigo: TEdit
    Left = 88
    Top = 24
    Width = 49
    Height = 21
    NumbersOnly = True
    TabOrder = 0
  end
  object EDTNome: TEdit
    Left = 88
    Top = 61
    Width = 249
    Height = 21
    TabOrder = 1
  end
end
