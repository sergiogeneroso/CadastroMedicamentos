unit Avalicacao.Cadastros.Medicamento.View.MedicamentoView;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ComCtrls,

  Avaliacao.CrudBase,

  Avalicacao.Cadastros.Medicamento.ViewModel.MedicamentoViewModel,
  Avalicacao.Cadastros.Medicamento.ViewModel.Impl.MedicamentoViewModel;

type
  TMedicamentoView = class(TFRMCrudBase)
    PGControl: TPageControl;
    TSGeral: TTabSheet;
    LBCodigo: TLabel;
    LBNome: TLabel;
    EDTCodigo: TEdit;
    EDTNome: TEdit;
    procedure FormCreate(Sender: TObject);
  private
    FViewModel: IMedicamentoViewModel;

    procedure NovoRegistro; override;
    procedure SalvarRegistro; override;
    procedure CarregarRegistro; override;

    procedure AtualizarCompontensVisuais;
    procedure AtualizarEntidade;
  end;

var
  MedicamentoView: TMedicamentoView;

implementation

{$R *.dfm}

procedure TMedicamentoView.FormCreate(Sender: TObject);
begin
  FViewModel := TMedicamentoViewModel.Create;

  FViewModel.AtualizarComponentesVisuas := AtualizarCompontensVisuais;
  FViewModel.AtualizarEntidades := AtualizarEntidade;
end;

{ TMedicamentoView }

procedure TMedicamentoView.AtualizarCompontensVisuais;
begin
  EDTCodigo.Text := FViewModel.Codigo.ToString;
  EDTNome.Text := FViewModel.Nome;
end;

procedure TMedicamentoView.AtualizarEntidade;
begin
  FViewModel.Nome := EDTNome.Text;
end;

procedure TMedicamentoView.CarregarRegistro;
begin
  FViewModel.CarregarRegistro;
end;

procedure TMedicamentoView.NovoRegistro;
begin
  FViewModel.NovoRegistro;
end;

procedure TMedicamentoView.SalvarRegistro;
begin
  FViewModel.SalvarRegistro(ModoCrudAtual);
end;

end.
