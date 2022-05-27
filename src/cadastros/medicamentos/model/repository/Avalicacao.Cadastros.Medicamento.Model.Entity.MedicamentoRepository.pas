unit Avalicacao.Cadastros.Medicamento.Model.Entity.MedicamentoRepository;

interface

uses
  Avalicacao.Cadastros.Medicamento.Model.Entity.Medicamento;

type
  IMedicamentoRepository = interface
    ['{7221A85D-FD00-411A-B5EB-BE9FA9DBCE5B}']

    procedure Cadastrar(const Fabricante: IMedicamento);
    procedure Atualizar(const Fabricante: IMedicamento);
    procedure Deletar(const Fabricante: IMedicamento);

    function RetornarPorCodigo(const Codigo: Integer): IMedicamento;
    function RetornarUltimoRegistro: IMedicamento;
  end;

implementation

end.
