unit UfrmRelPadrao;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Grids;

type
  TfrmRel = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    Panel2: TPanel;
    Sair: TButton;
    StringGrid1: TStringGrid;
    btnvisualizar: TButton;
    btnImprmir: TButton;
    procedure SairClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmRel: TfrmRel;

implementation

{$R *.dfm}

procedure TfrmRel.SairClick(Sender: TObject);
begin
close;
end;

end.
