unit uFrmCadastroPadrao;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls;

type
  TfrmCadastroPadrao = class(TForm)
    PanelTitulo: TPanel;
    Label1: TLabel;
    panelRodape: TPanel;
    btn_novo: TButton;
    btn_gravar: TButton;
    btn_pesquisar: TButton;
    btn_excluir: TButton;
    btn_sair: TButton;
    Panel2: TPanel;
    btn_caneclar: TButton;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadastroPadrao: TfrmCadastroPadrao;

implementation

{$R *.dfm}

end.
