unit Avaliacao.Impl.Conexao;

interface

uses
  Vcl.Forms, Data.SqlExpr, System.SysUtils,
  Avaliacao.Conexao;

type
  TConexao = class(TInterfacedObject, IConexao)
  private
    FConexao: TSQLConnection;

    function GetConexao: TSQLConnection;
    procedure ConfigurarDadosGeraisConexao;
    procedure ConfigurarAcessoAoBancoDeDados;
    function RetornaCaminhoBanco: string;
  public
    constructor Create;
    destructor Destroy;
  end;

implementation

{ TConexao }

constructor TConexao.Create;
begin
  FConexao := TSQLConnection.Create(Application);

  ConfigurarDadosGeraisConexao;

  ConfigurarAcessoAoBancoDeDados;

end;

procedure TConexao.ConfigurarDadosGeraisConexao;
const
  CONNECTION_NAME = 'FBConnection';
  DRIVER_NAME = 'Firebird';
  LIBRARY_NAME = 'dbxfb.dll';
  VENDOR_LIB = 'fbclient.dll';
  DRIVER_FUNC = 'getSQLDriverINTERBASE';
begin
  FConexao := TSQLConnection.Create(Application);

  FConexao.ConnectionName := CONNECTION_NAME;
  FConexao.DriverName := DRIVER_NAME;
  FConexao.LibraryName := LIBRARY_NAME;
  FConexao.VendorLib := VENDOR_LIB;
  FConexao.GetDriverFunc := DRIVER_FUNC;
  FConexao.LoginPrompt := False;
end;

procedure TConexao.ConfigurarAcessoAoBancoDeDados;
const
  LOGIN_DATABASE = 'SYSDBA';
  PASSWORD_DATA_BASE = 'masterkey';
  MENSAGEM_FALHA_CONEXAO_BANCO = 'Falha ao conectar no banco de dados!';
begin
  try
    FConexao.Connected := False;

    FConexao.Params.Values['DataBase'] := RetornaCaminhoBanco;
    FConexao.Params.Values['User_Name'] := LOGIN_DATABASE;
    FConexao.Params.Values['Password'] := PASSWORD_DATA_BASE;

    FConexao.Connected := True;
  except
    raise Exception.Create(MENSAGEM_FALHA_CONEXAO_BANCO);
  end;

end;

function TConexao.RetornaCaminhoBanco: string;
const
  CAMINHO_RELATIVO_BANCO = 'assets\BANCO_AVALIACAO.FDB';
begin
  Result := GetCurrentDir + CAMINHO_RELATIVO_BANCO;
end;

destructor TConexao.Destroy;
begin

end;

function TConexao.GetConexao: TSQLConnection;
begin

end;

end.
