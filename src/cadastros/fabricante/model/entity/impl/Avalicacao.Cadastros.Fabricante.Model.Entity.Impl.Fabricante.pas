unit Avalicacao.Cadastros.Fabricante.Model.Entity.Impl.Fabricante;

interface

uses

  Avalicacao.Cadastros.Fabricante.Model.Entity.Fabricante;

type
  TFabricante = class(TInterfacedObject, IFabricante)
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

{ TFabricante }

function TFabricante.GetCodigo: Integer;
begin
  Result := FCodigo;
end;

function TFabricante.GetNome: string;
begin
  Result := FNome;
end;

procedure TFabricante.SetCodigo(const Value: Integer);
begin
  FCodigo := Value;
end;

procedure TFabricante.SetNome(const Value: string);
begin
  FNome := Value;
end;

end.
