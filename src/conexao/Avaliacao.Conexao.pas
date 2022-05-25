unit Avaliacao.Conexao;

interface

uses
  Data.SqlExpr;

type

  IConexao = interface
    ['{049CFF04-84D2-4F54-AAF1-B33C14C7F958}']

    function GetConexao: TSQLConnection;

    property RetornaConexao: TSQLConnection read GetConexao;
  end;

implementation

end.
