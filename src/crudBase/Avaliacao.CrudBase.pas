unit Avaliacao.CrudBase;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.ComCtrls, Vcl.Mask, Datasnap.DBClient,

  Avaliacao.CrudBase.ModoCrud;

type

  TFRMCrudBase = class abstract(TForm)
    PNFooter: TPanel;
    BTNNovo: TButton;
    BTNAlterar: TButton;
    BTNSalvar: TButton;
    BTNCancelar: TButton;
    BTNPrimeiro: TButton;
    BTNAnterior: TButton;
    BTNProximo: TButton;
    BTNUltimo: TButton;
    procedure BTNAlterarClick(Sender: TObject);
    procedure BTNCancelarClick(Sender: TObject);
    procedure BTNNovoClick(Sender: TObject);
    procedure BTNSalvarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    FModoCrudAtual: TModoCrud;

    function GetModoCrudAtual: TModoCrud;
    procedure SetModoCrudAtual(const Value: TModoCrud);

    procedure ConfigurarComponentes;
    procedure ConfigurarBotoesCrud;
    procedure HabilitarDesabilitarComponentes(const Value: Boolean);

    procedure LimparCamposDaTela;

  protected

    procedure NovoRegistro; virtual; abstract;
    procedure SalvarRegistro; virtual; abstract;
    procedure CarregarRegistro; virtual; abstract;

    procedure LimparDataSet; virtual;

    property ModoCrudAtual: TModoCrud read GetModoCrudAtual write SetModoCrudAtual;

  end;

var
  FRMCrudBase: TFRMCrudBase;

implementation

{$R *.dfm}
{ TFRMCrudBase }

function TFRMCrudBase.GetModoCrudAtual: TModoCrud;
begin
  Result := FModoCrudAtual;
end;

procedure TFRMCrudBase.BTNAlterarClick(Sender: TObject);
begin
  SetModoCrudAtual(TAlteracao);

  ConfigurarComponentes;
end;

procedure TFRMCrudBase.BTNCancelarClick(Sender: TObject);
begin
  CarregarRegistro;
  SetModoCrudAtual(TPadrao);

  ConfigurarComponentes;
end;

procedure TFRMCrudBase.BTNNovoClick(Sender: TObject);
begin
  SetModoCrudAtual(TInsercao);

  ConfigurarComponentes;

  LimparCamposDaTela;

  NovoRegistro;
end;

procedure TFRMCrudBase.BTNSalvarClick(Sender: TObject);
begin
  SalvarRegistro;
  CarregarRegistro;

  SetModoCrudAtual(TPadrao);

  ConfigurarComponentes;
end;

procedure TFRMCrudBase.ConfigurarComponentes;
var
  HabilitarComponentes: Boolean;
begin
  ConfigurarBotoesCrud;

  HabilitarComponentes := (FModoCrudAtual <> TPadrao);

  HabilitarDesabilitarComponentes(HabilitarComponentes);
end;

procedure TFRMCrudBase.ConfigurarBotoesCrud;
begin
  BTNNovo.Enabled := (FModoCrudAtual = TPadrao);
  BTNAlterar.Enabled := (FModoCrudAtual = TPadrao);
  BTNPrimeiro.Enabled := (FModoCrudAtual = TPadrao);
  BTNAnterior.Enabled := (FModoCrudAtual = TPadrao);
  BTNProximo.Enabled := (FModoCrudAtual = TPadrao);
  BTNUltimo.Enabled := (FModoCrudAtual = TPadrao);

  BTNSalvar.Enabled := (FModoCrudAtual <> TPadrao);
  BTNCancelar.Enabled := (FModoCrudAtual <> TPadrao);
end;

procedure TFRMCrudBase.FormShow(Sender: TObject);
begin
  ConfigurarComponentes;
  CarregarRegistro;
end;

procedure TFRMCrudBase.HabilitarDesabilitarComponentes(const Value: Boolean);
var
  Component: TComponent;
begin
  for var I := 0 to Self.ComponentCount - 1 do
  begin

    Component := Self.Components[I];

    if Component is TTabSheet then
      TTabSheet(Component).Enabled := Value;

  end;
end;

procedure TFRMCrudBase.LimparCamposDaTela;
const
  VALOR_VAZIO = -1;
var
  Component: TComponent;
begin

  for var I := 0 to Self.ComponentCount - 1 do
  begin
    Component := Self.Components[I];

    if Component is TEdit then
      TEdit(Component).Text := EmptyStr;

    if Component is TMaskEdit then
      TMaskEdit(Component).Text := EmptyStr;

    if (Component is TComboBox) then
      TCustomComboBox(Component).ItemIndex := VALOR_VAZIO;

  end;

  LimparDataSet;
end;

procedure TFRMCrudBase.LimparDataSet;
begin
  // Implementar na classe base;
end;

procedure TFRMCrudBase.SetModoCrudAtual(const Value: TModoCrud);
begin
  FModoCrudAtual := Value;
end;

end.
