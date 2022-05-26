unit Avaliacao;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs,

  Avaliacao.Conexao,
  Avaliacao.Impl.Conexao;

type
  TfrmPrincipal = class(TForm)
    procedure FormCreate(Sender: TObject);
  private
    FConexao: IConexao;
  public
    { Public declarations }
  end;

var
  FrmPrincipal: TfrmPrincipal;

implementation

{$R *.dfm}

procedure TfrmPrincipal.FormCreate(Sender: TObject);
begin
  FConexao := TConexao.Create;
end;

end.
