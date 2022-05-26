unit Avalicacao.Cadastros.Fabricante.Model.Entity.Fabricante;

interface

type

  IFabricante = interface
    ['{262AEDEE-855B-4A9F-89BC-E96E7DEE66C1}']

    function GetCodigo: Integer;
    function GetNome: string;

    procedure SetCodigo(const Value: Integer);
    procedure SetNome(const Value: string);

    property Codigo: Integer read GetCodigo write SetCodigo;
    property Nome: string read GetNome write SetNome;
  end;

implementation

end.
