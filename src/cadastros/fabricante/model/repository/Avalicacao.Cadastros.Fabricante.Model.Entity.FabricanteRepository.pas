unit Avalicacao.Cadastros.Fabricante.Model.Entity.FabricanteRepository;

interface

uses
  System.Generics.Collections,

  Avalicacao.Cadastros.Fabricante.Model.Entity.Fabricante,
  Avalicacao.Cadastros.Fabricante.Model.Entity.Impl.Fabricante;

type
  IFabricanteRepository = interface
    ['{D5034E09-5BDC-408F-A3BA-A33A1D482784}']

    procedure Cadastrar(const Fabricante: IFabricante);
    procedure Atualizar(const Fabricante: IFabricante);
    procedure Deletar(const Fabricante: IFabricante);

    function RetornarPorCodigo(const Codigo: Integer): IFabricante;
    function RetornarUltimoRegistro: IFabricante;
    function RetornarTodos: TList<TFabricante>;
  end;

implementation

end.
