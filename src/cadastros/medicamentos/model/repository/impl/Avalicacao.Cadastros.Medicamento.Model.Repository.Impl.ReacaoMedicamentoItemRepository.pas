unit Avalicacao.Cadastros.Medicamento.Model.Repository.Impl.ReacaoMedicamentoItemRepository;

interface

uses
  System.SysUtils, System.Generics.Collections,

  Avaliacao.Conexao,
  Avaliacao.Impl.Conexao,

  Avalicacao.Cadastros.Medicamento.Model.Entity.Impl.ReacaoMedicamentoItem,

  Avalicacao.Cadastros.ReacoesAdversas.Model.Repository.ReacoesAdversasRepository,
  Avalicacao.Cadastros.ReacoesAdversas.Model.Repository.Impl.ReacoesAdversasRepository,

  Avalicacao.Cadastros.Medicamento.Model.Repository.ReacaoMedicamentoItemRepository;

type

  TReacaoMedicamentoItemRepository = class(TInterfacedObject, IReacaoMedicamentoItemRepository)
  private
    FConexao: IConexao;
    FReacoesAdversasRepository: IReacoesAdversasRepository;

    function RetornaIdsReacoesAdversas(const ReacoesMedicamentoItem: TList<TReacaoMedicamentoItem>): string;
    procedure AdicionarReacoesAdversas(const ReacoesMedicamentoItem: TList<TReacaoMedicamentoItem>);
  public
    constructor Create;

    procedure Cadastrar(const ReacoesMedicamentoItem: TList<TReacaoMedicamentoItem>);
    procedure DeletarReacoesExcluidas(const ReacoesMedicamentoItem: TList<TReacaoMedicamentoItem>);

    function RetornarReacoesDoMedicamento(const MedicamentoId: Integer): TList<TReacaoMedicamentoItem>;
  end;

implementation

{ TReacaoMedicamentoItemRepository }

constructor TReacaoMedicamentoItemRepository.Create;
begin
  FConexao := TConexao.GetInstance;
  FReacoesAdversasRepository := TReacoesAdversasRepository.Create;
end;

procedure TReacaoMedicamentoItemRepository.DeletarReacoesExcluidas(const ReacoesMedicamentoItem: TList<TReacaoMedicamentoItem>);
const
  SQL_DELETE = 'DELETE FROM REACOES_MEDICAMENTOS WHERE ID NOT IN(:ids) AND MEDICAMENTO_ID = :medicamentoId';
var
  IdReacoesAdversas: string;
begin
  IdReacoesAdversas := RetornaIdsReacoesAdversas(ReacoesMedicamentoItem);

  FConexao.Query.ExecSQL(SQL_DELETE, [IdReacoesAdversas, ReacoesMedicamentoItem.First.MedicamentoId]);
  FConexao.Conexao.Commit;
end;

function TReacaoMedicamentoItemRepository.RetornaIdsReacoesAdversas(const ReacoesMedicamentoItem: TList<TReacaoMedicamentoItem>): string;
var
  ReacaoMedicamentoItem: TReacaoMedicamentoItem;
begin
  for ReacaoMedicamentoItem in ReacoesMedicamentoItem do
    Result := Result + ', ' + ReacaoMedicamentoItem.Codigo.ToString;
end;

function TReacaoMedicamentoItemRepository.RetornarReacoesDoMedicamento(const MedicamentoId: Integer): TList<TReacaoMedicamentoItem>;
const
  SQL_SELECT = 'SELECT * FROM REACOES_MEDICAMENTOS WHERE MEDICAMENTO_ID = :medicamentoId;';
  CODIGO = 0;
  MEDICAMENTO_ID = 1;
  REACOES_ADVERSAS_ID = 2;
var
  ReacaoMedicamentoItem: TReacaoMedicamentoItem;
  ReacaoAdversaId: Integer;
begin

  FConexao.Query.Open(SQL_SELECT, [MedicamentoId]);

  if FConexao.Query.IsEmpty then
    Exit(nil);

  Result := TList<TReacaoMedicamentoItem>.Create;

  while not FConexao.Query.Eof do
  begin
    ReacaoMedicamentoItem := TReacaoMedicamentoItem.Create;

    ReacaoMedicamentoItem.Codigo := FConexao.Query.Fields[CODIGO].AsInteger;
    ReacaoMedicamentoItem.MedicamentoId := FConexao.Query.Fields[MEDICAMENTO_ID].AsInteger;
    ReacaoMedicamentoItem.ReacaoAdversaId := FConexao.Query.Fields[REACOES_ADVERSAS_ID].AsInteger;

    Result.Add(ReacaoMedicamentoItem);

    FConexao.Query.Next;
  end;

  AdicionarReacoesAdversas(Result);
end;

procedure TReacaoMedicamentoItemRepository.AdicionarReacoesAdversas(const ReacoesMedicamentoItem: TList<TReacaoMedicamentoItem>);
var
  ReacaoMedicamentoItem: TReacaoMedicamentoItem;
begin
  for ReacaoMedicamentoItem in ReacoesMedicamentoItem do
    ReacaoMedicamentoItem.ReacaoAdversa := FReacoesAdversasRepository.RetornarPorCodigo(ReacaoMedicamentoItem.ReacaoAdversaId);
end;

procedure TReacaoMedicamentoItemRepository.Cadastrar(const ReacoesMedicamentoItem: TList<TReacaoMedicamentoItem>);
const
  SQL_INSERT = 'INSERT INTO REACOES_MEDICAMENTOS (MEDICAMENTO_ID, REACOES_ADVERSAS_ID) VALUES (:medicamentoId, :reacoesAdversasId);';
var
  ReacaoMedicamento: TReacaoMedicamentoItem;
begin // Update or insert por id
  for ReacaoMedicamento in ReacoesMedicamentoItem do
    FConexao.Query.ExecSQL(SQL_INSERT, [ReacaoMedicamento.MedicamentoId, ReacaoMedicamento.ReacaoAdversa.Codigo]);

  FConexao.Conexao.Commit;
end;

end.
