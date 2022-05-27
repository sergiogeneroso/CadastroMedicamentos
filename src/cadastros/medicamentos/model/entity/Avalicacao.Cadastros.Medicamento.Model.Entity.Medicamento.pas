unit Avalicacao.Cadastros.Medicamento.Model.Entity.Medicamento;

interface

type

  IMedicamento = interface
    ['{A8237B0D-C374-403A-A649-05E2067F6FA8}']

    function GetCodigo: Integer;
    function GetNome: string;

    procedure SetCodigo(const Value: Integer);
    procedure SetNome(const Value: string);

    property Codigo: Integer read GetCodigo write SetCodigo;
    property Nome: string read GetNome write SetNome;
  end;

implementation

end.
