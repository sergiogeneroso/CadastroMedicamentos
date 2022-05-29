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

    procedure DeletarReacoesExcluidas(const ReacoesMedicamentoItem: TList<TReacaoMedicamentoItem>);
  public
    constructor Create;

    procedure CadastrarOuAtualizar(const ReacoesMedicamentoItem: TList<TReacaoMedicamentoItem>);

    function RetornarReacoesDoMedicamento(const MedicamentoId: Integer): TList<TReacaoMedicamentoItem>;
  end;

implementation

{ TReacaoMedicamentoItemRepository }

constructor TReacaoMedicamentoItemRepository.Create;
begin
  FConexao := TConexao.GetInstance;
  FReacoesAdversasRepository := TReacoesAdversasRepository.Create;
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

procedure TReacaoMedicamentoItemRepository.CadastrarOuAtualizar(const ReacoesMedicamentoItem: TList<TReacaoMedicamentoItem>);
const
  SQL_INSERT = 'INSERT INTO REACOES_MEDICAMENTOS (MEDICAMENTO_ID, REACOES_ADVERSAS_ID) VALUES (:medicamentoId, :reacoesAdversasId) RETURNING (ID);';
  SQL_UPDATE = 'UPDATE REACOES_MEDICAMENTOS SET MEDICAMENTO_ID = :medicamentoId,  REACOES_ADVERSAS_ID = :reacoesAdversasId WHERE ID = :id;';
  CODIGO = 0;
var
  ReacaoMedicamento: TReacaoMedicamentoItem;
begin
  for ReacaoMedicamento in ReacoesMedicamentoItem do
  begin
    if ReacaoMedicamento.Codigo = 0 then
    begin
      FConexao.Query.Open(SQL_INSERT, [ReacaoMedicamento.MedicamentoId, ReacaoMedicamento.ReacaoAdversa.Codigo]);
      ReacaoMedicamento.Codigo := FConexao.Query.Fields[CODIGO].AsInteger;
    end
    else
      FConexao.Query.ExecSQL(SQL_UPDATE, [ReacaoMedicamento.MedicamentoId, ReacaoMedicamento.ReacaoAdversa.Codigo, ReacaoMedicamento.Codigo]);
  end;

  FConexao.Conexao.Commit;

  DeletarReacoesExcluidas(ReacoesMedicamentoItem);
end;

procedure TReacaoMedicamentoItemRepository.DeletarReacoesExcluidas(const ReacoesMedicamentoItem: TList<TReacaoMedicamentoItem>);
const
  SQL_DELETE = 'DELETE FROM REACOES_MEDICAMENTOS WHERE ID NOT IN(%s) AND MEDICAMENTO_ID = :medicamentoId';
var
  IdReacoesAdversas, Script: string;
begin
  IdReacoesAdversas := RetornaIdsReacoesAdversas(ReacoesMedicamentoItem);

  Script := Format(SQL_DELETE, [IdReacoesAdversas]);

  FConexao.Query.ExecSQL(Script, [ReacoesMedicamentoItem.First.MedicamentoId]);
  FConexao.Conexao.Commit;
end;

function TReacaoMedicamentoItemRepository.RetornaIdsReacoesAdversas(const ReacoesMedicamentoItem: TList<TReacaoMedicamentoItem>): string;
var
  ReacaoMedicamentoItem: TReacaoMedicamentoItem;
begin
  for ReacaoMedicamentoItem in ReacoesMedicamentoItem do
    Result := ReacaoMedicamentoItem.Codigo.ToString + ', ' + Result;

  Result := Result.Remove(Result.Length - 2);
end;

end.
