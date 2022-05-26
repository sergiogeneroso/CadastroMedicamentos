unit Avaliacao.Impl.Conexao;

interface

uses
  System.SysUtils, FireDAC.Comp.Client, FireDAC.Phys.FBDef, FireDAC.Stan.Def, FireDAC.Stan.Intf, FireDAC.Phys,
  FireDAC.Phys.IBBase, FireDAC.Phys.FB, FireDAC.UI.Intf, FireDAC.VCLUI.Wait,
  FireDAC.Comp.UI,
  Avaliacao.Conexao;

type
  TConexao = class(TInterfacedObject, IConexao)
  private
    FFDPhysFBDriverLink1: TFDPhysFBDriverLink;
    FFDGUIxWaitCursor1: TFDGUIxWaitCursor;

    FConexao: TFDConnection;

    function RetornaCaminhoBanco: string;

    function GetConexao: TFDConnection;

    procedure ConfigurarDadosGeraisConexao;
  public
    constructor Create;
    destructor Destroy;

    property RetornaConexao: TFDConnection read GetConexao;
  end;

implementation

{ TConexao }

constructor TConexao.Create;
begin
  FConexao := TFDConnection.Create(nil);
  FFDPhysFBDriverLink1 := TFDPhysFBDriverLink.Create(nil);
  FFDGUIxWaitCursor1 := TFDGUIxWaitCursor.Create(nil);

  ConfigurarDadosGeraisConexao;
end;

procedure TConexao.ConfigurarDadosGeraisConexao;
const
  CONNECTION_NAME = 'FBConnection';
  DRIVER_NAME = 'FB';
  DATABASE_USER_NAME = 'SYSDBA';
  DATABASE_PASSWORD = 'masterkey';
begin
  FConexao.ConnectionName := CONNECTION_NAME;
  FConexao.Params.DriverID := DRIVER_NAME;
  FConexao.Params.UserName := DATABASE_USER_NAME;
  FConexao.Params.Password := DATABASE_PASSWORD;
  FConexao.Params.DataBase := RetornaCaminhoBanco;
  FConexao.LoginPrompt := False;

  FConexao.Connected := True;
end;

function TConexao.RetornaCaminhoBanco: string;
const
  CAMINHO_RELATIVO_BANCO = '\assets\BANCO_AVALIACAO.FDB';
begin
  Result := GetCurrentDir + CAMINHO_RELATIVO_BANCO;
end;

destructor TConexao.Destroy;
begin

end;

function TConexao.GetConexao: TFDConnection;
begin
  Result := FConexao;
end;

end.
