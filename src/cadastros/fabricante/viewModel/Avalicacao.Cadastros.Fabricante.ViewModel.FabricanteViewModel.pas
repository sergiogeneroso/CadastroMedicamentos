unit Avalicacao.Cadastros.Fabricante.ViewModel.FabricanteViewModel;

interface

uses
  Avaliacao.CrudBase.ModoCrud;

type
  TEventAtualizarComponentesVisuas = procedure of object;
  TEventAtualizarEntidades = procedure of object;

  IFabricanteViewModel = interface
    ['{3DBCAB0D-1D45-4962-B560-80D7DE356F2D}']

    function GetCodigo: Integer;
    function GetNome: string;
    function GetAtualizarComponentesVisuas: TEventAtualizarComponentesVisuas;
    function GetAtualizarEntidades: TEventAtualizarEntidades;

    procedure SetCodigo(const Value: Integer);
    procedure SetNome(const Value: string);
    procedure SetAtualizarComponentesVisuas(const Value: TEventAtualizarComponentesVisuas);
    procedure SetAtualizarEntidades(const Value: TEventAtualizarEntidades);

    procedure NovoRegistro;
    procedure SalvarRegistro(const ModoCrud: TModoCrud);
    procedure CarregarRegistro;

    property Codigo: Integer read GetCodigo write SetCodigo;
    property Nome: string read GetNome write SetNome;

    property AtualizarComponentesVisuas: TEventAtualizarComponentesVisuas read GetAtualizarComponentesVisuas write SetAtualizarComponentesVisuas;
    property AtualizarEntidades: TEventAtualizarEntidades read GetAtualizarEntidades write SetAtualizarEntidades;
  end;

implementation

end.
