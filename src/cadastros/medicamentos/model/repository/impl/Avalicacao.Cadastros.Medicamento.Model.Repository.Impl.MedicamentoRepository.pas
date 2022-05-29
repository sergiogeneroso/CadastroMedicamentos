unit Avalicacao.Cadastros.Medicamento.Model.Repository.Impl.MedicamentoRepository;

interface

uses
  System.SysUtils,

  Avaliacao.Conexao,
  Avaliacao.Impl.Conexao,

  Avalicacao.Cadastros.Medicamento.Model.Entity.Medicamento,
  Avalicacao.Cadastros.Medicamento.Model.Entity.Impl.Medicamento,

  Avalicacao.Cadastros.Fabricante.Model.Entity.Fabricante,
  Avalicacao.Cadastros.Fabricante.Model.Entity.Impl.Fabricante,
  Avalicacao.Cadastros.Fabricante.Model.Repository.FabricanteRepository,
  Avalicacao.Cadastros.Fabricante.Model.Repository.Impl.FabricanteRepository,

  Avalicacao.Cadastros.Medicamento.Model.Repository.MedicamentoRepository;

type

  TMedicamentoRepository = class(TInterfacedObject, IMedicamentoRepository)
  private
    FConexao: IConexao;
    FFabricanteRepository: IFabricanteRepository;
    function FabricanteDoMedicamento(const FabricanId: Integer): IFabricante;
  public
    constructor Create;

    procedure Cadastrar(const Medicamento: IMedicamento);
    procedure Atualizar(const Medicamento: IMedicamento);
    procedure Deletar(const Medicamento: IMedicamento);

    function RetornarPorCodigo(const Codigo: Integer): IMedicamento;
    function RetornarUltimoRegistro: IMedicamento;
  end;

implementation

{ TMedicamentoRepository }

constructor TMedicamentoRepository.Create;
begin
  FConexao := TConexao.GetInstance;
  FFabricanteRepository := TFabricanteRepository.Create;
end;

procedure TMedicamentoRepository.Atualizar(const Medicamento: IMedicamento);
const
  SQL_UPDATE = 'UPDATE MEDICAMENTOS SET NOME = :nome, VALIDADE = :validade, PRECO = :preco, ' + 'QUANTIDADE_COMPRIMIDOS = :quantidade, FABRICANTE_ID = :fabricante, TELEFONE_SAC = :telefone' + ', REGISTRO_ANVISA = :registro_anvisa WHERE ID = :id;';
var
  ValidadeParaSQL: string;
begin
  ValidadeParaSQL := FormatDateTime('yyyy-mm-dd', Medicamento.Validade);

  FConexao.Query.ExecSQL(SQL_UPDATE, [Medicamento.Nome, ValidadeParaSQL, Medicamento.Preco, Medicamento.QuantidadeComprimidos,  Medicamento.Fabricante.Codigo, Medicamento.TelefoneSac, Medicamento.RegistroAnvisa, Medicamento.Codigo]);
  FConexao.Conexao.Commit;
end;

procedure TMedicamentoRepository.Deletar(const Medicamento: IMedicamento);
const
  SQL_DELETE = 'DELETE FROM MEDICAMENTOS WHERE ID = :id;';
begin
  FConexao.Query.ExecSQL(SQL_DELETE, [Medicamento.Codigo]);
  FConexao.Conexao.Commit;
end;

function TMedicamentoRepository.RetornarPorCodigo(const Codigo: Integer): IMedicamento;
const
  SQL_SELECT = 'SELECT * FROM MEDICAMENTOS WHERE ID = :id;';
  ID = 0;
  NOME = 1;
  VALIDADE = 2;
  PRECO = 3;
  QUANTIDADE = 4;
  FABRICANTE_ID = 5;
  TELEFONE = 6;
  REGISTRO_ANVISA = 7;
var
  Medicamento: IMedicamento;
  Fabricante: IFabricante;
  FabricanteId: Integer;
begin
  FConexao.Query.Open(SQL_SELECT, [Codigo]);

  if FConexao.Query.IsEmpty then
    raise Exception.Create('Medicamento não encontrado!');

  Medicamento := TMedicamento.Create;

  Medicamento.Codigo := FConexao.Query.Fields[ID].AsInteger;
  Medicamento.Nome := FConexao.Query.Fields[NOME].AsString;
  Medicamento.Validade := FConexao.Query.Fields[VALIDADE].AsDateTime;
  Medicamento.Preco := FConexao.Query.Fields[PRECO].AsFloat;
  Medicamento.QuantidadeComprimidos := FConexao.Query.Fields[QUANTIDADE].AsInteger;
  FabricanteId := FConexao.Query.Fields[FABRICANTE_ID].AsInteger;
  Medicamento.TelefoneSac := FConexao.Query.Fields[TELEFONE].AsString;
  Medicamento.RegistroAnvisa := FConexao.Query.Fields[REGISTRO_ANVISA].AsString;

  Medicamento.Fabricante := FabricanteDoMedicamento(FabricanteId);

  Result := Medicamento;
end;

function TMedicamentoRepository.FabricanteDoMedicamento(const FabricanId: Integer): IFabricante;
begin
  Result := FFabricanteRepository.RetornarPorCodigo(FabricanId);
end;

function TMedicamentoRepository.RetornarUltimoRegistro: IMedicamento;
const
  NENHUM_REGISTRO = 0;
  SQL_ID_ULTIMO_REGISTRO = 'SELECT COALESCE(MAX(ID), 0) FROM MEDICAMENTOS;';
var
  IdUltimoRegistro: Integer;
begin
  IdUltimoRegistro := FConexao.Conexao.ExecSQLScalar(SQL_ID_ULTIMO_REGISTRO);

  if IdUltimoRegistro = NENHUM_REGISTRO then
    Exit(nil);

  Result := RetornarPorCodigo(IdUltimoRegistro)
end;

procedure TMedicamentoRepository.Cadastrar(const Medicamento: IMedicamento);
const
  SQL_INSERT = 'INSERT INTO MEDICAMENTOS (NOME, VALIDADE, PRECO, QUANTIDADE_COMPRIMIDOS, FABRICANTE_ID, TELEFONE_SAC, REGISTRO_ANVISA) VALUES (:nome, :validade, :preco, :quantidade, :fabricante, :telefone, :registro_anvisa);';
var
  ValidadeParaSQL: string;
begin
  ValidadeParaSQL := FormatDateTime('yyyy-mm-dd', Medicamento.Validade);

  FConexao.Query.ExecSQL(SQL_INSERT, [Medicamento.Nome, ValidadeParaSQL, Medicamento.Preco, Medicamento.QuantidadeComprimidos,  Medicamento.Fabricante.Codigo, Medicamento.TelefoneSac, Medicamento.RegistroAnvisa]);
  FConexao.Conexao.Commit;
end;

end.
