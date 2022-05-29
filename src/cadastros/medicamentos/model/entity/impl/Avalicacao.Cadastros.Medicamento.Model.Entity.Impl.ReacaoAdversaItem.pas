unit Avalicacao.Cadastros.Medicamento.Model.Entity.Impl.ReacaoAdversaItem;

interface

uses

  Avalicacao.Cadastros.ReacoesAdversas.Model.Entity.ReacoesAdversas,
  Avalicacao.Cadastros.Medicamento.Model.Entity.ReacaoAdversaItem;

type
  TReacaoAdversaItem = class(TInterfacedObject, IReacaoAdversaItem)
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

{ TReacaoAdversaItem }

function TReacaoAdversaItem.GetCodigo: Integer;
begin
  Result := FCodigo;
end;

function TReacaoAdversaItem.GetMedicamentoId: Integer;
begin
  Result := FMedicamentoId;
end;

function TReacaoAdversaItem.GetReacaoAdversa: IReacoesAdversas;
begin
  Result := FReacaoAdversa;
end;

procedure TReacaoAdversaItem.SetCodigo(const Value: Integer);
begin
  FCodigo := Value;
end;

procedure TReacaoAdversaItem.SetMedicamentoId(const Value: Integer);
begin
  FMedicamentoId := Value;
end;

procedure TReacaoAdversaItem.SetReacaoAdversa(const Value: IReacoesAdversas);
begin
  FReacaoAdversa := Value;
end;

end.
