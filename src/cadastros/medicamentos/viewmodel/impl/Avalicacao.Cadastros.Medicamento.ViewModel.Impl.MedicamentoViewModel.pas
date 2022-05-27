unit Avalicacao.Cadastros.Medicamento.ViewModel.Impl.MedicamentoViewModel;

interface

uses
  Avaliacao.CrudBase.ModoCrud,

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
    function GetAtualizarComponentesVisuas: TEventAtualizarComponentesVisuas;
    function GetAtualizarEntidades: TEventAtualizarEntidades;

    procedure SetCodigo(const Value: Integer);
    procedure SetNome(const Value: string);
    procedure SetAtualizarComponentesVisuas(const Value: TEventAtualizarComponentesVisuas);
    procedure SetAtualizarEntidades(const Value: TEventAtualizarEntidades);
  public
    constructor Create;

    procedure NovoRegistro;
    procedure SalvarRegistro(const ModoCrud: TModoCrud);
    procedure CarregarRegistro;

    property Codigo: Integer read GetCodigo write SetCodigo;
    property Nome: string read GetNome write SetNome;

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

function TMedicamentoViewModel.GetNome: string;
begin
  Result := FEntity.Nome;
end;

procedure TMedicamentoViewModel.NovoRegistro;
begin
  FEntity := TMedicamento.Create;
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

procedure TMedicamentoViewModel.SetNome(const Value: string);
begin
  FEntity.Nome := Value;
end;

end.
