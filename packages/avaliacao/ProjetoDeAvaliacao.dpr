program ProjetoDeAvaliacao;

uses
  Vcl.Forms,
  Avaliacao.Principal in '..\..\src\Avaliacao.Principal.pas' {FRMPrincipal},
  Avaliacao.Conexao in '..\..\src\conexao\Avaliacao.Conexao.pas',
  Avaliacao.Impl.Conexao in '..\..\src\conexao\impl\Avaliacao.Impl.Conexao.pas',
  Avalicacao.Cadastros.Fabricante.Model.Entity.Fabricante in '..\..\src\cadastros\fabricante\model\entity\Avalicacao.Cadastros.Fabricante.Model.Entity.Fabricante.pas',
  Avalicacao.Cadastros.Fabricante.Model.Entity.Impl.Fabricante in '..\..\src\cadastros\fabricante\model\entity\impl\Avalicacao.Cadastros.Fabricante.Model.Entity.Impl.Fabricante.pas',
  Avalicacao.Cadastros.Fabricante.Model.Repository.Impl.FabricanteRepository in '..\..\src\cadastros\fabricante\model\repository\impl\Avalicacao.Cadastros.Fabricante.Model.Repository.Impl.FabricanteRepository.pas',
  Avalicacao.Cadastros.Fabricante.Model.Repository.FabricanteRepository in '..\..\src\cadastros\fabricante\model\repository\Avalicacao.Cadastros.Fabricante.Model.Repository.FabricanteRepository.pas',
  Avaliacao.CrudBase in '..\..\src\crudBase\Avaliacao.CrudBase.pas' {FRMCrudBase},
  Avalicacao.Cadastros.Fabricante.View.FabricanteView in '..\..\src\cadastros\fabricante\view\Avalicacao.Cadastros.Fabricante.View.FabricanteView.pas' {FabricanteView},
  Avalicacao.Cadastros.Fabricante.ViewModel.FabricanteViewModel in '..\..\src\cadastros\fabricante\viewModel\Avalicacao.Cadastros.Fabricante.ViewModel.FabricanteViewModel.pas',
  Avalicacao.Cadastros.Fabricante.ViewModel.Impl.FabricanteViewModel in '..\..\src\cadastros\fabricante\viewModel\impl\Avalicacao.Cadastros.Fabricante.ViewModel.Impl.FabricanteViewModel.pas',
  Avaliacao.CrudBase.ModoCrud in '..\..\src\crudBase\Avaliacao.CrudBase.ModoCrud.pas',
  Avalicacao.Cadastros.ReacoesAdversas.Model.Entity.ReacoesAdversas in '..\..\src\cadastros\reacoesAdversas\model\entity\Avalicacao.Cadastros.ReacoesAdversas.Model.Entity.ReacoesAdversas.pas',
  Avalicacao.Cadastros.ReacoesAdversas.Model.Entity.Impl.ReacoesAdversas in '..\..\src\cadastros\reacoesAdversas\model\entity\impl\Avalicacao.Cadastros.ReacoesAdversas.Model.Entity.Impl.ReacoesAdversas.pas',
  Avalicacao.Cadastros.ReacoesAdversas.Model.Repository.ReacoesAdversasRepository in '..\..\src\cadastros\reacoesAdversas\model\repository\Avalicacao.Cadastros.ReacoesAdversas.Model.Repository.ReacoesAdversasRepository.pas',
  Avalicacao.Cadastros.ReacoesAdversas.Model.Repository.Impl.ReacoesAdversasRepository in '..\..\src\cadastros\reacoesAdversas\model\repository\impl\Avalicacao.Cadastros.ReacoesAdversas.Model.Repository.Impl.ReacoesAdversasRepository.pas',
  Avalicacao.Cadastros.ReacoesAdversas.ViewModel.ReacoesAdversasViewModel in '..\..\src\cadastros\reacoesAdversas\viewmodel\Avalicacao.Cadastros.ReacoesAdversas.ViewModel.ReacoesAdversasViewModel.pas',
  Avalicacao.Cadastros.ReacoesAdversas.ViewModel.Impl.ReacoesAdversasViewModel in '..\..\src\cadastros\reacoesAdversas\viewmodel\impl\Avalicacao.Cadastros.ReacoesAdversas.ViewModel.Impl.ReacoesAdversasViewModel.pas',
  Avalicacao.Cadastros.ReacoesAdversas.View.ReacoesAdversasView in '..\..\src\cadastros\reacoesAdversas\view\Avalicacao.Cadastros.ReacoesAdversas.View.ReacoesAdversasView.pas' {ReacoesAdversasView},
  Avalicacao.Cadastros.Medicamento.Model.Entity.Medicamento in '..\..\src\cadastros\medicamentos\model\entity\Avalicacao.Cadastros.Medicamento.Model.Entity.Medicamento.pas',
  Avalicacao.Cadastros.Medicamento.Model.Entity.Impl.Medicamento in '..\..\src\cadastros\medicamentos\model\entity\impl\Avalicacao.Cadastros.Medicamento.Model.Entity.Impl.Medicamento.pas',
  Avalicacao.Cadastros.Medicamento.Model.Repository.MedicamentoRepository in '..\..\src\cadastros\medicamentos\model\repository\Avalicacao.Cadastros.Medicamento.Model.Repository.MedicamentoRepository.pas',
  Avalicacao.Cadastros.Medicamento.Model.Repository.Impl.MedicamentoRepository in '..\..\src\cadastros\medicamentos\model\repository\impl\Avalicacao.Cadastros.Medicamento.Model.Repository.Impl.MedicamentoRepository.pas',
  Avalicacao.Cadastros.Medicamento.ViewModel.MedicamentoViewModel in '..\..\src\cadastros\medicamentos\viewmodel\Avalicacao.Cadastros.Medicamento.ViewModel.MedicamentoViewModel.pas',
  Avalicacao.Cadastros.Medicamento.ViewModel.Impl.MedicamentoViewModel in '..\..\src\cadastros\medicamentos\viewmodel\impl\Avalicacao.Cadastros.Medicamento.ViewModel.Impl.MedicamentoViewModel.pas',
  Avalicacao.Cadastros.Medicamento.View.MedicamentoView in '..\..\src\cadastros\medicamentos\view\Avalicacao.Cadastros.Medicamento.View.MedicamentoView.pas' {MedicamentoView},
  Avalicacao.Cadastros.Medicamento.Model.Entity.ReacaoMedicamentoItem in '..\..\src\cadastros\medicamentos\model\entity\Avalicacao.Cadastros.Medicamento.Model.Entity.ReacaoMedicamentoItem.pas',
  Avalicacao.Cadastros.Medicamento.Model.Entity.Impl.ReacaoMedicamentoItem in '..\..\src\cadastros\medicamentos\model\entity\impl\Avalicacao.Cadastros.Medicamento.Model.Entity.Impl.ReacaoMedicamentoItem.pas',
  Avalicacao.Cadastros.Medicamento.Model.Repository.Impl.ReacaoMedicamentoItemRepository in '..\..\src\cadastros\medicamentos\model\repository\impl\Avalicacao.Cadastros.Medicamento.Model.Repository.Impl.ReacaoMedicamentoItemRepository.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFRMPrincipal, FRMPrincipal);
  Application.CreateForm(TFRMCrudBase, FRMCrudBase);
  Application.CreateForm(TFabricanteView, FabricanteView);
  Application.CreateForm(TReacoesAdversasView, ReacoesAdversasView);
  Application.CreateForm(TMedicamentoView, MedicamentoView);
  Application.Run;
end.
