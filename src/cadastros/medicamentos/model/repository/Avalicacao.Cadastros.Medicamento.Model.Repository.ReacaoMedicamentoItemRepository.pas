unit Avalicacao.Cadastros.Medicamento.Model.Repository.ReacaoMedicamentoItemRepository;

interface

uses
  System.Generics.Collections,
  Avalicacao.Cadastros.Medicamento.Model.Entity.Impl.ReacaoMedicamentoItem;

type
  IReacaoMedicamentoItemRepository = interface
    ['{575E4A4A-0554-407E-B654-48440A9714CF}']

    procedure Cadastrar(const ReacoesMedicamentoItem: TList<TReacaoMedicamentoItem>);
    procedure DeletarReacoesExcluidas(const ReacoesMedicamentoItem: TList<TReacaoMedicamentoItem>);

    function RetornarReacoesDoMedicamento(const MedicamentoId: Integer): TList<TReacaoMedicamentoItem>;
  end;

implementation

end.
