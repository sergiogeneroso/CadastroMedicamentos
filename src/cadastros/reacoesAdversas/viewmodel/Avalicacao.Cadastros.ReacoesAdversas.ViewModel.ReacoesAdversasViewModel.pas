unit Avalicacao.Cadastros.ReacoesAdversas.ViewModel.ReacoesAdversasViewModel;

interface

uses
  Avaliacao.CrudBase.ModoCrud;

type
  TEventAtualizarComponentesVisuas = procedure of object;
  TEventAtualizarEntidades = procedure of object;

  IReacoesAdversasViewModel = interface
    ['{3DBCAB0D-1D45-4962-B560-80D7DE356F2D}']

    function GetCodigo: Integer;
    function GetDescricao: string;
    function GetAtualizarComponentesVisuas: TEventAtualizarComponentesVisuas;
    function GetAtualizarEntidades: TEventAtualizarEntidades;

    procedure SetCodigo(const Value: Integer);
    procedure SetDescricao(const Value: string);
    procedure SetAtualizarComponentesVisuas(const Value: TEventAtualizarComponentesVisuas);
    procedure SetAtualizarEntidades(const Value: TEventAtualizarEntidades);

    procedure NovoRegistro;
    procedure SalvarRegistro(const ModoCrud: TModoCrud);
    procedure CarregarRegistro;

    property Codigo: Integer read GetCodigo write SetCodigo;
    property Descricao: string read GetDescricao write SetDescricao;

    property AtualizarComponentesVisuas: TEventAtualizarComponentesVisuas read GetAtualizarComponentesVisuas write SetAtualizarComponentesVisuas;
    property AtualizarEntidades: TEventAtualizarEntidades read GetAtualizarEntidades write SetAtualizarEntidades;
  end;

implementation

end.
