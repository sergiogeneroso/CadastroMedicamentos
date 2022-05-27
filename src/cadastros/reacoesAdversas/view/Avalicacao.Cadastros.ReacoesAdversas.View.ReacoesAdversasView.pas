unit Avalicacao.Cadastros.ReacoesAdversas.View.ReacoesAdversasView;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ComCtrls,

  Avaliacao.CrudBase,

  Avalicacao.Cadastros.ReacoesAdversas.ViewModel.ReacoesAdversasViewModel,
  Avalicacao.Cadastros.ReacoesAdversas.ViewModel.Impl.ReacoesAdversasViewModel;

type
  TReacoesAdversasView = class(TFRMCrudBase)
    PGControl: TPageControl;
    TSGeral: TTabSheet;
    LBCodigo: TLabel;
    LBDescricao: TLabel;
    EDTCodigo: TEdit;
    EDTDescricao: TEdit;
    procedure FormCreate(Sender: TObject);
  private
    FViewModel: IReacoesAdversasViewModel;

    procedure NovoRegistro; override;
    procedure SalvarRegistro; override;
    procedure CarregarRegistro; override;

    procedure AtualizarCompontensVisuais;
    procedure AtualizarEntidade;
  public
    { Public declarations }
  end;

var
  ReacoesAdversasView: TReacoesAdversasView;

implementation

{$R *.dfm}

procedure TReacoesAdversasView.FormCreate(Sender: TObject);
begin
  inherited;

  FViewModel := TReacoesAdversasViewModel.Create;

  FViewModel.AtualizarComponentesVisuas := AtualizarCompontensVisuais;
  FViewModel.AtualizarEntidades := AtualizarEntidade;
end;

{ TReacoesAdversasView }

procedure TReacoesAdversasView.AtualizarCompontensVisuais;
begin
  EDTCodigo.Text := FViewModel.Codigo.ToString;
  EDTDescricao.Text := FViewModel.Descricao;
end;

procedure TReacoesAdversasView.AtualizarEntidade;
begin
  FViewModel.Descricao := EDTDescricao.Text;
end;

procedure TReacoesAdversasView.CarregarRegistro;
begin
  FViewModel.CarregarRegistro;
end;

procedure TReacoesAdversasView.NovoRegistro;
begin
  FViewModel.NovoRegistro;
end;

procedure TReacoesAdversasView.SalvarRegistro;
begin
  FViewModel.SalvarRegistro(ModoCrudAtual);
end;

end.
