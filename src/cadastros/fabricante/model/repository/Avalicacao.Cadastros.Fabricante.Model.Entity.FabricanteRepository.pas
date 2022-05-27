unit Avalicacao.Cadastros.Fabricante.Model.Entity.FabricanteRepository;

interface

uses
  Avalicacao.Cadastros.Fabricante.Model.Entity.Fabricante;

type
  IFabricanteRepository = interface
    ['{D5034E09-5BDC-408F-A3BA-A33A1D482784}']

    procedure Cadastrar(const Fabricante: IFabricante);
    procedure Atualizar(const Fabricante: IFabricante);
    procedure Deletar(const Fabricante: IFabricante);

    function RetornarPorCodigo(const Codigo: Integer): IFabricante;
    function RetornarUltimoRegistro: IFabricante;
  end;

implementation

end.
