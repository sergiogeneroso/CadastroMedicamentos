unit Avaliacao.Impl.Conexao;

interface

uses
  System.SysUtils, FireDAC.Comp.Client, FireDAC.Phys.FBDef, FireDAC.Stan.Def, FireDAC.Stan.Intf, FireDAC.Phys,
  FireDAC.Phys.IBBase, FireDAC.Phys.FB, FireDAC.UI.Intf, FireDAC.VCLUI.Wait,
  FireDAC.Comp.UI,
  Avaliacao.Conexao, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Data.DB,
  FireDAC.Comp.DataSet;

type
  TConexao = class(TInterfacedObject, IConexao)
  private
    class var FInstance: TConexao;
  private
    FFDPhysFBDriverLink1: TFDPhysFBDriverLink;
    FFDGUIxWaitCursor1: TFDGUIxWaitCursor;

    FConexao: TFDConnection;
    FQuery: TFDQuery;

    function RetornaCaminhoBanco: string;

    function GetConexao: TFDConnection;
    function GetQuery: TFDQuery;

    procedure ConfigurarDadosGeraisConexao;
    procedure ConfigurarFDQuery;
  public
    constructor Create;

    class function GetInstance: TConexao;

    property Conexao: TFDConnection read GetConexao;
    property Query: TFDQuery read GetQuery;
  end;

implementation

{ TConexao }

constructor TConexao.Create;
begin
  FConexao := TFDConnection.Create(nil);
  FFDPhysFBDriverLink1 := TFDPhysFBDriverLink.Create(nil);
  FFDGUIxWaitCursor1 := TFDGUIxWaitCursor.Create(nil);

  ConfigurarDadosGeraisConexao;
  ConfigurarFDQuery;

  FInstance := Self;
end;

procedure TConexao.ConfigurarFDQuery;
begin
  FQuery := TFDQuery.Create(nil);

  FQuery.Connection := FConexao;
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

function TConexao.GetConexao: TFDConnection;
begin
  Result := FConexao;
end;

class function TConexao.GetInstance: TConexao;
begin
  if Assigned(FInstance) then
    Exit(FInstance);

  FInstance := TConexao.Create;

  Result := FInstance;
end;

function TConexao.GetQuery: TFDQuery;
begin
  Result := FQuery;
end;

end.
