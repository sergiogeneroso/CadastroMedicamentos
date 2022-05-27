unit Avalicacao.Cadastros.ReacoesAdversas.Model.Entity.Impl.ReacoesAdversas;

interface

uses

  Avalicacao.Cadastros.ReacoesAdversas.Model.Entity.ReacoesAdversas;

type
  TReacoesAdversas = class(TInterfacedObject, IReacoesAdversas)
  private
    FCodigo: Integer;
    FDescricao: string;

    function GetCodigo: Integer;
    function GetDescricao: string;

    procedure SetCodigo(const Value: Integer);
    procedure SetDescricao(const Value: string);
  public
    property Codigo: Integer read GetCodigo write SetCodigo;
    property Descricao: string read GetDescricao write SetDescricao;
  end;

implementation

{ TReacoesAdversas }

function TReacoesAdversas.GetCodigo: Integer;
begin
  Result := FCodigo;
end;

function TReacoesAdversas.GetDescricao: string;
begin
  Result := FDescricao;
end;

procedure TReacoesAdversas.SetCodigo(const Value: Integer);
begin
  FCodigo := Value;
end;

procedure TReacoesAdversas.SetDescricao(const Value: string);
begin
  FDescricao := Value;
end;

end.
