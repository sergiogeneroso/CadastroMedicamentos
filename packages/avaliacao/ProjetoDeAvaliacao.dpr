program ProjetoDeAvaliacao;

uses
  Vcl.Forms,
  Avaliacao in '..\..\src\Avaliacao.pas' {frmPrincipal},
  Avaliacao.Conexao in '..\..\src\conexao\Avaliacao.Conexao.pas',
  Avaliacao.Impl.Conexao in '..\..\src\conexao\impl\Avaliacao.Impl.Conexao.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.Run;
end.
