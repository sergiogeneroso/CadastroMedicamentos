unit Avalicacao.Cadastros.ReacoesAdversas.Model.Entity.ReacoesAdversas;

interface

type

  IReacoesAdversas = interface
    ['{3B7FA634-8E88-4BEC-B025-846EBA08F1F7}']

    function GetCodigo: Integer;
    function GetNome: string;

    procedure SetCodigo(const Value: Integer);
    procedure SetNome(const Value: string);

    property Codigo: Integer read GetCodigo write SetCodigo;
    property Nome: string read GetNome write SetNome;
  end;

implementation

end.
