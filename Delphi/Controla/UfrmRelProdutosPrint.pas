unit UfrmRelProdutosPrint;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, RLReport, Data.DB;

type
  TformRelPrint = class(TForm)
    RLProdutos: TRLReport;
    titulo: TRLBand;
    colunas: TRLBand;
    details: TRLBand;
    bandfooter: TRLBand;
    RLLabel1: TRLLabel;
    RLLabel2: TRLLabel;
    RLLabel3: TRLLabel;
    RLLabel4: TRLLabel;
    RLLabel5: TRLLabel;
    RLLabel6: TRLLabel;
    RLLabel7: TRLLabel;
    RLDBText1: TRLDBText;
    RLSystemInfo1: TRLSystemInfo;
    RLSystemInfo2: TRLSystemInfo;
    RLLabel8: TRLLabel;
    bandCabecalho: TRLBand;
    RLLabel9: TRLLabel;
    RLLabel10: TRLLabel;
    RLDBText2: TRLDBText;
    RLDBText3: TRLDBText;
    RLDBText4: TRLDBText;
    RLDBText5: TRLDBText;
    RLDBText6: TRLDBText;
    RLDBText7: TRLDBText;
    RLLabel11: TRLLabel;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  formRelPrint: TformRelPrint;

implementation

{$R *.dfm}

uses uFrmDM, UfrmRelProdutos;

procedure TformRelPrint.FormCreate(Sender: TObject);
begin
//  with frmDm.FDStoredProc1 do
//  begin
//
//   Activate;
//  end;
end;

end.
