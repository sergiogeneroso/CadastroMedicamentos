unit Avalicacao.Cadastros.ReacoesAdversas.Model.Repository.ReacoesAdversasRepository;

interface

uses
  Avalicacao.Cadastros.ReacoesAdversas.Model.Entity.ReacoesAdversas;

type
  IReacoesAdversasRepository = interface
    ['{A0468E4B-6842-4EFA-989E-A2E9E0786B3C}']

    procedure Cadastrar(const ReacoesAdversas: IReacoesAdversas);
    procedure Atualizar(const ReacoesAdversas: IReacoesAdversas);
    procedure Deletar(const ReacoesAdversas: IReacoesAdversas);

    function RetornarPorCodigo(const Codigo: Integer): IReacoesAdversas;
    function RetornarUltimoRegistro: IReacoesAdversas;
  end;

implementation

end.
