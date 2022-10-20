unit UFrmMenuPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus, Vcl.ExtCtrls,
  Vcl.Imaging.pngimage, Vcl.Imaging.jpeg;

type
  TfrmMenu = class(TForm)
    MainMenu1: TMainMenu;
    Image1: TImage;
    btn_secoes: TImage;
    btn_produtos: TImage;
    Cadastros1: TMenuItem;
    Pesquisar2: TMenuItem;
    Sees1: TMenuItem;
    Sees2: TMenuItem;
    Produto1: TMenuItem;
    Cadastros2: TMenuItem;
    Produtos1: TMenuItem;
    N1: TMenuItem;
    Sees3: TMenuItem;

    procedure btn_produtosClick(Sender: TObject);
    procedure btn_secoesClick(Sender: TObject);
    procedure Pesquisar2Click(Sender: TObject);
    procedure Sees1Click(Sender: TObject);
    procedure Produto1Click(Sender: TObject);
    procedure Produtos1Click(Sender: TObject);
    procedure Sees3Click(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmMenu: TfrmMenu;

implementation

{$R *.dfm}

uses uFrmCadastroProdutos, uFrmCadastroSecao, UfrmRelProdutos, UFrmRelProdSecao;

procedure TfrmMenu.btn_produtosClick(Sender: TObject);
var
  p: TfrmCadastroProdutos;
begin
  p := TfrmCadastroProdutos.Create(Self);
  p.Parent := frmMenu;
  p.BorderStyle := bsNone;
  p.Align := alClient;
  p.Show;

end;

procedure TfrmMenu.btn_secoesClick(Sender: TObject);
var
  fs: TfrmCadastroSecao;
begin
  fs := TfrmCadastroSecao.Create(Self);
  fs.Parent := frmMenu;
  fs.BorderStyle := bsNone;
  fs.Align := alClient;
  fs.Show

end;

procedure TfrmMenu.Pesquisar2Click(Sender: TObject);
begin
  close;
end;

procedure TfrmMenu.Produto1Click(Sender: TObject);
var
  p: TfrmCadastroProdutos;
begin
  p := TfrmCadastroProdutos.Create(Self);
  p.Parent := frmMenu;
  p.BorderStyle := bsNone;
  p.Align := alClient;
  p.Show;

end;

procedure TfrmMenu.Produtos1Click(Sender: TObject);
var
  rel: TfrmRelProdutos;

begin
  rel := TfrmRelProdutos.Create(Self);
  rel.Parent := frmMenu;
  rel.BorderStyle := bsNone;
  rel.Align := alClient;
  rel.Show;
end;

procedure TfrmMenu.Sees1Click(Sender: TObject);
var
  fs: TfrmCadastroSecao;
begin
  fs := TfrmCadastroSecao.Create(Self);
  fs.Parent := frmMenu;
  fs.BorderStyle := bsNone;
  fs.Align := alClient;
  fs.Show;
end;

procedure TfrmMenu.Sees3Click(Sender: TObject);
var
rel : TfrmRelProdSecao;
begin
 rel:= TfrmRelProdSecao.Create(Self);
  rel.Parent := frmMenu;
  rel.BorderStyle := bsNone;
  rel.Align := alClient;
  rel.Show;
end;

end.
