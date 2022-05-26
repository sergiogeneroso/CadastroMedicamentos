program ProjetoDeAvaliacao;

uses
  Vcl.Forms,
  Avaliacao in '..\..\src\Avaliacao.pas' {frmPrincipal},
  Avaliacao.Conexao in '..\..\src\conexao\Avaliacao.Conexao.pas',
  Avaliacao.Impl.Conexao in '..\..\src\conexao\impl\Avaliacao.Impl.Conexao.pas',
  Avalicacao.Cadastros.Fabricante.Model.Entity.Fabricante in '..\..\src\cadastros\fabricante\model\entity\Avalicacao.Cadastros.Fabricante.Model.Entity.Fabricante.pas',
  Avalicacao.Cadastros.Fabricante.Model.Entity.Impl.Fabricante in '..\..\src\cadastros\fabricante\model\entity\impl\Avalicacao.Cadastros.Fabricante.Model.Entity.Impl.Fabricante.pas',
  Avalicacao.Cadastros.Fabricante.Model.Entity.Impl.FabricanteRepository in '..\..\src\cadastros\fabricante\model\repository\impl\Avalicacao.Cadastros.Fabricante.Model.Entity.Impl.FabricanteRepository.pas',
  Avalicacao.Cadastros.Fabricante.Model.Entity.FabricanteRepository in '..\..\src\cadastros\fabricante\model\repository\Avalicacao.Cadastros.Fabricante.Model.Entity.FabricanteRepository.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.Run;
end.
