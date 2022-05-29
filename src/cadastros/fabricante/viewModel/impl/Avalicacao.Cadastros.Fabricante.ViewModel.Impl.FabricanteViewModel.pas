unit Avalicacao.Cadastros.Fabricante.ViewModel.Impl.FabricanteViewModel;

interface

uses
  Avaliacao.CrudBase.ModoCrud,

  Avalicacao.Cadastros.Fabricante.Model.Entity.Fabricante,
  Avalicacao.Cadastros.Fabricante.Model.Entity.Impl.Fabricante,
  Avalicacao.Cadastros.Fabricante.Model.Repository.FabricanteRepository,
  Avalicacao.Cadastros.Fabricante.Model.Repository.Impl.FabricanteRepository,
  Avalicacao.Cadastros.Fabricante.ViewModel.FabricanteViewModel;

type
  TFabricanteViewModel = class(TInterfacedObject, IFabricanteViewModel)
  private
    FEntity: IFabricante;
    FFabricanteRepository: IFabricanteRepository;

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

{ TFabricanteViewModel }

constructor TFabricanteViewModel.Create;
begin
  FFabricanteRepository := TFabricanteRepository.Create;

  CarregarRegistro;
end;

procedure TFabricanteViewModel.CarregarRegistro;
begin

  FEntity := FFabricanteRepository.RetornarUltimoRegistro;

  if not Assigned(FEntity) then
    FEntity := TFabricante.Create;

  if Assigned(FAtualizarComponentesVisuas) then
    FAtualizarComponentesVisuas;
end;

function TFabricanteViewModel.GetAtualizarComponentesVisuas: TEventAtualizarComponentesVisuas;
begin
  Result := FAtualizarComponentesVisuas;
end;

function TFabricanteViewModel.GetAtualizarEntidades: TEventAtualizarEntidades;
begin
  Result := FAtualizarEntidades;
end;

function TFabricanteViewModel.GetCodigo: Integer;
begin
  Result := FEntity.Codigo;
end;

function TFabricanteViewModel.GetNome: string;
begin
  Result := FEntity.Nome;
end;

procedure TFabricanteViewModel.NovoRegistro;
begin
  FEntity := TFabricante.Create;
end;

procedure TFabricanteViewModel.SalvarRegistro(const ModoCrud: TModoCrud);
begin
  if Assigned(FAtualizarEntidades) then
    FAtualizarEntidades;

  if ModoCrud = TInsercao then
    FFabricanteRepository.Cadastrar(FEntity)
  else
    FFabricanteRepository.Atualizar(FEntity);
end;

procedure TFabricanteViewModel.SetAtualizarComponentesVisuas(const Value: TEventAtualizarComponentesVisuas);
begin
  FAtualizarComponentesVisuas := Value;
end;

procedure TFabricanteViewModel.SetAtualizarEntidades(const Value: TEventAtualizarEntidades);
begin
  FAtualizarEntidades := Value;
end;

procedure TFabricanteViewModel.SetCodigo(const Value: Integer);
begin
  FEntity.Codigo := Value;
end;

procedure TFabricanteViewModel.SetNome(const Value: string);
begin
  FEntity.Nome := Value;
end;

end.
