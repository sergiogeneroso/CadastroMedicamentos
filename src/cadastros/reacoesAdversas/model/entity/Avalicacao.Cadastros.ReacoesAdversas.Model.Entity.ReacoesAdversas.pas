unit Avalicacao.Cadastros.ReacoesAdversas.Model.Entity.ReacoesAdversas;

interface

type

  IReacoesAdversas = interface
    ['{3B7FA634-8E88-4BEC-B025-846EBA08F1F7}']

    function GetCodigo: Integer;
    function GetDescricao: string;

    procedure SetCodigo(const Value: Integer);
    procedure SetDescricao(const Value: string);

    property Codigo: Integer read GetCodigo write SetCodigo;
    property Descricao: string read GetDescricao write SetDescricao;
  end;

implementation

end.
