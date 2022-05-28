unit Avalicacao.Cadastros.Medicamento.ViewModel.Impl.MedicamentoViewModel;

interface

uses
  System.Generics.Collections,

  Avaliacao.CrudBase.ModoCrud,

  Avalicacao.Cadastros.Fabricante.Model.Entity.Fabricante,

  Avalicacao.Cadastros.ReacoesAdversas.Model.Entity.Impl.ReacoesAdversas,

  Avalicacao.Cadastros.Medicamento.Model.Entity.Medicamento,
  Avalicacao.Cadastros.Medicamento.Model.Entity.Impl.Medicamento,
  Avalicacao.Cadastros.Medicamento.Model.Entity.MedicamentoRepository,
  Avalicacao.Cadastros.Medicamento.Model.Entity.Impl.MedicamentoRepository,

  Avalicacao.Cadastros.Medicamento.ViewModel.MedicamentoViewModel;

type
  TMedicamentoViewModel = class(TInterfacedObject, IMedicamentoViewModel)
  private
    FEntity: IMedicamento;
    FFabricanteRepository: IMedicamentoRepository;

    FAtualizarComponentesVisuas: TEventAtualizarComponentesVisuas;
    FAtualizarEntidades: TEventAtualizarEntidades;

    function GetCodigo: Integer;
    function GetNome: string;
    function GetFabricante: IFabricante;
    function GetPreco: Double;
    function GetQuantidadeComprimidos: Integer;
    function GetReacoesAdversas: TList<TReacoesAdversas>;
    function GetRegistroAnvisa: string;
    function GetTelefoneSac: string;
    function GetValidade: TDate;
    function GetAtualizarComponentesVisuas: TEventAtualizarComponentesVisuas;
    function GetAtualizarEntidades: TEventAtualizarEntidades;

    procedure SetCodigo(const Value: Integer);
    procedure SetNome(const Value: string);
    procedure SetAtualizarComponentesVisuas(const Value: TEventAtualizarComponentesVisuas);
    procedure SetAtualizarEntidades(const Value: TEventAtualizarEntidades);
    procedure SetFabricante(const Value: IFabricante);
    procedure SetPreco(const Value: Double);
    procedure SetQuantidadeComprimidos(const Value: Integer);
    procedure SetReacoesAdversas(const Value: TList<TReacoesAdversas>);
    procedure SetRegistroAnvisa(const Value: string);
    procedure SetTelefoneSac(const Value: string);
    procedure SetValidade(const Value: TDate);
  public
    constructor Create;

    procedure NovoRegistro;
    procedure SalvarRegistro(const ModoCrud: TModoCrud);
    procedure CarregarRegistro;

    property Codigo: Integer read GetCodigo write SetCodigo;
    property Fabricante: IFabricante read GetFabricante write SetFabricante;
    property Nome: string read GetNome write SetNome;
    property Preco: Double read GetPreco write SetPreco;
    property QuantidadeComprimidos: Integer read GetQuantidadeComprimidos write SetQuantidadeComprimidos;
    property ReacoesAdversas: TList<TReacoesAdversas> read GetReacoesAdversas write SetReacoesAdversas;
    property RegistroAnvisa: string read GetRegistroAnvisa write SetRegistroAnvisa;
    property TelefoneSac: string read GetTelefoneSac write SetTelefoneSac;
    property Validade: TDate read GetValidade write SetValidade;

    property AtualizarComponentesVisuas: TEventAtualizarComponentesVisuas read GetAtualizarComponentesVisuas write SetAtualizarComponentesVisuas;
    property AtualizarEntidades: TEventAtualizarEntidades read GetAtualizarEntidades write SetAtualizarEntidades;
  end;

implementation

{ TMedicamentoViewModel }

constructor TMedicamentoViewModel.Create;
begin
  FFabricanteRepository := TMedicamentoRepository.Create;

  CarregarRegistro;
end;

procedure TMedicamentoViewModel.CarregarRegistro;
begin

  FEntity := FFabricanteRepository.RetornarUltimoRegistro;

  if not Assigned(FEntity) then
    FEntity := TMedicamento.Create;

  if Assigned(FAtualizarComponentesVisuas) then
    FAtualizarComponentesVisuas;
end;

procedure TMedicamentoViewModel.SalvarRegistro(const ModoCrud: TModoCrud);
begin
  if Assigned(FAtualizarEntidades) then
    FAtualizarEntidades;

  if ModoCrud = TInsercao then
    FFabricanteRepository.Cadastrar(FEntity)
  else
    FFabricanteRepository.Atualizar(FEntity);
end;

function TMedicamentoViewModel.GetAtualizarComponentesVisuas: TEventAtualizarComponentesVisuas;
begin
  Result := FAtualizarComponentesVisuas;
end;

function TMedicamentoViewModel.GetAtualizarEntidades: TEventAtualizarEntidades;
begin
  Result := FAtualizarEntidades;
end;

function TMedicamentoViewModel.GetCodigo: Integer;
begin
  Result := FEntity.Codigo;
end;

function TMedicamentoViewModel.GetFabricante: IFabricante;
begin
  Result := FEntity.Fabricante;
end;

function TMedicamentoViewModel.GetNome: string;
begin
  Result := FEntity.Nome;
end;

function TMedicamentoViewModel.GetPreco: Double;
begin
  Result := FEntity.Preco;
end;

function TMedicamentoViewModel.GetQuantidadeComprimidos: Integer;
begin
  Result := FEntity.QuantidadeComprimidos;
end;

function TMedicamentoViewModel.GetReacoesAdversas: TList<TReacoesAdversas>;
begin
  Result := FEntity.ReacoesAdversas;
end;

function TMedicamentoViewModel.GetRegistroAnvisa: string;
begin
  Result := FEntity.RegistroAnvisa;
end;

function TMedicamentoViewModel.GetTelefoneSac: string;
begin
  Result := FEntity.TelefoneSac;
end;

function TMedicamentoViewModel.GetValidade: TDate;
begin
  Result := FEntity.Validade;
end;

procedure TMedicamentoViewModel.NovoRegistro;
begin
  FEntity := TMedicamento.Create;
end;

procedure TMedicamentoViewModel.SetAtualizarComponentesVisuas(const Value: TEventAtualizarComponentesVisuas);
begin
  FAtualizarComponentesVisuas := Value;
end;

procedure TMedicamentoViewModel.SetAtualizarEntidades(const Value: TEventAtualizarEntidades);
begin
  FAtualizarEntidades := Value;
end;

procedure TMedicamentoViewModel.SetCodigo(const Value: Integer);
begin
  FEntity.Codigo := Value;
end;

procedure TMedicamentoViewModel.SetFabricante(const Value: IFabricante);
begin
  FEntity.Fabricante := Value;
end;

procedure TMedicamentoViewModel.SetNome(const Value: string);
begin
  FEntity.Nome := Value;
end;

procedure TMedicamentoViewModel.SetPreco(const Value: Double);
begin
  FEntity.Preco := Value;
end;

procedure TMedicamentoViewModel.SetQuantidadeComprimidos(const Value: Integer);
begin
  FEntity.QuantidadeComprimidos := Value;
end;

procedure TMedicamentoViewModel.SetReacoesAdversas(const Value: TList<TReacoesAdversas>);
begin
  FEntity.ReacoesAdversas := Value;
end;

procedure TMedicamentoViewModel.SetRegistroAnvisa(const Value: string);
begin
  FEntity.RegistroAnvisa := Value;
end;

procedure TMedicamentoViewModel.SetTelefoneSac(const Value: string);
begin
  FEntity.TelefoneSac := Value;
end;

procedure TMedicamentoViewModel.SetValidade(const Value: TDate);
begin
  FEntity.Validade := Value;
end;

end.