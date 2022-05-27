unit Avalicacao.Cadastros.Fabricante.View.FabricanteView;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs,

  Avaliacao.CrudBase, Vcl.StdCtrls, Vcl.ComCtrls,

  Avalicacao.Cadastros.Fabricante.ViewModel.FabricanteViewModel,
  Avalicacao.Cadastros.Fabricante.ViewModel.Impl.FabricanteViewModel;

type
  TFabricanteView = class(TFRMCrudBase)
    EDTCodigo: TEdit;
    EDTNome: TEdit;
    LBCodigo: TLabel;
    LBNome: TLabel;
    PGControl: TPageControl;
    TSGeral: TTabSheet;
    procedure FormCreate(Sender: TObject);
  private
    FViewModel: IFabricanteViewModel;

    procedure NovoRegistro; override;
    procedure SalvarRegistro; override;
    procedure CarregarRegistro; override;

    procedure AtualizarCompontensVisuais;
    procedure AtualizarEntidade;
  public

  end;

var
  FabricanteView: TFabricanteView;

implementation

{$R *.dfm}
{ TFabricanteView }

{ TFabricanteView }

procedure TFabricanteView.FormCreate(Sender: TObject);
begin
  inherited;

  FViewModel := TFabricanteViewModel.Create;

  FViewModel.AtualizarComponentesVisuas := AtualizarCompontensVisuais;
  FViewModel.AtualizarEntidades := AtualizarEntidade;
end;

procedure TFabricanteView.AtualizarCompontensVisuais;
begin
  EDTCodigo.Text := FViewModel.Codigo.ToString;
  EDTNome.Text := FViewModel.Nome;
end;

procedure TFabricanteView.AtualizarEntidade;
begin
  FViewModel.Nome := EDTNome.Text;
end;

procedure TFabricanteView.CarregarRegistro;
begin
  FViewModel.CarregarRegistro;
end;

procedure TFabricanteView.NovoRegistro;
begin
  FViewModel.NovoRegistro;
end;

procedure TFabricanteView.SalvarRegistro;
begin
  FViewModel.SalvarRegistro(ModoCrudAtual);
end;

end.
