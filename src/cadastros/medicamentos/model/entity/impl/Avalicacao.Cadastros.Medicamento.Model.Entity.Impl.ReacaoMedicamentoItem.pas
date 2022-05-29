unit Avalicacao.Cadastros.Medicamento.Model.Entity.Impl.ReacaoMedicamentoItem;

interface

uses

  Avalicacao.Cadastros.ReacoesAdversas.Model.Entity.ReacoesAdversas,
  Avalicacao.Cadastros.Medicamento.Model.Entity.ReacaoMedicamentoItem;

type
  TReacaoMedicamentoItem = class(TInterfacedObject, IReacaoMedicamentoItem)
  private
    FCodigo: Integer;
    FMedicamentoId: Integer;
    FReacaoAdversa: IReacoesAdversas;

    function GetCodigo: Integer;
    function GetMedicamentoId: Integer;
    function GetReacaoAdversa: IReacoesAdversas;

    procedure SetCodigo(const Value: Integer);
    procedure SetMedicamentoId(const Value: Integer);
    procedure SetReacaoAdversa(const Value: IReacoesAdversas);
  public
    property Codigo: Integer read GetCodigo write SetCodigo;
    property MedicamentoId: Integer read GetMedicamentoId write SetMedicamentoId;
    property ReacaoAdversa: IReacoesAdversas read GetReacaoAdversa write SetReacaoAdversa;
  end;

implementation

{ TReacaoMedicamentoItem }

function TReacaoMedicamentoItem.GetCodigo: Integer;
begin
  Result := FCodigo;
end;

function TReacaoMedicamentoItem.GetMedicamentoId: Integer;
begin
  Result := FMedicamentoId;
end;

function TReacaoMedicamentoItem.GetReacaoAdversa: IReacoesAdversas;
begin
  Result := FReacaoAdversa;
end;

procedure TReacaoMedicamentoItem.SetCodigo(const Value: Integer);
begin
  FCodigo := Value;
end;

procedure TReacaoMedicamentoItem.SetMedicamentoId(const Value: Integer);
begin
  FMedicamentoId := Value;
end;

procedure TReacaoMedicamentoItem.SetReacaoAdversa(const Value: IReacoesAdversas);
begin
  FReacaoAdversa := Value;
end;

end.
