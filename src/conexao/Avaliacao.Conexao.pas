unit Avaliacao.Conexao;

interface

uses
  FireDAC.Comp.Client;

type

  IConexao = interface
    ['{049CFF04-84D2-4F54-AAF1-B33C14C7F958}']

    function GetConexao: TFDConnection;

    property RetornaConexao: TFDConnection read GetConexao;
  end;

implementation

end.
