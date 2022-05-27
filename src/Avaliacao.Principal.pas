unit Avaliacao.Principal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs,

  Avalicacao.Cadastros.Fabricante.View.FabricanteView, Vcl.StdCtrls;

type
  TFRMPrincipal = class(TForm)
    Button1: TButton;
    procedure Button1Click(Sender: TObject);
  private

  public
    { Public declarations }
  end;

var
  FRMPrincipal: TFRMPrincipal;

implementation

{$R *.dfm}

procedure TFRMPrincipal.Button1Click(Sender: TObject);
begin
  Application.CreateForm(TFabricanteView, FabricanteView);
  FabricanteView.ShowModal;
end;

end.
