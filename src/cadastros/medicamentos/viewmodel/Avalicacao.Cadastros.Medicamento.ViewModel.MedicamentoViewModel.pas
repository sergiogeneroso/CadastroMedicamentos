unit Avalicacao.Cadastros.Medicamento.ViewModel.MedicamentoViewModel;

interface

uses
  System.Generics.Collections,

  Avaliacao.CrudBase.ModoCrud,

  Avalicacao.Cadastros.Fabricante.Model.Entity.Fabricante,

  Avalicacao.Cadastros.ReacoesAdversas.Model.Entity.Impl.ReacoesAdversas;

type
  TEventAtualizarComponentesVisuas = procedure of object;
  TEventAtualizarEntidades = procedure of object;

  IMedicamentoViewModel = interface
    ['{78615659-A35B-4016-99A3-5DF6B0E5D880}']

    function GetCodigo: Integer;
    function GetNome: string;
    function GetFabricante: IFabricante;
    function GetPreco: Double;
    function GetQuantidadeComprimidos: Integer;
    function GetReacoesAdversas: TList<TReacoesAdversas>;
    function GetRegistroAnvisa: string;
    function GetTelefoneSac: string;
    function GetValidade: TDate;
    function GetAtualizarComponentesVisuas: TEventAtualizarComponentesVisuas;
    function GetAtualizarEntidades: TEventAtualizarEntidades;

    procedure SetCodigo(const Value: Integer);
    procedure SetNome(const Value: string);
    procedure SetAtualizarComponentesVisuas(const Value: TEventAtualizarComponentesVisuas);
    procedure SetAtualizarEntidades(const Value: TEventAtualizarEntidades);
    procedure SetFabricante(const Value: IFabricante);
    procedure SetPreco(const Value: Double);
    procedure SetQuantidadeComprimidos(const Value: Integer);
    procedure SetReacoesAdversas(const Value: TList<TReacoesAdversas>);
    procedure SetRegistroAnvisa(const Value: string);
    procedure SetTelefoneSac(const Value: string);
    procedure SetValidade(const Value: TDate);

    procedure NovoRegistro;
    procedure SalvarRegistro(const ModoCrud: TModoCrud);
    procedure CarregarRegistro;

    property Codigo: Integer read GetCodigo write SetCodigo;
    property Fabricante: IFabricante read GetFabricante write SetFabricante;
    property Nome: string read GetNome write SetNome;
    property Preco: Double read GetPreco write SetPreco;
    property QuantidadeComprimidos: Integer read GetQuantidadeComprimidos write SetQuantidadeComprimidos;
    property ReacoesAdversas: TList<TReacoesAdversas> read GetReacoesAdversas write SetReacoesAdversas;
    property RegistroAnvisa: string read GetRegistroAnvisa write SetRegistroAnvisa;
    property TelefoneSac: string read GetTelefoneSac write SetTelefoneSac;
    property Validade: TDate read GetValidade write SetValidade;

    property AtualizarComponentesVisuas: TEventAtualizarComponentesVisuas read GetAtualizarComponentesVisuas write SetAtualizarComponentesVisuas;
    property AtualizarEntidades: TEventAtualizarEntidades read GetAtualizarEntidades write SetAtualizarEntidades;
  end;

implementation

end.