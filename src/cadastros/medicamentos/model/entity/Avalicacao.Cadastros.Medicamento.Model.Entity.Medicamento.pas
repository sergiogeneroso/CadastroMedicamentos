unit Avalicacao.Cadastros.Medicamento.Model.Entity.Medicamento;

interface

uses
  System.Generics.Collections,

  Avalicacao.Cadastros.Fabricante.Model.Entity.Fabricante,
  Avalicacao.Cadastros.Medicamento.Model.Entity.Impl.ReacaoAdversaItem;

type

  IMedicamento = interface
    ['{A8237B0D-C374-403A-A649-05E2067F6FA8}']

    function GetCodigo: Integer;
    function GetFabricante: IFabricante;
    function GetNome: string;
    function GetPreco: Double;
    function GetQuantidadeComprimidos: Integer;
    function GetReacoesAdversas: TList<TReacaoAdversaItem>;
    function GetRegistroAnvisa: string;
    function GetTelefoneSac: string;
    function GetValidade: TDate;

    procedure SetCodigo(const Value: Integer);
    procedure SetFabricante(const Value: IFabricante);
    procedure SetNome(const Value: string);
    procedure SetPreco(const Value: Double);
    procedure SetQuantidadeComprimidos(const Value: Integer);
    procedure SetReacoesAdversas(const Value: TList<TReacaoAdversaItem>);
    procedure SetRegistroAnvisa(const Value: string);
    procedure SetTelefoneSac(const Value: string);
    procedure SetValidade(const Value: TDate);

    procedure AtualizarIdMedicamentoReacoesAdversas(const MedicamentoId: Integer);

    property Codigo: Integer read GetCodigo write SetCodigo;
    property Fabricante: IFabricante read GetFabricante write SetFabricante;
    property Nome: string read GetNome write SetNome;
    property Preco: Double read GetPreco write SetPreco;
    property QuantidadeComprimidos: Integer read GetQuantidadeComprimidos write SetQuantidadeComprimidos;
    property ReacoesAdversas: TList<TReacaoAdversaItem> read GetReacoesAdversas write SetReacoesAdversas;
    property RegistroAnvisa: string read GetRegistroAnvisa write SetRegistroAnvisa;
    property TelefoneSac: string read GetTelefoneSac write SetTelefoneSac;
    property Validade: TDate read GetValidade write SetValidade;
  end;

implementation

end.
