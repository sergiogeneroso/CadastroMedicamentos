unit Avalicacao.Cadastros.Fabricante.Model.Entity.Impl.FabricanteRepository;

interface

uses
  System.SysUtils,

  Avaliacao.Conexao,
  Avaliacao.Impl.Conexao,

  Avalicacao.Cadastros.Fabricante.Model.Entity.Fabricante,
  Avalicacao.Cadastros.Fabricante.Model.Entity.Impl.Fabricante,

  Avalicacao.Cadastros.Fabricante.Model.Entity.FabricanteRepository;

type

  TFabricanteRepository = class(TInterfacedObject, IFabricanteRepository)
  private
    FConexao: IConexao;
  public
    constructor Create;

    procedure Cadastrar(const Fabricante: IFabricante);
    procedure Atualizar(const Fabricante: IFabricante);
    procedure Deletar(const Fabricante: IFabricante);

    function RetornarPorCodigo(const Codigo: Integer): IFabricante;
    function RetornarUltimoRegistro: IFabricante;
  end;

implementation

{ TFabricanteRepository }

constructor TFabricanteRepository.Create;
begin
  FConexao := TConexao.GetInstance;
end;

procedure TFabricanteRepository.Atualizar(const Fabricante: IFabricante);
const
  SQL_UPDATE = 'UPDATE FABRICANTES SET NOME = :nome WHERE ID = :id;';
begin
  FConexao.Query.ExecSQL(SQL_UPDATE, [Fabricante.Nome, Fabricante.Codigo]);
  FConexao.Conexao.Commit;
end;

procedure TFabricanteRepository.Deletar(const Fabricante: IFabricante);
const
  SQL_DELETE = 'DELETE FROM FABRICANTES WHERE ID = :id;';
begin
  FConexao.Query.ExecSQL(SQL_DELETE, [Fabricante.Codigo]);
  FConexao.Conexao.Commit;
end;

function TFabricanteRepository.RetornarPorCodigo(const Codigo: Integer): IFabricante;
const
  SQL_SELECT = 'SELECT * FROM FABRICANTES WHERE ID = :id;';
  CAMPO_CODIGO = 0;
  CAMPO_NOME = 1;
var
  Fabricante: IFabricante;
begin
  FConexao.Query.Open(SQL_SELECT, [Codigo]);

  if FConexao.Query.IsEmpty then
    raise Exception.Create('Fabricante não encontrado!');

  Fabricante := TFabricante.Create;

  Fabricante.Codigo := FConexao.Query.Fields[CAMPO_CODIGO].AsInteger;
  Fabricante.Nome := FConexao.Query.Fields[CAMPO_NOME].AsString;

  Result := Fabricante;
end;

function TFabricanteRepository.RetornarUltimoRegistro: IFabricante;
const
  NENHUM_REGISTRO = 0;
  SQL_ID_ULTIMO_REGISTRO = 'SELECT COALESCE(MAX(ID), 0) FROM FABRICANTES;';
var
  IdUltimoRegistro: Integer;
begin
  IdUltimoRegistro := FConexao.Conexao.ExecSQLScalar(SQL_ID_ULTIMO_REGISTRO);

  if IdUltimoRegistro = NENHUM_REGISTRO then
    Exit(nil);

  Result := RetornarPorCodigo(IdUltimoRegistro)
end;

procedure TFabricanteRepository.Cadastrar(const Fabricante: IFabricante);
const
  SQL_INSERT = 'INSERT INTO FABRICANTES (ID, NOME) VALUES (:id, :nome);';
begin
  FConexao.Query.ExecSQL(SQL_INSERT, [Fabricante.Codigo, Fabricante.Nome]);
  FConexao.Conexao.Commit;
end;

end.
