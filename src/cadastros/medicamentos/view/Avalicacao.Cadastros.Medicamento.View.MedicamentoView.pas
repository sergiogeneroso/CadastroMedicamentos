unit Avalicacao.Cadastros.Medicamento.View.MedicamentoView;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ComCtrls,

  Avaliacao.CrudBase,

  Avalicacao.Cadastros.Fabricante.Model.Entity.Impl.Fabricante,

  Avalicacao.Cadastros.Medicamento.ViewModel.MedicamentoViewModel,
  Avalicacao.Cadastros.Medicamento.ViewModel.Impl.MedicamentoViewModel, Vcl.Mask,
  Data.DB, Datasnap.DBClient, Vcl.Grids, Vcl.DBGrids;

type
  TMedicamentoView = class(TFRMCrudBase)
    PGControl: TPageControl;
    TSGeral: TTabSheet;

    LBCodigo: TLabel;
    LBNome: TLabel;
    LBRegistroAnvisa: TLabel;
    LBValidade: TLabel;
    LBTelefone: TLabel;
    LBPreco: TLabel;
    LBQuantidade: TLabel;
    LBFabricante: TLabel;

    GBReacoesAdversas: TGroupBox;
    DSReacoesAdversas: TDataSource;

    DBReacoesAdversas: TDBGrid;

    CDSReacoesAdversas: TClientDataSet;
    CDSReacoesAdversasCodigo: TIntegerField;
    CDSReacoesAdversasDescricao: TStringField;

    EDTCodigo: TEdit;
    EDTNome: TEdit;
    EDTQuantiade: TEdit;
    MEDRegistroAnvisa: TMaskEdit;
    MEDValidade: TMaskEdit;
    MEDTelefone: TMaskEdit;
    MEDPreco: TMaskEdit;

    CBFabricante: TComboBox;

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
var
  Fabricante: TFabricante;
begin
  if FViewModel.Codigo = 0 then
    Exit;

  CBFabricante.Items.AddObject(EmptyStr, TObject.Create);

  for Fabricante in FViewModel.FabricantesDisponiveis do
    CBFabricante.Items.AddObject(Fabricante.Nome, TObject(Fabricante));

  EDTCodigo.Text := FViewModel.Codigo.ToString;
  EDTNome.Text := FViewModel.Nome;
  EDTQuantiade.Text := FViewModel.QuantidadeComprimidos.ToString;
  MEDRegistroAnvisa.Text := FViewModel.RegistroAnvisa;
  MEDValidade.Text := DateToStr(FViewModel.Validade);
  MEDTelefone.Text := FViewModel.TelefoneSac;
  MEDPreco.Text := FViewModel.Preco.ToString;

  CBFabricante.ItemIndex := FViewModel.RetornarIndiceDoFabricante;
end;

procedure TMedicamentoView.AtualizarEntidade;
begin
  FViewModel.Nome := EDTNome.Text;
  FViewModel.QuantidadeComprimidos := string(EDTQuantiade.Text).ToInteger;
  FViewModel.RegistroAnvisa := MEDRegistroAnvisa.Text;
  FViewModel.Validade := StrToDate(MEDValidade.Text);
  FViewModel.TelefoneSac := MEDTelefone.Text;
  FViewModel.Preco := string(MEDPreco.Text).ToDouble;

  FViewModel.Fabricante := TFabricante(CBFabricante.Items.Objects[CBFabricante.ItemIndex]);
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
