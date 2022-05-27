unit Avalicacao.Cadastros.Medicamento.ViewModel.MedicamentoViewModel;

interface

uses
  Avaliacao.CrudBase.ModoCrud;

type
  TEventAtualizarComponentesVisuas = procedure of object;
  TEventAtualizarEntidades = procedure of object;

  IMedicamentoViewModel = interface
   ['{78615659-A35B-4016-99A3-5DF6B0E5D880}']

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
