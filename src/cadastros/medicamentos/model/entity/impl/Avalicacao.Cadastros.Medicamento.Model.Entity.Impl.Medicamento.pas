unit Avalicacao.Cadastros.Medicamento.Model.Entity.Impl.Medicamento;

interface

uses

  Avalicacao.Cadastros.Medicamento.Model.Entity.Medicamento;

type
  TMedicamento = class(TInterfacedObject, IMedicamento)
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

{ TMedicamento }

function TMedicamento.GetCodigo: Integer;
begin
  Result := FCodigo;
end;

function TMedicamento.GetNome: string;
begin
  Result := FNome;
end;

procedure TMedicamento.SetCodigo(const Value: Integer);
begin
  FCodigo := Value;
end;

procedure TMedicamento.SetNome(const Value: string);
begin
  FNome := Value;
end;

end.
