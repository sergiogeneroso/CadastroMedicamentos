unit Avalicacao.Cadastros.ReacoesAdversas.Model.Entity.Impl.ReacoesAdversasRepository;

interface

uses
  System.SysUtils,

  Avaliacao.Conexao,
  Avaliacao.Impl.Conexao,

  Avalicacao.Cadastros.ReacoesAdversas.Model.Entity.ReacoesAdversas,
  Avalicacao.Cadastros.ReacoesAdversas.Model.Entity.Impl.ReacoesAdversas,

  Avalicacao.Cadastros.ReacoesAdversas.Model.Entity.ReacoesAdversasRepository;

type

  TReacoesAdversasRepository = class(TInterfacedObject, IReacoesAdversasRepository)
  private
    FConexao: IConexao;
  public
    constructor Create;

    procedure Cadastrar(const ReacoesAdversas: IReacoesAdversas);
    procedure Atualizar(const ReacoesAdversas: IReacoesAdversas);
    procedure Deletar(const ReacoesAdversas: IReacoesAdversas);

    function RetornarPorCodigo(const Codigo: Integer): IReacoesAdversas;
    function RetornarUltimoRegistro: IReacoesAdversas;
  end;

implementation

{ TReacoesAdversasRepository }

constructor TReacoesAdversasRepository.Create;
begin
  FConexao := TConexao.GetInstance;
end;

procedure TReacoesAdversasRepository.Atualizar(const ReacoesAdversas: IReacoesAdversas);
const
  SQL_UPDATE = 'UPDATE REACOES_ADVERSAS SET NOME = :nome WHERE ID = :id;';
begin
  FConexao.Query.ExecSQL(SQL_UPDATE, [ReacoesAdversas.Nome, ReacoesAdversas.Codigo]);
  FConexao.Conexao.Commit;
end;

procedure TReacoesAdversasRepository.Deletar(const ReacoesAdversas: IReacoesAdversas);
const
  SQL_DELETE = 'DELETE FROM REACOES_ADVERSAS WHERE ID = :id;';
begin
  FConexao.Query.ExecSQL(SQL_DELETE, [ReacoesAdversas.Codigo]);
  FConexao.Conexao.Commit;
end;

function TReacoesAdversasRepository.RetornarPorCodigo(const Codigo: Integer): IReacoesAdversas;
const
  SQL_SELECT = 'SELECT * FROM REACOES_ADVERSAS WHERE ID = :id;';
  CAMPO_CODIGO = 0;
  CAMPO_NOME = 1;
var
  ReacoesAdversas: IReacoesAdversas;
begin
  FConexao.Query.Open(SQL_SELECT, [Codigo]);

  if FConexao.Query.IsEmpty then
    raise Exception.Create('Reação adversa não encontrada!');

  ReacoesAdversas := TReacoesAdversas.Create;

  ReacoesAdversas.Codigo := FConexao.Query.Fields[CAMPO_CODIGO].AsInteger;
  ReacoesAdversas.Nome := FConexao.Query.Fields[CAMPO_NOME].AsString;

  Result := ReacoesAdversas;
end;

function TReacoesAdversasRepository.RetornarUltimoRegistro: IReacoesAdversas;
const
  NENHUM_REGISTRO = 0;
  SQL_ID_ULTIMO_REGISTRO = 'SELECT COALESCE(MAX(ID), 0) FROM REACOES_ADVERSAS;';
var
  IdUltimoRegistro: Integer;
begin
  IdUltimoRegistro := FConexao.Conexao.ExecSQLScalar(SQL_ID_ULTIMO_REGISTRO);

  if IdUltimoRegistro = NENHUM_REGISTRO then
    Exit(nil);

  Result := RetornarPorCodigo(IdUltimoRegistro)
end;

procedure TReacoesAdversasRepository.Cadastrar(const ReacoesAdversas: IReacoesAdversas);
const
  SQL_INSERT = 'INSERT INTO REACOES_ADVERSAS (ID, NOME) VALUES (:id, :nome);';
begin
  FConexao.Query.ExecSQL(SQL_INSERT, [ReacoesAdversas.Codigo, ReacoesAdversas.Nome]);
  FConexao.Conexao.Commit;
end;

end.
