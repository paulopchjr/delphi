unit UfrmRelProdSecaoPrint;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, RLReport, Vcl.StdCtrls;

type
  TfrmProdSecaoPrint = class(TForm)
    RLReportProSecao: TRLReport;
    bandTitulo: TRLBand;
    Label1: TLabel;
    RLSystemInfo1: TRLSystemInfo;
    RLSystemInfo2: TRLSystemInfo;
    bandCabecalho: TRLBand;
    RLLabel1: TRLLabel;
    RLLabel2: TRLLabel;
    RLGroup1: TRLGroup;
    headergroup: TRLBand;
    bandDetail: TRLBand;
    bandfooter: TRLBand;
    RLLabel3: TRLLabel;
    RLLabel4: TRLLabel;
    RLDBText1: TRLDBText;
    RLDBText2: TRLDBText;
    RLLabel5: TRLLabel;
    RLLabel6: TRLLabel;
    RLLabel7: TRLLabel;
    RLLabel8: TRLLabel;
    RLLabel9: TRLLabel;
    RLDBText3: TRLDBText;
    RLDBText4: TRLDBText;
    RLDBText5: TRLDBText;
    RLDBText6: TRLDBText;
    RLDBText7: TRLDBText;
    RLSystemInfo3: TRLSystemInfo;
    RLLabel10: TRLLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmProdSecaoPrint: TfrmProdSecaoPrint;

implementation

{$R *.dfm}

uses uFrmDM;

end.
