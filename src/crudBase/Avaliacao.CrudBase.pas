unit Avaliacao.CrudBase;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.ComCtrls;

type

  TModoCrud = (Padrao, Insercao, Alteracao);

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

    procedure FormCreate(Sender: TObject);
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

    property ModoCrudAtual: TModoCrud read GetModoCrudAtual write SetModoCrudAtual;

  end;

var
  FRMCrudBase: TFRMCrudBase;

implementation

{$R *.dfm}
{ TFRMCrudBase }

procedure TFRMCrudBase.FormCreate(Sender: TObject);
begin
  ConfigurarComponentes;
end;

function TFRMCrudBase.GetModoCrudAtual: TModoCrud;
begin
  Result := FModoCrudAtual;
end;

procedure TFRMCrudBase.BTNAlterarClick(Sender: TObject);
begin
  SetModoCrudAtual(Alteracao);

  ConfigurarComponentes;
end;

procedure TFRMCrudBase.BTNCancelarClick(Sender: TObject);
begin
  CarregarRegistro;
  SetModoCrudAtual(Padrao);

  ConfigurarComponentes;
end;

procedure TFRMCrudBase.BTNNovoClick(Sender: TObject);
begin
  SetModoCrudAtual(Insercao);

  ConfigurarComponentes;

  LimparCamposDaTela;

  NovoRegistro;
end;

procedure TFRMCrudBase.BTNSalvarClick(Sender: TObject);
begin
  SalvarRegistro;

  SetModoCrudAtual(Padrao);

  ConfigurarComponentes;
end;

procedure TFRMCrudBase.ConfigurarComponentes;
var
  HabilitarComponentes: Boolean;
begin
  ConfigurarBotoesCrud;

  HabilitarComponentes := (FModoCrudAtual <> Padrao);

  HabilitarDesabilitarComponentes(HabilitarComponentes);
end;

procedure TFRMCrudBase.ConfigurarBotoesCrud;
begin
  BTNNovo.Enabled := (FModoCrudAtual = Padrao);
  BTNAlterar.Enabled := (FModoCrudAtual = Padrao);
  BTNPrimeiro.Enabled := (FModoCrudAtual = Padrao);
  BTNAnterior.Enabled := (FModoCrudAtual = Padrao);
  BTNProximo.Enabled := (FModoCrudAtual = Padrao);
  BTNUltimo.Enabled := (FModoCrudAtual = Padrao);

  BTNSalvar.Enabled := (FModoCrudAtual <> Padrao);
  BTNCancelar.Enabled := (FModoCrudAtual <> Padrao);
end;

procedure TFRMCrudBase.FormShow(Sender: TObject);
begin
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

    if (Component is TComboBox) then
      TCustomComboBox(Component).ItemIndex := VALOR_VAZIO;
  end;

end;

procedure TFRMCrudBase.SetModoCrudAtual(const Value: TModoCrud);
begin
  FModoCrudAtual := Value;
end;

end.
