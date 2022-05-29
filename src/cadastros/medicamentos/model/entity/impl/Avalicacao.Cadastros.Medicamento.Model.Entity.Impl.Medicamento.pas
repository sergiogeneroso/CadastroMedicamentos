unit Avalicacao.Cadastros.Medicamento.Model.Entity.Impl.Medicamento;

interface

uses
  System.Generics.Collections,

  Avalicacao.Cadastros.Fabricante.Model.Entity.Fabricante,
  Avalicacao.Cadastros.Medicamento.Model.Entity.Medicamento,
  Avalicacao.Cadastros.Medicamento.Model.Entity.Impl.ReacaoAdversaItem;

type
  TMedicamento = class(TInterfacedObject, IMedicamento)
  private
    FCodigo: Integer;
    FNome: string;
    FFabricante: IFabricante;
    FPreco: Double;
    FQuantidadeComprimidos: Integer;
    FReacoesAdversas: TList<TReacaoAdversaItem>;
    FRegistroAnvisa: string;
    FTelefoneSac: string;
    FValidade: TDate;

    function GetCodigo: Integer;
    function GetFabricante: IFabricante;
    function GetNome: string;
    function GetPreco: Double;
    function GetQuantidadeComprimidos: Integer;
    function GetReacoesAdversas: TList<TReacaoAdversaItem>;
    function GetRegistroAnvisa: string;
    function GetTelefoneSac: string;
    function GetValidade: TDate;

    procedure SetCodigo(const Value: Integer);
    procedure SetFabricante(const Value: IFabricante);
    procedure SetNome(const Value: string);
    procedure SetPreco(const Value: Double);
    procedure SetQuantidadeComprimidos(const Value: Integer);
    procedure SetReacoesAdversas(const Value: TList<TReacaoAdversaItem>);
    procedure SetRegistroAnvisa(const Value: string);
    procedure SetTelefoneSac(const Value: string);
    procedure SetValidade(const Value: TDate);
  public
    constructor Create;

    procedure AtualizarIdMedicamentoReacoesAdversas(const MedicamentoId: Integer);

    property Codigo: Integer read GetCodigo write SetCodigo;
    property Fabricante: IFabricante read GetFabricante write SetFabricante;
    property Nome: string read GetNome write SetNome;
    property Preco: Double read GetPreco write SetPreco;
    property QuantidadeComprimidos: Integer read GetQuantidadeComprimidos write SetQuantidadeComprimidos;
    property ReacoesAdversas: TList<TReacaoAdversaItem> read GetReacoesAdversas write SetReacoesAdversas;
    property RegistroAnvisa: string read GetRegistroAnvisa write SetRegistroAnvisa;
    property TelefoneSac: string read GetTelefoneSac write SetTelefoneSac;
    property Validade: TDate read GetValidade write SetValidade;
  end;

implementation

{ TMedicamento }

procedure TMedicamento.AtualizarIdMedicamentoReacoesAdversas(const MedicamentoId: Integer);
var
  ReacaoAdversaItem: TReacaoAdversaItem;
begin
  for ReacaoAdversaItem in FReacoesAdversas do
    ReacaoAdversaItem.MedicamentoId := MedicamentoId;
end;

constructor TMedicamento.Create;
begin
  FReacoesAdversas := TList<TReacaoAdversaItem>.Create;
end;

function TMedicamento.GetCodigo: Integer;
begin
  Result := FCodigo;
end;

function TMedicamento.GetFabricante: IFabricante;
begin
  Result := FFabricante;
end;

function TMedicamento.GetNome: string;
begin
  Result := FNome;
end;

function TMedicamento.GetPreco: Double;
begin
  Result := FPreco;
end;

function TMedicamento.GetQuantidadeComprimidos: Integer;
begin
  Result := FQuantidadeComprimidos;
end;

function TMedicamento.GetReacoesAdversas: TList<TReacaoAdversaItem>;
begin
  Result := FReacoesAdversas;
end;

function TMedicamento.GetRegistroAnvisa: string;
begin
  Result := FRegistroAnvisa;
end;

function TMedicamento.GetTelefoneSac: string;
begin
  Result := FTelefoneSac;
end;

function TMedicamento.GetValidade: TDate;
begin
  Result := FValidade;
end;

procedure TMedicamento.SetCodigo(const Value: Integer);
begin
  FCodigo := Value;
end;

procedure TMedicamento.SetFabricante(const Value: IFabricante);
begin
  FFabricante := Value;
end;

procedure TMedicamento.SetNome(const Value: string);
begin
  FNome := Value;
end;

procedure TMedicamento.SetPreco(const Value: Double);
begin
  FPreco := Value;
end;

procedure TMedicamento.SetQuantidadeComprimidos(const Value: Integer);
begin
  FQuantidadeComprimidos := Value;
end;

procedure TMedicamento.SetReacoesAdversas(const Value: TList<TReacaoAdversaItem>);
begin
  FReacoesAdversas := Value;
end;

procedure TMedicamento.SetRegistroAnvisa(const Value: string);
begin
  FRegistroAnvisa := Value;
end;

procedure TMedicamento.SetTelefoneSac(const Value: string);
begin
  FTelefoneSac := Value;
end;

procedure TMedicamento.SetValidade(const Value: TDate);
begin
  FValidade := Value;
end;

end.
