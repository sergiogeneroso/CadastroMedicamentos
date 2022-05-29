unit Avalicacao.Cadastros.ReacoesAdversas.ViewModel.Impl.ReacoesAdversasViewModel;

interface

uses
  Avaliacao.CrudBase.ModoCrud,

  Avalicacao.Cadastros.ReacoesAdversas.Model.Entity.ReacoesAdversas,
  Avalicacao.Cadastros.ReacoesAdversas.Model.Entity.Impl.ReacoesAdversas,
  Avalicacao.Cadastros.ReacoesAdversas.Model.Repository.ReacoesAdversasRepository,
  Avalicacao.Cadastros.ReacoesAdversas.Model.Repository.Impl.ReacoesAdversasRepository,
  Avalicacao.Cadastros.ReacoesAdversas.ViewModel.ReacoesAdversasViewModel;

type
  TReacoesAdversasViewModel = class(TInterfacedObject, IReacoesAdversasViewModel)
  private
    FEntity: IReacoesAdversas;
    FReacoesAdversasRepository: IReacoesAdversasRepository;

    FAtualizarComponentesVisuas: TEventAtualizarComponentesVisuas;
    FAtualizarEntidades: TEventAtualizarEntidades;

    function GetCodigo: Integer;
    function GetDescricao: string;
    function GetAtualizarComponentesVisuas: TEventAtualizarComponentesVisuas;
    function GetAtualizarEntidades: TEventAtualizarEntidades;

    procedure SetCodigo(const Value: Integer);
    procedure SetDescricao(const Value: string);
    procedure SetAtualizarComponentesVisuas(const Value: TEventAtualizarComponentesVisuas);
    procedure SetAtualizarEntidades(const Value: TEventAtualizarEntidades);
  public
    constructor Create;

    procedure NovoRegistro;
    procedure SalvarRegistro(const ModoCrud: TModoCrud);
    procedure CarregarRegistro;

    property Codigo: Integer read GetCodigo write SetCodigo;
    property Descricao: string read GetDescricao write SetDescricao;

    property AtualizarComponentesVisuas: TEventAtualizarComponentesVisuas read GetAtualizarComponentesVisuas write SetAtualizarComponentesVisuas;
    property AtualizarEntidades: TEventAtualizarEntidades read GetAtualizarEntidades write SetAtualizarEntidades;
  end;

implementation

{ TReacoesAdversasViewModel }

constructor TReacoesAdversasViewModel.Create;
begin
  FReacoesAdversasRepository := TReacoesAdversasRepository.Create;

  CarregarRegistro;
end;

procedure TReacoesAdversasViewModel.CarregarRegistro;
begin
  FEntity := FReacoesAdversasRepository.RetornarUltimoRegistro;

  if not Assigned(FEntity) then
    FEntity := TReacoesAdversas.Create;

  if Assigned(FAtualizarComponentesVisuas) then
    FAtualizarComponentesVisuas;
end;

function TReacoesAdversasViewModel.GetAtualizarComponentesVisuas: TEventAtualizarComponentesVisuas;
begin
  Result := FAtualizarComponentesVisuas;
end;

function TReacoesAdversasViewModel.GetAtualizarEntidades: TEventAtualizarEntidades;
begin
  Result := FAtualizarEntidades;
end;

function TReacoesAdversasViewModel.GetCodigo: Integer;
begin
  Result := FEntity.Codigo;
end;

function TReacoesAdversasViewModel.GetDescricao: string;
begin
  Result := FEntity.Descricao;
end;

procedure TReacoesAdversasViewModel.NovoRegistro;
begin
  FEntity := TReacoesAdversas.Create;
end;

procedure TReacoesAdversasViewModel.SalvarRegistro(const ModoCrud: TModoCrud);
begin
  if Assigned(FAtualizarEntidades) then
    FAtualizarEntidades;

  if ModoCrud = TInsercao then
    FReacoesAdversasRepository.Cadastrar(FEntity)
  else
    FReacoesAdversasRepository.Atualizar(FEntity);
end;

procedure TReacoesAdversasViewModel.SetAtualizarComponentesVisuas(const Value: TEventAtualizarComponentesVisuas);
begin
  FAtualizarComponentesVisuas := Value;
end;

procedure TReacoesAdversasViewModel.SetAtualizarEntidades(const Value: TEventAtualizarEntidades);
begin
  FAtualizarEntidades := Value;
end;

procedure TReacoesAdversasViewModel.SetCodigo(const Value: Integer);
begin
  FEntity.Codigo := Value;
end;

procedure TReacoesAdversasViewModel.SetDescricao(const Value: string);
begin
  FEntity.Descricao := Value;
end;

end.
