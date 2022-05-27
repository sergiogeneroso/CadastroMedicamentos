unit Avaliacao.CrudBase;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls;

type

  TModoCrud = (Padrao, Insercao, Alteracao);

  TFRMCrudBase = class(TForm)
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
  private
    FModoCrudAtual: TModoCrud;

    procedure ConfigurarBotoes;

    procedure LimparCamposDaTela;
  public
    constructor Create;
  end;

var
  FRMCrudBase: TFRMCrudBase;

implementation

{$R *.dfm}
{ TFRMCrudBase }

procedure TFRMCrudBase.ConfigurarBotoes;
begin
  BTNNovo.Enabled := (FModoCrudAtual = Padrao);
  BTNAlterar.Enabled := (FModoCrudAtual = Padrao);
  BTNCancelar.Enabled := (FModoCrudAtual = Padrao);
  BTNPrimeiro.Enabled := (FModoCrudAtual = Padrao);
  BTNAnterior.Enabled := (FModoCrudAtual = Padrao);
  BTNUltimo.Enabled := (FModoCrudAtual = Padrao);

  BTNSalvar.Enabled := (FModoCrudAtual <> Padrao);
  BTNSalvar.Enabled := (FModoCrudAtual <> Padrao);
end;

constructor TFRMCrudBase.Create;
begin
  FModoCrudAtual := Padrao;
end;

procedure TFRMCrudBase.LimparCamposDaTela;
const
  VALOR_VAZIO = -1;
begin
  for var I := 0 to Self.ComponentCount - 1 do
  begin
    if Self.Components[I] is TEdit then
      TEdit(Components[I]).Text := EmptyStr;

    if (Components[I] is TComboBox) then
      TCustomComboBox(Components[I]).ItemIndex := VALOR_VAZIO;
  end;

end;

procedure TFRMCrudBase.BTNAlterarClick(Sender: TObject);
begin
  FModoCrudAtual := Alteracao;

  ConfigurarBotoes;
end;

procedure TFRMCrudBase.BTNCancelarClick(Sender: TObject);
begin
  FModoCrudAtual := Padrao;

  ConfigurarBotoes;
end;

procedure TFRMCrudBase.BTNNovoClick(Sender: TObject);
begin
  FModoCrudAtual := Insercao;

  ConfigurarBotoes;

  LimparCamposDaTela;
end;

procedure TFRMCrudBase.BTNSalvarClick(Sender: TObject);
begin
  FModoCrudAtual := Padrao;

  ConfigurarBotoes;
end;

end.
