program ProjetoDeAvaliacao;

uses
  Vcl.Forms,
  Avaliacao.Principal in '..\..\src\Avaliacao.Principal.pas' {FRMPrincipal},
  Avaliacao.Conexao in '..\..\src\conexao\Avaliacao.Conexao.pas',
  Avaliacao.Impl.Conexao in '..\..\src\conexao\impl\Avaliacao.Impl.Conexao.pas',
  Avalicacao.Cadastros.Fabricante.Model.Entity.Fabricante in '..\..\src\cadastros\fabricante\model\entity\Avalicacao.Cadastros.Fabricante.Model.Entity.Fabricante.pas',
  Avalicacao.Cadastros.Fabricante.Model.Entity.Impl.Fabricante in '..\..\src\cadastros\fabricante\model\entity\impl\Avalicacao.Cadastros.Fabricante.Model.Entity.Impl.Fabricante.pas',
  Avalicacao.Cadastros.Fabricante.Model.Entity.Impl.FabricanteRepository in '..\..\src\cadastros\fabricante\model\repository\impl\Avalicacao.Cadastros.Fabricante.Model.Entity.Impl.FabricanteRepository.pas',
  Avalicacao.Cadastros.Fabricante.Model.Entity.FabricanteRepository in '..\..\src\cadastros\fabricante\model\repository\Avalicacao.Cadastros.Fabricante.Model.Entity.FabricanteRepository.pas',
  Avaliacao.CrudBase in '..\..\src\crudBase\Avaliacao.CrudBase.pas' {FRMCrudBase},
  Avalicacao.Cadastros.Fabricante.View.FabricanteView in '..\..\src\cadastros\fabricante\view\Avalicacao.Cadastros.Fabricante.View.FabricanteView.pas' {FabricanteView},
  Avalicacao.Cadastros.Fabricante.ViewModel.FabricanteViewModel in '..\..\src\cadastros\fabricante\viewModel\Avalicacao.Cadastros.Fabricante.ViewModel.FabricanteViewModel.pas',
  Avalicacao.Cadastros.Fabricante.ViewModel.Impl.FabricanteViewModel in '..\..\src\cadastros\fabricante\viewModel\impl\Avalicacao.Cadastros.Fabricante.ViewModel.Impl.FabricanteViewModel.pas',
  Avaliacao.CrudBase.ModoCrud in '..\..\src\crudBase\Avaliacao.CrudBase.ModoCrud.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFRMPrincipal, FRMPrincipal);
  Application.CreateForm(TFRMCrudBase, FRMCrudBase);
  Application.CreateForm(TFabricanteView, FabricanteView);
  Application.Run;
end.
