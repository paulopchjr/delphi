unit uFrmCadastroProdutos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uFrmCadastroPadrao, Vcl.StdCtrls,
  Vcl.ExtCtrls, RegularExpressions, Vcl.Grids, RLReport;

type
  TfrmCadastroProdutos = class(TfrmCadastroPadrao)
    Label7: TLabel;
    Edit1: TEdit;
    btn_buscar: TButton;
    btn_sairPes: TButton;
    Panel3: TPanel;
    btnProdSecao: TButton;
    StringGridProd: TStringGrid;
    CbxProdutoSecao: TComboBox;
    edtCodigoProduto: TEdit;
    edtProDescricao: TEdit;
    edtProdPrecoCusto: TEdit;
    edtProdPrecoVenda: TEdit;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    btn_ant: TButton;
    Button2: TButton;
    Label8: TLabel;
    Button1: TButton;
    procedure btn_pesquisarClick(Sender: TObject);
    procedure btn_sairClick(Sender: TObject);
    procedure btn_sairPesClick(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure edtProDescricaoChange(Sender: TObject);
    procedure CbxProdutoSecaoChange(Sender: TObject);
    procedure edtProdPrecoCustoChange(Sender: TObject);
    procedure edtProdPrecoVendaChange(Sender: TObject);
    procedure btn_novoClick(Sender: TObject);
    procedure btn_gravarClick(Sender: TObject);
    procedure btn_excluirClick(Sender: TObject);
    procedure btn_buscarClick(Sender: TObject);
    procedure StringGridProdSelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure Button2Click(Sender: TObject);
    procedure btn_antClick(Sender: TObject);
    procedure edtProdPrecoCustoExit(Sender: TObject);
    procedure edtProdPrecoVendaExit(Sender: TObject);
    procedure btn_caneclarClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure btnProdSecaoClick(Sender: TObject);
  private
    { Private declarations }
    procedure buscarProdutosPorDescricao;
    procedure buscarTodosProdutos;
    procedure atualizaProdutos;
    procedure validarCampos(resultado: Boolean);
    procedure excluirProduto;
    procedure insertProdutos;
    procedure limparTabela;
    procedure limparCampos;

    function buscaValorCombox(): Integer;
    function contadorRegistros(): Integer;

  public
    { Public declarations }
  end;

var
  frmCadastroProdutos: TfrmCadastroProdutos;

implementation

{$R *.dfm}

uses uFrmDM, UfrmRelProdutos, UFrmRelProdSecao;

procedure TfrmCadastroProdutos.atualizaProdutos;
var
  teste: Integer;
begin
  with frmDm.tb_produtos do
  begin
    close;
    Sql.Clear;

    if ((edtCodigoProduto.Text <> '') and (edtProdPrecoCusto.Text <> '') and
      (edtProdPrecoCusto.Text <> '') and (CbxProdutoSecao.Text <> '')) then
    begin
      Sql.Add('UPDATE PRODUTOS SET DESCRICAO = :d, VALOR_CUSTO = :prc,VALOR_VENDA = :prv, ');
      Sql.Add(' CODIGO_SECAO = :cods WHERE CODIGO = :codigo');

      ParamByName('d').AsString := edtProDescricao.Text;
      ParamByName('prc').AsString := StringReplace(edtProdPrecoCusto.Text, ',',
        '.', [rfReplaceAll, rfIgnoreCase]);
      ParamByName('prv').AsString := StringReplace(edtProdPrecoVenda.Text, ',',
        '.', [rfReplaceAll, rfIgnoreCase]);
      ParamByName('cods').AsInteger := buscaValorCombox;
      ParamByName('codigo').AsString := edtCodigoProduto.Text;
    end
    else
    begin
      ShowMessage('Erro Ao atualizar esse produto');
    end;
    ExecSQL(true);
  end;

  ShowMessage('Produto Atualizado com Sucesso!');
end;

procedure TfrmCadastroProdutos.btnProdSecaoClick(Sender: TObject);
begin
  inherited;
  frmRelProdSecao := TfrmRelProdSecao.Create(Self);
  frmRelProdSecao.ShowModal;
end;

procedure TfrmCadastroProdutos.btn_antClick(Sender: TObject);
var
  clik, coluna, linha, anterior: Integer;
  codigo, descricao, precocusto, precovenda, secao: String;

begin
  inherited;

  linha := 0;
  coluna := 0;
  anterior := 5;
  limparTabela;
  clik := 0;
  while clik = 0 do

  begin
    anterior := anterior - 5;

    if anterior < 0 then
    begin
      exit;
      ShowMessage('menor que 0');
    end;
    if anterior = 0 then
    begin
      btn_ant.Enabled := false;
    end;
    with frmDm.tb_produtos do
    begin
      close;
      Sql.Clear;
      Sql.Add(' select first 5 skip ' + IntToStr(anterior) +
        ' P.codigo,P.DESCRICAO, P.VALOR_CUSTO, P.VALOR_VENDA, S.SECAO ');
      Sql.Add(' from produtos AS P');
      Sql.Add(' LEFT JOIN SECOES AS S ON S.codigo = P.codigo_secao');
      Sql.Add(' order by P.DESCRICAO asc');

      Open;
      First;
      for coluna := 0 to 4 do
      begin
        if ((coluna = 0) and (linha = 0)) then
        begin
          StringGridProd.Cells[coluna, linha] := 'CODIGO';
          StringGridProd.ColWidths[coluna] := 100;
        end;
        if ((coluna = 1) and (linha = 0)) then
        begin
          StringGridProd.Cells[coluna, linha] := 'DESCRI��O';
          StringGridProd.ColWidths[coluna] := 100;

        end;

        if ((coluna = 2) and (linha = 0)) then
        begin
          StringGridProd.Cells[coluna, linha] := 'VALOR CUSTO';
          StringGridProd.ColWidths[coluna] := 100;
        end;

        if ((coluna = 3) and (linha = 0)) then
        begin
          StringGridProd.Cells[coluna, linha] := 'VALOR VENDA';
          StringGridProd.ColWidths[coluna] := 100;
        end;

        if ((coluna = 4) and (linha = 0)) then
        begin
          StringGridProd.Cells[coluna, linha] := 'SE��O';
          StringGridProd.ColWidths[coluna] := 90;
        end;
      end;

      linha := 1;

      while not(Eof) do
      begin
        coluna := 0;

        codigo := FieldByName('CODIGO').AsString;
        descricao := FieldByName('DESCRICAO').AsString;
        precocusto := FieldByName('VALOR_CUSTO').AsString;
        precovenda := FieldByName('VALOR_VENDA').AsString;
        secao := FieldByName('SECAO').AsString;
        if (coluna = 0) then
        begin
          StringGridProd.Cells[coluna, linha] := codigo;
        end;
        coluna := coluna + 1;

        if (coluna = 1) then
        begin
          StringGridProd.Cells[coluna, linha] := descricao;
        end;
        coluna := coluna + 1;

        if (coluna = 2) then
        begin
          StringGridProd.Cells[coluna, linha] := ' R$ ' + precocusto;
        end;
        coluna := coluna + 1;

        if (coluna = 3) then
        begin
          StringGridProd.Cells[coluna, linha] := ' R$ ' + precovenda;
        end;
        coluna := coluna + 1;

        if (coluna = 4) then
        begin
          StringGridProd.Cells[coluna, linha] := secao;
        end;

        linha := linha + 1;
        Next;
      end;

    end;
    clik := 1;
  end;

end;

procedure TfrmCadastroProdutos.btn_buscarClick(Sender: TObject);
var
  registros: Integer;
begin
  inherited;
  if (Edit1.Text = '') then
  begin
    buscarTodosProdutos;
    btn_ant.Enabled := false;
    registros := contadorRegistros();
    Label8.Caption := 'Total de Registros: ' + IntToStr(registros);
    Label8.Font.Size := 10;
  end
  else
  begin
    limparTabela;
    buscarProdutosPorDescricao;

    btn_ant.Enabled := false;
    Button2.Enabled := false;
  end;
end;

procedure TfrmCadastroProdutos.btn_caneclarClick(Sender: TObject);
begin
  inherited;
  // CANCELA OPERA��ES
  if ((edtCodigoProduto.Text <> '') or (edtProDescricao.Text <> '') or
    (edtProdPrecoCusto.Text <> '') or (edtProdPrecoVenda.Text <> '')) then
  begin

    if (MessageDlg('Deseja Cancelar ?', TMsgDlgType.mtConfirmation,
      [TMsgDlgBtn.mbYes, TMsgDlgBtn.mbNo], 0) = mrYes) then
    begin
      edtCodigoProduto.Text := '';
      edtProDescricao.Text := '';
      edtProdPrecoCusto.Text := '';
      edtProdPrecoVenda.Text := '';
    end;
  end
  else
  begin
    ShowMessage('Campos Est�o vazios');
    edtProDescricao.SetFocus;
  end;

end;

procedure TfrmCadastroProdutos.btn_excluirClick(Sender: TObject);
begin
  inherited;
  if (edtCodigoProduto.Text <> '') then
  begin
    excluirProduto;
    ShowMessage('Produto excluido com sucesso');
    limparTabela;
    buscarTodosProdutos;
  end;

end;

procedure TfrmCadastroProdutos.btn_gravarClick(Sender: TObject);
begin
  inherited;
  if (edtCodigoProduto.Text <> '') then
  begin
    atualizaProdutos;
    buscarTodosProdutos;
  end
  else
  begin
    insertProdutos;
    buscarTodosProdutos;
  end;

end;

procedure TfrmCadastroProdutos.btn_novoClick(Sender: TObject);
begin
  inherited;

  // � NOVO, LIMPA O FORMULARIO
  if ((edtCodigoProduto.Text <> '') or (edtProDescricao.Text <> '') or
    (edtProdPrecoCusto.Text <> '') or (edtProdPrecoVenda.Text <> '') or
    (CbxProdutoSecao.Text <> '')) then
  begin
    edtCodigoProduto.Text := '';
    edtProDescricao.Text := '';
    edtProdPrecoCusto.Text := '';
    edtProdPrecoVenda.Text := '';
    CbxProdutoSecao.Text := '';

  end;

end;

procedure TfrmCadastroProdutos.btn_pesquisarClick(Sender: TObject);

begin
  inherited;

  Panel2.Visible := true;

end;

procedure TfrmCadastroProdutos.btn_sairClick(Sender: TObject);
begin
  inherited;
  close;
  limparTabela;

end;

procedure TfrmCadastroProdutos.btn_sairPesClick(Sender: TObject);
begin
  inherited;
  Panel2.Visible := false;
  limparTabela;
  limparCampos;

end;

procedure TfrmCadastroProdutos.buscarProdutosPorDescricao;
var
  coluna: Integer;
  linha: Integer;
  codigo: String;
  descricao: String;
  precocusto: String;
  precovenda: string;
  secao: string;

begin

  with frmDm.tb_produtos do
  begin
    close;
    Sql.Clear;
    Sql.Add(' SELECT DISTINCT P.CODIGO, P.DESCRICAO, P.VALOR_CUSTO, ');
    Sql.Add(' P.VALOR_VENDA, S.SECAO FROM PRODUTOS AS P ');
    Sql.Add(' LEFT JOIN SECOES AS S ');
    Sql.Add(' ON S.CODIGO = P.CODIGO_SECAO');
    Sql.Add(' WHERE P.DESCRICAO LIKE ' + QuotedStr(('%' + Edit1.Text + '%')));
    Sql.Add(' ORDER BY DESCRICAO ASC');
    Open;
    First;
    for coluna := 0 to 4 do
    begin
      if ((coluna = 0) and (linha = 0)) then
      begin
        StringGridProd.Cells[coluna, linha] := 'CODIGO';
        StringGridProd.ColWidths[coluna] := 100;
      end;
      if ((coluna = 1) and (linha = 0)) then
      begin
        StringGridProd.Cells[coluna, linha] := 'DESCRI��O';
        StringGridProd.ColWidths[coluna] := 100;

      end;

      if ((coluna = 2) and (linha = 0)) then
      begin
        StringGridProd.Cells[coluna, linha] := 'PRE�O.CUSTO';
        StringGridProd.ColWidths[coluna] := 100;
      end;

      if ((coluna = 3) and (linha = 0)) then
      begin
        StringGridProd.Cells[coluna, linha] := 'PRE�O.VENDA';
        StringGridProd.ColWidths[coluna] := 100;
      end;

      if ((coluna = 4) and (linha = 0)) then
      begin
        StringGridProd.Cells[coluna, linha] := 'SE��O';
        StringGridProd.ColWidths[coluna] := 90;
      end;
    end;

    linha := 1;
    while not(Eof) do
    begin
      coluna := 0;

      codigo := FieldByName('CODIGO').AsString;
      descricao := FieldByName('DESCRICAO').AsString;
      precocusto := FieldByName('VALOR_CUSTO').AsString;
      precovenda := FieldByName('VALOR_VENDA').AsString;
      secao := FieldByName('SECAO').AsString;
      if (coluna = 0) then
      begin
        StringGridProd.Cells[coluna, linha] := codigo;
      end;
      coluna := coluna + 1;

      if (coluna = 1) then
      begin
        StringGridProd.Cells[coluna, linha] := descricao;
      end;
      coluna := coluna + 1;

      if (coluna = 2) then
      begin
        StringGridProd.Cells[coluna, linha] := 'R$ ' + precocusto;
      end;
      coluna := coluna + 1;

      if (coluna = 3) then
      begin
        StringGridProd.Cells[coluna, linha] := 'R$ ' + precovenda;
      end;
      coluna := coluna + 1;

      if (coluna = 4) then
      begin
        StringGridProd.Cells[coluna, linha] := secao;
      end;

      linha := linha + 1;
      Next;
    end;

  end;

  btn_ant.Enabled := false;
end;

procedure TfrmCadastroProdutos.buscarTodosProdutos;
var
  coluna: Integer;
  linha: Integer;
  codigo: String;
  descricao: String;
  precocusto: String;
  precovenda: string;
  secao: string;

begin
  linha := 0;
  coluna := 0;

  with frmDm.tb_produtos do
  begin
    close;
    Sql.Clear;
    Sql.Add(' SELECT P.CODIGO, P.DESCRICAO, P.VALOR_CUSTO,');
    Sql.Add(' P.VALOR_VENDA, S.SECAO FROM PRODUTOS AS P');
    Sql.Add(' LEFT JOIN SECOES AS S ');
    Sql.Add(' ON S.CODIGO = P.CODIGO_SECAO ');
    Sql.Add(' ORDER BY P.DESCRICAO ASC ');
    Open;
    First;
    for coluna := 0 to 5 do
    begin
      if ((coluna = 0) and (linha = 0)) then
      begin
        StringGridProd.Cells[coluna, linha] := 'CODIGO';
        StringGridProd.ColWidths[coluna] := 100;
      end;
      if ((coluna = 1) and (linha = 0)) then
      begin
        StringGridProd.Cells[coluna, linha] := 'DESCRI��O';
        StringGridProd.ColWidths[coluna] := 100;

      end;

      if ((coluna = 2) and (linha = 0)) then
      begin
        StringGridProd.Cells[coluna, linha] := 'PRE�O.CUSTO';
        StringGridProd.ColWidths[coluna] := 100;
      end;

      if ((coluna = 3) and (linha = 0)) then
      begin
        StringGridProd.Cells[coluna, linha] := 'PRE�O.VENDA';
        StringGridProd.ColWidths[coluna] := 100;
      end;

      if ((coluna = 4) and (linha = 0)) then
      begin
        StringGridProd.Cells[coluna, linha] := 'SE��O';
        StringGridProd.ColWidths[coluna] := 90;
      end;
    end;

    linha := 1;
    while not(Eof) do
    begin
      coluna := 0;

      codigo := FieldByName('CODIGO').AsString;
      descricao := FieldByName('DESCRICAO').AsString;
      precocusto := FieldByName('VALOR_CUSTO').AsString;
      precovenda := FieldByName('VALOR_VENDA').AsString;
      secao := FieldByName('SECAO').AsString;
      if (coluna = 0) then
      begin
        StringGridProd.Cells[coluna, linha] := codigo;
      end;
      coluna := coluna + 1;

      if (coluna = 1) then
      begin
        StringGridProd.Cells[coluna, linha] := descricao;
      end;
      coluna := coluna + 1;

      if (coluna = 2) then
      begin
        StringGridProd.Cells[coluna, linha] := 'R$ ' + precocusto;
      end;
      coluna := coluna + 1;

      if (coluna = 3) then
      begin
        StringGridProd.Cells[coluna, linha] := 'R$ ' + precovenda;
      end;
      coluna := coluna + 1;

      if (coluna = 4) then
      begin
        StringGridProd.Cells[coluna, linha] := secao;
      end;

      linha := linha + 1;

      Next;
    end;
    btn_ant.Enabled := false;
  end;
end;

function TfrmCadastroProdutos.buscaValorCombox: Integer;
var
  valorCbx: Integer;
  teste: string;
begin
  // BUSCA O VALOR DO COMBOX PARA SER EDITADO NO SISTEMA
  with frmDm.tb_secao do
  begin
    close;
    Sql.Clear;
    Sql.Add('SELECT CODIGO FROM SECOES WHERE SECAO = :s');
    ParamByName('s').AsString := CbxProdutoSecao.Text;
    Open;
    if not(Eof) then
    begin
      valorCbx := FieldByName('CODIGO').AsInteger;
    end;

  end;

  Result := valorCbx;

end;

procedure TfrmCadastroProdutos.Button1Click(Sender: TObject);

begin
  inherited;
  frmRelProdutos := TfrmRelProdutos.Create(Self);
  frmRelProdutos.ShowModal;
end;

procedure TfrmCadastroProdutos.Button2Click(Sender: TObject);
var
  clik, linha, coluna, proximo: Integer;
  codigo, descricao, precocusto, precovenda, secao: String;

begin
  inherited;

  linha := 0;
  coluna := 0;
  clik := 0;
  limparTabela;
  proximo := 0;

  if (contadorRegistros > 5) then
  begin
    while clik = 0 do
    begin
      proximo := proximo + 5;
      with frmDm.tb_produtos do
      begin
        close;
        Sql.Clear;
        Sql.Add(' select first 5 skip ' + IntToStr(proximo));
        Sql.Add(' P.codigo,P.DESCRICAO, P.VALOR_CUSTO, P.VALOR_VENDA, S.SECAO ');
        Sql.Add(' from produtos AS P');
        Sql.Add(' LEFT JOIN SECOES AS S ON S.codigo = P.codigo_secao');
        Sql.Add(' order by P.DESCRICAO asc');
        Open;
        First;
        for coluna := 0 to 5 do
        begin
          if ((coluna = 0) and (linha = 0)) then
          begin
            StringGridProd.Cells[coluna, linha] := 'CODIGO';
            StringGridProd.ColWidths[coluna] := 100;
          end;
          if ((coluna = 1) and (linha = 0)) then
          begin
            StringGridProd.Cells[coluna, linha] := 'DESCRI��O';
            StringGridProd.ColWidths[coluna] := 100;
          end;

          if ((coluna = 2) and (linha = 0)) then
          begin
            StringGridProd.Cells[coluna, linha] := 'PRE�OCUSTO';
            StringGridProd.ColWidths[coluna] := 100;
          end;

          if ((coluna = 3) and (linha = 0)) then
          begin
            StringGridProd.Cells[coluna, linha] := 'PRE�O.VENDA';
            StringGridProd.ColWidths[coluna] := 100;
          end;

          if ((coluna = 4) and (linha = 0)) then
          begin
            StringGridProd.Cells[coluna, linha] := 'SE��O';
            StringGridProd.ColWidths[coluna] := 90;
          end;
        end;

        linha := 1;
        while not(Eof) do
        begin
          coluna := 0;
          codigo := FieldByName('CODIGO').AsString;
          descricao := FieldByName('DESCRICAO').AsString;
          precocusto := FieldByName('VALOR_CUSTO').AsString;
          precovenda := FieldByName('VALOR_VENDA').AsString;
          secao := FieldByName('SECAO').AsString;
          if (coluna = 0) then
          begin
            StringGridProd.Cells[coluna, linha] := codigo;
          end;
          coluna := coluna + 1;

          if (coluna = 1) then
          begin
            StringGridProd.Cells[coluna, linha] := descricao;
          end;
          coluna := coluna + 1;

          if (coluna = 2) then
          begin
            StringGridProd.Cells[coluna, linha] := ' R$ ' + precocusto;
          end;
          coluna := coluna + 1;

          if (coluna = 3) then
          begin
            StringGridProd.Cells[coluna, linha] := ' R$ ' + precovenda;
          end;
          coluna := coluna + 1;

          if (coluna = 4) then
          begin
            StringGridProd.Cells[coluna, linha] := secao;
          end;

          linha := linha + 1;
          Next;
        end;

      end;

      clik := clik + 1;

    end;
    btn_ant.Enabled := true;
  end
  else
  begin
    ShowMessage('REGISTROS S�O MENORES QUE 5');
  end;

end;

procedure TfrmCadastroProdutos.CbxProdutoSecaoChange(Sender: TObject);
begin
  inherited;
  validarCampos(true);
end;

function TfrmCadastroProdutos.contadorRegistros: Integer;
var
  registros: Integer;
begin
  with frmDm.tb_produtos do
  begin
    close;
    Sql.Clear;
    Sql.Add('SELECT COUNT(CODIGO) AS CODIGO FROM PRODUTOS');
    Open;
    registros := FieldByName('CODIGO').AsInteger;
  end;

  Result := registros;
end;

procedure TfrmCadastroProdutos.Edit1Change(Sender: TObject);

begin
  inherited;
  if (Edit1.Text = '') then
  begin
    limparTabela;
  end;
end;

procedure TfrmCadastroProdutos.edtProDescricaoChange(Sender: TObject);
begin
  inherited;
  validarCampos(true);
end;

procedure TfrmCadastroProdutos.edtProdPrecoCustoChange(Sender: TObject);
begin
  inherited;
  validarCampos(true);

end;

procedure TfrmCadastroProdutos.edtProdPrecoCustoExit(Sender: TObject);
begin
  inherited;
  edtProdPrecoCusto.Text := FormatFloat('###,##0.00',
    StrToFloat(edtProdPrecoCusto.Text));
end;

procedure TfrmCadastroProdutos.edtProdPrecoVendaChange(Sender: TObject);
begin
  inherited;
  validarCampos(true);

end;

procedure TfrmCadastroProdutos.edtProdPrecoVendaExit(Sender: TObject);
begin
  inherited;
  edtProdPrecoVenda.Text := FormatFloat('##,##0.00',
    StrToFloat(edtProdPrecoVenda.Text));

end;

procedure TfrmCadastroProdutos.excluirProduto;
begin
  with frmDm.tb_produtos do
  begin
    close;
    Sql.Clear;
    Sql.Add('DELETE FROM PRODUTOS WHERE CODIGO = :codigo');
    ParamByName('codigo').AsString := edtCodigoProduto.Text;
    ExecSQL(true);
  end;

  edtCodigoProduto.Text := '';
  edtProDescricao.Text := '';
  edtProdPrecoCusto.Text := '';
  edtProdPrecoVenda.Text := '';
  CbxProdutoSecao.Text := '';

end;

procedure TfrmCadastroProdutos.FormCreate(Sender: TObject);
begin
  inherited;
  with frmDm do
  begin
    tb_secao.close;
    tb_secao.close;
    tb_secao.Sql.Clear;
    tb_secao.Sql.Text := 'SELECT * FROM SECOES ';
    tb_secao.Open;
    tb_secao.First;

    while not tb_secao.Eof do
    begin
      CbxProdutoSecao.Items.Add(tb_secao.FieldByName('SECAO').AsString);

      tb_secao.Next;

    end;

    CbxProdutoSecao.ItemIndex := -1;
  end;
end;

procedure TfrmCadastroProdutos.insertProdutos;
var
  vlrdes: String;
begin

  with frmDm.tb_produtos do
  begin
    close;
    Sql.Clear;
    Sql.Add('SELECT * FROM PRODUTOS WHERE DESCRICAO = :d');
    ParamByName('d').AsString := edtProDescricao.Text;
    Open;
    First;

    if not(Eof) then
    begin
      vlrdes := VarToStr(frmDm.tb_produtos['DESCRICAO']);
      MessageDlg('O Produto: ' + vlrdes + '. J� est� cadastrado!',
        TMsgDlgType.mtInformation, mbOKCancel, 0);
      Next;
      edtProDescricao.Text := '';
      edtProDescricao.SetFocus;

    end
    else
    begin

      Sql.Clear;
      Sql.Add('INSERT INTO PRODUTOS ( DESCRICAO,');
      Sql.Add(' VALOR_CUSTO, VALOR_VENDA, CODIGO_SECAO)');
      Sql.Add(' VALUES (:des, :pc, :pv,:cs)');

      ParamByName('des').AsString := edtProDescricao.Text;

      ParamByName('pc').AsString := StringReplace(edtProdPrecoCusto.Text, ',',
        '.', [rfReplaceAll, rfIgnoreCase]);
      ParamByName('pv').AsString := StringReplace(edtProdPrecoVenda.Text, ',',
        '.', [rfReplaceAll, rfIgnoreCase]);
      ParamByName('cs').AsInteger := buscaValorCombox;
      ExecSQL(true);
      ShowMessage('PRODUTO CADASTRO COM SUCESSO');
    end;
    edtProDescricao.Text := '';
    edtCodigoProduto.Text := '';
    edtProDescricao.Text := '';
    edtProdPrecoCusto.Text := '';
    edtProdPrecoVenda.Text := '';
    CbxProdutoSecao.ItemIndex := -1;

  end;
end;

procedure TfrmCadastroProdutos.limparCampos;
begin
  if ((edtCodigoProduto.Text <> '') or (edtProDescricao.Text <> '') or
    (edtProdPrecoCusto.Text <> '') or (edtProdPrecoVenda.Text <> '') or
    (Edit1.Text <> '')) then
  begin
    edtCodigoProduto.Text := '';
    edtProDescricao.Text := '';
    edtProdPrecoCusto.Text := '';
    edtProdPrecoVenda.Text := '';
    CbxProdutoSecao.ItemIndex := -1;
    Edit1.Text := '';
  end;
end;

procedure TfrmCadastroProdutos.limparTabela;

var
  coluna, linha: Integer;

begin

  with StringGridProd do
  begin
    for coluna := 0 to ColCount - 1 do
    begin
      for linha := 0 to RowCount - 1 do
        Cells[coluna, linha] := '';

    end;
  end;

end;

procedure TfrmCadastroProdutos.StringGridProdSelectCell(Sender: TObject;
  ACol, ARow: Integer; var CanSelect: Boolean);
var
  coluna: Integer;
  linha: Integer;
  codigo: String;
  descricao: String;
  precocusto: String;
  precovenda: string;
  prod, secao: string;
begin
  inherited;

  linha := ARow;
  coluna := ACol;

  prod := StringGridProd.Cells[coluna, linha];

  with frmDm.tb_produtos do
  begin
    close;
    Sql.Clear;
    Sql.Add(' SELECT DISTINCT P.CODIGO, P.DESCRICAO, VALOR_CUSTO, ');
    Sql.Add(' VALOR_VENDA, S.SECAO FROM PRODUTOS AS P ');
    Sql.Add(' LEFT JOIN SECOES AS S ');
    Sql.Add(' ON S.CODIGO = P.CODIGO_SECAO');
    Sql.Add(' WHERE P.DESCRICAO = ' + QuotedStr(prod));

    Open;
    First;

    if not(Eof) then
    begin
      codigo := FieldByName('CODIGO').AsString;
      descricao := FieldByName('DESCRICAO').AsString;
      precocusto := FieldByName('VALOR_CUSTO').AsString;
      precovenda := FieldByName('VALOR_VENDA').AsString;
      secao := FieldByName('SECAO').AsString;
      Next;
    end;

    edtCodigoProduto.Text := codigo;
    edtProDescricao.Text := descricao;
    edtProdPrecoCusto.Text := precocusto;
    edtProdPrecoVenda.Text := precovenda;
    CbxProdutoSecao.Text := secao;
  end;
end;

procedure TfrmCadastroProdutos.validarCampos(resultado: Boolean);
begin

  if ((edtProDescricao.Text <> '') and (edtProdPrecoCusto.Text <> '') and
    (edtProdPrecoVenda.Text <> '') and (CbxProdutoSecao.Text <> '')) then
  begin
    btn_gravar.Enabled := true;
    resultado := true;
  end
  else
  begin
    btn_gravar.Enabled := false;
    resultado := false;
  end;

end;

end.
