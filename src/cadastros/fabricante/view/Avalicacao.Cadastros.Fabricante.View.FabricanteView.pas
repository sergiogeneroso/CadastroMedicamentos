unit Avalicacao.Cadastros.Fabricante.View.FabricanteView;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs,

  Avaliacao.CrudBase, Vcl.StdCtrls;

type
  TFabricanteView = class(TFRMCrudBase)
    EDTCodigo: TEdit;
    EDTNome: TEdit;
    LBCodigo: TLabel;
    LBNome: TLabel;
  private
    { Private declarations }
  public

  end;

var
  FabricanteView: TFabricanteView;

implementation

{$R *.dfm}
{ TFabricanteView }

end.
