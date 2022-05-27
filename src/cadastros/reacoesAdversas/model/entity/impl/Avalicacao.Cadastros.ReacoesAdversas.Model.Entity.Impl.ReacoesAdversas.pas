unit Avalicacao.Cadastros.ReacoesAdversas.Model.Entity.Impl.ReacoesAdversas;

interface

uses

  Avalicacao.Cadastros.ReacoesAdversas.Model.Entity.ReacoesAdversas;

type
  TReacoesAdversas = class(TInterfacedObject, IReacoesAdversas)
  private
    FCodigo: Integer;
    FNome: string;

    function GetCodigo: Integer;
    function GetNome: string;

    procedure SetCodigo(const Value: Integer);
    procedure SetNome(const Value: string);
  public
    property Codigo: Integer read GetCodigo write SetCodigo;
    property Nome: string read GetNome write SetNome;
  end;

implementation

{ TReacoesAdversas }

function TReacoesAdversas.GetCodigo: Integer;
begin
  Result := FCodigo;
end;

function TReacoesAdversas.GetNome: string;
begin
  Result := FNome;
end;

procedure TReacoesAdversas.SetCodigo(const Value: Integer);
begin
  FCodigo := Value;
end;

procedure TReacoesAdversas.SetNome(const Value: string);
begin
  FNome := Value;
end;

end.
