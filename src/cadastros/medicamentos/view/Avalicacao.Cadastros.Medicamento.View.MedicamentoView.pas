unit Avalicacao.Cadastros.Medicamento.View.MedicamentoView;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ComCtrls, Vcl.Mask, Data.DB,
  Datasnap.DBClient, Vcl.Grids, Vcl.DBGrids, Vcl.Buttons,

  Avaliacao.CrudBase,

  Avalicacao.Cadastros.Fabricante.Model.Entity.Impl.Fabricante,
  Avalicacao.Cadastros.Medicamento.Model.Entity.Impl.ReacaoMedicamentoItem,
  Avalicacao.Cadastros.Medicamento.ViewModel.MedicamentoViewModel,
  Avalicacao.Cadastros.Medicamento.ViewModel.Impl.MedicamentoViewModel;

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
    LBAdicionarReacaoAdversa: TLabel;
    EDTReacaoAdversaId: TEdit;
    BBAdicionarReacaoAdversa: TBitBtn;

    procedure BBAdicionarReacaoAdversaClick(Sender: TObject);
    procedure CDSReacoesAdversasBeforeDelete(DataSet: TDataSet);
    procedure FormCreate(Sender: TObject);
  private
    FViewModel: IMedicamentoViewModel;

    procedure NovoRegistro; override;
    procedure SalvarRegistro; override;
    procedure CarregarRegistro; override;
    procedure LimparDataSet; override;

    procedure AtualizarCompontensVisuais;
    procedure AtualizarEntidade;
    procedure AtualizarFabricantes;
    procedure AtualizarReacoesAdversas;
    function JaExisteNoDataSet(const ReacaoAdversaId: Integer): Boolean;
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
  FViewModel.AtualizarReacaoAdversa := AtualizarReacoesAdversas;
  FViewModel.AtualizarFabricantesDisponiveis := AtualizarFabricantes;
end;

{ TMedicamentoView }

procedure TMedicamentoView.AtualizarCompontensVisuais;
begin
  if FViewModel.Codigo = 0 then
    Exit;

  EDTCodigo.Text := FViewModel.Codigo.ToString;
  EDTNome.Text := FViewModel.Nome;
  EDTQuantiade.Text := FViewModel.QuantidadeComprimidos.ToString;
  MEDRegistroAnvisa.Text := FViewModel.RegistroAnvisa;
  MEDValidade.Text := DateToStr(FViewModel.Validade);
  MEDTelefone.Text := FViewModel.TelefoneSac;
  MEDPreco.Text := FViewModel.Preco.ToString;

  AtualizarFabricantes;
  AtualizarReacoesAdversas;
end;

procedure TMedicamentoView.AtualizarFabricantes;
var
  Fabricante: TFabricante;
begin

  CBFabricante.Items.AddObject(EmptyStr, TObject.Create);

  for Fabricante in FViewModel.FabricantesDisponiveis do
    CBFabricante.Items.AddObject(Fabricante.Nome, TObject(Fabricante));

  CBFabricante.ItemIndex := FViewModel.RetornarIndiceDoFabricante;
end;

procedure TMedicamentoView.AtualizarReacoesAdversas;
var
  ReacaoMedicamentoItem: TReacaoMedicamentoItem;
begin
  CDSReacoesAdversas.Open;

  for ReacaoMedicamentoItem in FViewModel.ReacoesAdversas do
  begin
    if JaExisteNoDataSet(ReacaoMedicamentoItem.ReacaoAdversaId) then
      Continue;

    CDSReacoesAdversas.Append;
    CDSReacoesAdversasCodigo.AsInteger := ReacaoMedicamentoItem.ReacaoAdversa.Codigo;
    CDSReacoesAdversasDescricao.AsString := ReacaoMedicamentoItem.ReacaoAdversa.Descricao;
    CDSReacoesAdversas.Post;
  end;

end;

function TMedicamentoView.JaExisteNoDataSet(const ReacaoAdversaId: Integer): Boolean;
begin
  if CDSReacoesAdversas.IsEmpty then
    Exit(False);

  CDSReacoesAdversas.First;

  while not CDSReacoesAdversas.Eof do
  begin
    if CDSReacoesAdversasCodigo.AsInteger = ReacaoAdversaId then
      Exit(True);

    CDSReacoesAdversas.Next;
  end;

  Result := False;
end;

procedure TMedicamentoView.LimparDataSet;
begin
  CDSReacoesAdversas.EmptyDataSet;
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

procedure TMedicamentoView.BBAdicionarReacaoAdversaClick(Sender: TObject);
var
  ReacaoAdversaId: Integer;
begin
  ReacaoAdversaId := string(EDTReacaoAdversaId.Text).ToInteger;

  FViewModel.AdicionarReacaoAdversa(ReacaoAdversaId);
end;

procedure TMedicamentoView.CarregarRegistro;
begin
  FViewModel.CarregarRegistro;
end;

procedure TMedicamentoView.CDSReacoesAdversasBeforeDelete(DataSet: TDataSet);
begin
  FViewModel.RemoverReacaoAdversa(CDSReacoesAdversasCodigo.AsInteger);
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
