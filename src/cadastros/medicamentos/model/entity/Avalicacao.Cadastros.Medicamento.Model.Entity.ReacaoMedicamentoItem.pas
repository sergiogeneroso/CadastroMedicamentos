unit Avalicacao.Cadastros.Medicamento.Model.Entity.ReacaoMedicamentoItem;

interface

uses
  Avalicacao.Cadastros.ReacoesAdversas.Model.Entity.ReacoesAdversas;

type

  IReacaoMedicamentoItem = interface
    ['{C6A1228C-DA10-4363-9364-979DE7933C90}']

    function GetCodigo: Integer;
    function GetMedicamentoId: Integer;
    function GetReacaoAdversa: IReacoesAdversas;

    procedure SetCodigo(const Value: Integer);
    procedure SetMedicamentoId(const Value: Integer);
    procedure SetReacaoAdversa(const Value: IReacoesAdversas);

    property Codigo: Integer read GetCodigo write SetCodigo;
    property MedicamentoId: Integer read GetMedicamentoId write SetMedicamentoId;
    property ReacaoAdversa: IReacoesAdversas read GetReacaoAdversa write SetReacaoAdversa;
  end;

implementation

end.
