unit Avalicacao.Cadastros.Fabricante.Model.Repository.Impl.FabricanteRepository;

interface

uses
  System.SysUtils, System.Generics.Collections,

  Avaliacao.Conexao,
  Avaliacao.Impl.Conexao,

  Avalicacao.Cadastros.Fabricante.Model.Entity.Fabricante,
  Avalicacao.Cadastros.Fabricante.Model.Entity.Impl.Fabricante,

  Avalicacao.Cadastros.Fabricante.Model.Repository.FabricanteRepository;

type

  TFabricanteRepository = class(TInterfacedObject, IFabricanteRepository)
  private
    FConexao: IConexao;
    function RetornarCodigosFabricantes: TList<Integer>;
    function RetornarPorCodigoObjectoConcreto(const Codigo: Integer): TFabricante;
  public
    constructor Create;

    procedure Cadastrar(const Fabricante: IFabricante);
    procedure Atualizar(const Fabricante: IFabricante);
    procedure Deletar(const Fabricante: IFabricante);

    function RetornarPorCodigo(const Codigo: Integer): IFabricante;
    function RetornarUltimoRegistro: IFabricante;
    function RetornarTodos: TList<TFabricante>;
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

function TFabricanteRepository.RetornarTodos: TList<TFabricante>;
var
  Fabricantes: TList<TFabricante>;
  FabricantesCodigos: TList<Integer>;
  Codigo: Integer;
begin
  Fabricantes := TList<TFabricante>.Create;
  FabricantesCodigos := RetornarCodigosFabricantes;

  for Codigo in FabricantesCodigos do
    Fabricantes.Add(RetornarPorCodigoObjectoConcreto(Codigo));

  Result := Fabricantes;
end;

function TFabricanteRepository.RetornarCodigosFabricantes: TList<Integer>;
const
  SQL_FABRICANTES_CODIGO = 'SELECT ID FROM FABRICANTES ORDER BY ID ASC';
  CODIGO = 0;
var
  FabricantesCodigos: TList<Integer>;
begin
  FabricantesCodigos := TList<Integer>.Create;

  FConexao.Query.Open(SQL_FABRICANTES_CODIGO);

  while not FConexao.Query.Eof do
  begin
    FabricantesCodigos.Add(FConexao.Query.Fields[CODIGO].AsInteger);
    FConexao.Query.Next;
  end;

  Result := FabricantesCodigos;
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

function TFabricanteRepository.RetornarPorCodigoObjectoConcreto(const Codigo: Integer): TFabricante;
const
  SQL_SELECT = 'SELECT * FROM FABRICANTES WHERE ID = :id;';
  CAMPO_CODIGO = 0;
  CAMPO_NOME = 1;
var
  Fabricante: TFabricante;
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
  SQL_INSERT = 'INSERT INTO FABRICANTES (NOME) VALUES (:nome);';
begin
  FConexao.Query.ExecSQL(SQL_INSERT, [Fabricante.Nome]);
  FConexao.Conexao.Commit;
end;

end.
