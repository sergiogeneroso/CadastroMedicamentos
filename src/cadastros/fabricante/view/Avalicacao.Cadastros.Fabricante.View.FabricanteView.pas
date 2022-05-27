unit Avalicacao.Cadastros.Fabricante.View.FabricanteView;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs,

  Avaliacao.CrudBase, Vcl.StdCtrls, Vcl.ComCtrls,

  Avalicacao.Cadastros.Fabricante.Model.Entity.Fabricante,
  Avalicacao.Cadastros.Fabricante.Model.Entity.Impl.Fabricante,
  Avalicacao.Cadastros.Fabricante.Model.Entity.FabricanteRepository,
  Avalicacao.Cadastros.Fabricante.Model.Entity.Impl.FabricanteRepository;

type
  TFabricanteView = class(TFRMCrudBase)
    EDTCodigo: TEdit;
    EDTNome: TEdit;
    LBCodigo: TLabel;
    LBNome: TLabel;
    PGControl: TPageControl;
    TSGeral: TTabSheet;
    procedure EDTCodigoChange(Sender: TObject);
    procedure EDTNomeChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    FFabricante: IFabricante;
    FFabricanteRepository: IFabricanteRepository;

    procedure NovoRegistro; override;
    procedure SalvarRegistro; override;
    procedure CarregarRegistro; override;

    procedure AtualizarCompontensVisuais;
  public

  end;

var
  FabricanteView: TFabricanteView;

implementation

{$R *.dfm}
{ TFabricanteView }

{ TFabricanteView }

procedure TFabricanteView.FormCreate(Sender: TObject);
begin
  inherited;

  FFabricanteRepository := TFabricanteRepository.Create;
end;

procedure TFabricanteView.AtualizarCompontensVisuais;
begin
  EDTCodigo.Text := FFabricante.Codigo.ToString;
  EDTNome.Text := FFabricante.Nome;
end;

procedure TFabricanteView.CarregarRegistro;
begin
  FFabricante := FFabricanteRepository.RetornarUltimoRegistro;
  AtualizarCompontensVisuais;
end;

procedure TFabricanteView.EDTCodigoChange(Sender: TObject);
begin
  if string(EDTCodigo.Text).IsEmpty then
    Exit;

  FFabricante.Codigo := string(EDTCodigo.Text).ToInteger;
end;

procedure TFabricanteView.EDTNomeChange(Sender: TObject);
begin
  FFabricante.Nome := EDTNome.Text;
end;

procedure TFabricanteView.NovoRegistro;
begin
  FFabricante := TFabricante.Create;
end;

procedure TFabricanteView.SalvarRegistro;
begin
  if ModoCrudAtual = Insercao then
    FFabricanteRepository.Cadastrar(FFabricante)
  else
    FFabricanteRepository.Atualizar(FFabricante);
end;

end.
