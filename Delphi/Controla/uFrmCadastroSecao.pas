unit uFrmCadastroSecao;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uFrmCadastroPadrao, Vcl.StdCtrls,
  Vcl.ExtCtrls, Vcl.Grids;

type
  TfrmCadastroSecao = class(TfrmCadastroPadrao)
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    edtCodigoSecao: TEdit;
    edtSecao: TEdit;
    etdQtdeProdutos: TEdit;
    Panel3: TPanel;
    Label5: TLabel;
    btn_buscar: TButton;
    Edit1: TEdit;
    btn_sairPes: TButton;
    StringGridSecoes: TStringGrid;
    btn_ant: TButton;
    btn_prox: TButton;
    Label6: TLabel;
    procedure btn_pesquisarClick(Sender: TObject);
    procedure btn_sairPesClick(Sender: TObject);
    procedure btn_buscarClick(Sender: TObject);

    procedure StringGridSecoesDblClick(Sender: TObject);
    procedure StringGridSecoesSelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure Edit1Change(Sender: TObject);
    procedure btn_excluirClick(Sender: TObject);
    procedure btn_novoClick(Sender: TObject);
    procedure btn_cancelarClick(Sender: TObject);
    procedure btn_gravarClick(Sender: TObject);
    procedure edtSecaoChange(Sender: TObject);
    procedure btn_sairClick(Sender: TObject);
    procedure btn_proxClick(Sender: TObject);
    procedure btn_antClick(Sender: TObject);
    procedure btn_caneclarClick(Sender: TObject);
  private
    { Private declarations }
    procedure buscarTodasSecoes;
    function retornaQtdeRegistros(): Integer;
    procedure buscarPorSecao;
    procedure limparTabela;
    procedure excluirSecao;
    procedure limparCampos;
    procedure atualizaSecao;
    procedure cadastraSecao;
    procedure validarCampos(resultado: Boolean);
    procedure verificarSecaoExiste;
  public
    { Public declarations }
  end;

var
  frmCadastroSecao: TfrmCadastroSecao;

implementation

{$R *.dfm}

uses uFrmDM;

procedure TfrmCadastroSecao.atualizaSecao;
begin
  with frmDm.tb_secao do
  begin

    close;
    sql.Clear;
    sql.Add('UPDATE SECOES SET  SECAO =:secao ');
    sql.Add('  WHERE CODIGO = :codigo');
    ParamByName('secao').AsString := edtSecao.Text;
    ParamByName('codigo').AsString := edtCodigoSecao.Text;

    ExecSQL(true);

    ShowMessage('SEC�O ATUALIZADA COM SUCESSO');

  end;
end;

procedure TfrmCadastroSecao.btn_antClick(Sender: TObject);
var
  coluna, linha, clik, ant: Integer;
  codigo, descricao, qtdProd: String;

begin
  inherited;
  limparTabela;
  clik := 0;
  linha := 0;
  coluna := 0;
  ant := 4;
  while clik = 0 do
  begin
    ant := ant - 4;
    if ant < 0 then
    begin
      exit;
    end;
    if ant = 0 then
    begin
      btn_ant.Enabled := false;
    end;

    with frmDm.tb_secao do
    begin
      close;
      sql.Clear;
      sql.Add('SELECT FIRST 4 skip ' + IntToStr(ant) + ' CODIGO, SECAO,');
      sql.Add(' QTDE_PRODUTOS FROM SECOES ORDER BY SECAO ASC ');
      Open;
      First;

      for coluna := 0 to 2 do
      begin
        if ((coluna = 0) and (linha = 0)) then
        begin
          StringGridSecoes.Cells[coluna, linha] := 'CODIGO';
          StringGridSecoes.ColWidths[coluna] := 50;
        end;
        if ((coluna = 1) and (linha = 0)) then
        begin
          StringGridSecoes.Cells[coluna, linha] := 'SE��O';
          StringGridSecoes.ColWidths[coluna] := 100;

        end;

        if ((coluna = 2) and (linha = 0)) then
        begin
          StringGridSecoes.Cells[coluna, linha] := 'Quantidade Produtos';
          StringGridSecoes.ColWidths[coluna] := 150;
        end;
      end;

      linha := 1;
      while not(Eof) do
      begin
        coluna := 0;

        codigo := FieldByName('CODIGO').AsString;
        descricao := FieldByName('SECAO').AsString;
        qtdProd := FieldByName('QTDE_PRODUTOS').AsString;
        if (coluna = 0) then
        begin
          StringGridSecoes.Cells[coluna, linha] := codigo;
        end;

        coluna := coluna + 1;
        if (coluna = 1) then
        begin
          StringGridSecoes.Cells[coluna, linha] := descricao;
        end;
        coluna := coluna + 1;
        if (coluna = 2) then
        begin
          StringGridSecoes.Cells[coluna, linha] := qtdProd;
        end;

        linha := linha + 1;

        Next;
      end;

    end;
    clik := 1;
  end;

end;

procedure TfrmCadastroSecao.btn_buscarClick(Sender: TObject);
var
  registros: Integer;
begin
  inherited;

  if (Edit1.Text <> '') then
  begin
    buscarPorSecao;
    btn_ant.Enabled := false;
    btn_prox.Enabled := false;
  end
  else
  begin
    buscarTodasSecoes;
    btn_ant.Enabled := false;
    registros := retornaQtdeRegistros();
    Label6.Caption := 'Total de Registros : ' + IntToStr(registros);
    Label6.Font.Size := 10

  end;

end;

procedure TfrmCadastroSecao.btn_cancelarClick(Sender: TObject);
begin
  inherited;
  if ((edtCodigoSecao.Text <> '') or (edtSecao.Text <> '') or
    (etdQtdeProdutos.Text <> '')) then
  begin

    if (MessageDlg('Deseja Cancelar ?', TMsgDlgType.mtConfirmation,
      [TMsgDlgBtn.mbYes, TMsgDlgBtn.mbNo], 0) = mrYes) then
    begin
      edtCodigoSecao.Text := '';
      edtSecao.Text := '';
      etdQtdeProdutos.Text := '';
      edtSecao.SetFocus;

    end;
  end
  else
  begin
    ShowMessage('Campos Est�o vazios');
    edtSecao.SetFocus;
  end;

end;

procedure TfrmCadastroSecao.btn_caneclarClick(Sender: TObject);
begin
  inherited;
  // CANCELA OPERA��ES
  if ((edtCodigoSecao.Text <> '') or (edtSecao.Text <> '') or
    (etdQtdeProdutos.Text <> '')) then
  begin

    if (MessageDlg('Deseja Cancelar ?', TMsgDlgType.mtConfirmation,
      [TMsgDlgBtn.mbYes, TMsgDlgBtn.mbNo], 0) = mrYes) then
    begin
      edtCodigoSecao.Text := '';
      edtSecao.Text := '';
      etdQtdeProdutos.Text := '';

    end;
  end
  else
  begin
    ShowMessage('Campos Est�o vazios');
   edtSecao.SetFocus;
  end;
end;

procedure TfrmCadastroSecao.btn_excluirClick(Sender: TObject);
begin
  inherited;
  if (edtCodigoSecao.Text <> '') then
  begin
    excluirSecao;
    ShowMessage('SE��O EXCLUIDA COM SUCESSO!');
    limparCampos;
    limparTabela;
    buscarTodasSecoes; // ATUALIZA A TABELA

  end;
end;

procedure TfrmCadastroSecao.btn_gravarClick(Sender: TObject);
begin
  inherited;

  if (edtCodigoSecao.Text <> '') then
  begin
    atualizaSecao;
    buscarTodasSecoes;
  end
  else
  begin

    cadastraSecao;
    buscarTodasSecoes;
  end;

end;

procedure TfrmCadastroSecao.btn_novoClick(Sender: TObject);
begin
  inherited;
  limparCampos;
end;

procedure TfrmCadastroSecao.btn_pesquisarClick(Sender: TObject);
begin
  inherited;
  Panel2.Visible := true;
end;

procedure TfrmCadastroSecao.btn_proxClick(Sender: TObject);
var
  coluna, linha, clik, prox: Integer;
  codigo, descricao, qtdProd: String;

begin
  inherited;

  limparTabela;
  clik := 0;
  linha := 0;
  coluna := 0;
  prox := 0;
  while clik = 0 do
  begin
    prox := prox + 4;

    with frmDm.tb_secao do
    begin
      close;
      sql.Clear;
      sql.Add('SELECT FIRST 4 skip ' + IntToStr(prox) + ' CODIGO, SECAO,');
      sql.Add(' QTDE_PRODUTOS FROM SECOES ORDER BY SECAO ASC ');
      Open;
      First;

      for coluna := 0 to 2 do
      begin
        if ((coluna = 0) and (linha = 0)) then
        begin
          StringGridSecoes.Cells[coluna, linha] := 'CODIGO';
          StringGridSecoes.ColWidths[coluna] := 50;
        end;
        if ((coluna = 1) and (linha = 0)) then
        begin
          StringGridSecoes.Cells[coluna, linha] := 'SE��O';
          StringGridSecoes.ColWidths[coluna] := 100;

        end;

        if ((coluna = 2) and (linha = 0)) then
        begin
          StringGridSecoes.Cells[coluna, linha] := 'Quantidade Produtos';
          StringGridSecoes.ColWidths[coluna] := 150;
        end;
      end;

      linha := 1;
      while not(Eof) do
      begin
        coluna := 0;

        codigo := FieldByName('CODIGO').AsString;
        descricao := FieldByName('SECAO').AsString;
        qtdProd := FieldByName('QTDE_PRODUTOS').AsString;
        if (coluna = 0) then
        begin
          StringGridSecoes.Cells[coluna, linha] := codigo;
        end;

        coluna := coluna + 1;
        if (coluna = 1) then
        begin
          StringGridSecoes.Cells[coluna, linha] := descricao;
        end;
        coluna := coluna + 1;
        if (coluna = 2) then
        begin
          StringGridSecoes.Cells[coluna, linha] := qtdProd;
        end;

        linha := linha + 1;

        Next;
      end;

    end;
    clik := 1;
  end;

  btn_ant.Enabled := true;
end;

procedure TfrmCadastroSecao.btn_sairClick(Sender: TObject);
begin
  inherited;
  close;
end;

procedure TfrmCadastroSecao.btn_sairPesClick(Sender: TObject);
begin
  inherited;
  Panel2.Visible := false;
  limparTabela;
end;

procedure TfrmCadastroSecao.buscarPorSecao;

var
  coluna: Integer;
  linha: Integer;
  codigo: String;
  descricao: String;
  qtdProd: String;

begin
  linha := 0;
  coluna := 0;
  with frmDm.tb_secao do

  begin
    close;
    sql.Clear;
    sql.Add('SELECT CODIGO, SECAO, QTDE_PRODUTOS FROM SECOES ');
    sql.Add(' WHERE SECAO LIKE ' + QuotedStr((Edit1.Text + '%')));
    sql.Add(' ORDER BY SECAO  ASC');
    Open;
    First;

    for coluna := 0 to 2 do
    begin
      if ((coluna = 0) and (linha = 0)) then
      begin
        StringGridSecoes.Cells[coluna, linha] := 'CODIGO';
        StringGridSecoes.ColWidths[coluna] := 50;
      end;
      if ((coluna = 1) and (linha = 0)) then
      begin
        StringGridSecoes.Cells[coluna, linha] := 'SE��O';
        StringGridSecoes.ColWidths[coluna] := 100;

      end;

      if ((coluna = 2) and (linha = 0)) then
      begin
        StringGridSecoes.Cells[coluna, linha] := 'Quantidade Produtos';
        StringGridSecoes.ColWidths[coluna] := 150;
      end;
    end;
    linha := 1;
    while not(Eof) do
    begin
      coluna := 0;

      codigo := FieldByName('CODIGO').AsString;
      descricao := FieldByName('SECAO').AsString;
      qtdProd := FieldByName('QTDE_PRODUTOS').AsString;
      if (coluna = 0) then
      begin
        StringGridSecoes.Cells[coluna, linha] := codigo;
      end;

      coluna := coluna + 1;
      if (coluna = 1) then
      begin
        StringGridSecoes.Cells[coluna, linha] := descricao;
      end;
      coluna := coluna + 1;
      if (coluna = 2) then
      begin
        StringGridSecoes.Cells[coluna, linha] := qtdProd;
      end;

      linha := linha + 1;

      Next;
    end;

  end;

end;

procedure TfrmCadastroSecao.buscarTodasSecoes;
var

  coluna: Integer;
  linha: Integer;
  codigo: String;
  descricao: String;
  qtdProd: String;

begin

  linha := 0;
  coluna := 0;

  with frmDm.tb_secao do
  begin
    close;
    sql.Clear;
    sql.Add('SELECT  CODIGO, SECAO, QTDE_PRODUTOS ');
    sql.Add(' FROM SECOES ORDER BY SECAO ASC ');
    Open;
    First;

    for coluna := 0 to 2 do
    begin
      if ((coluna = 0) and (linha = 0)) then
      begin
        StringGridSecoes.Cells[coluna, linha] := 'CODIGO';
        StringGridSecoes.ColWidths[coluna] := 50;
      end;
      if ((coluna = 1) and (linha = 0)) then
      begin
        StringGridSecoes.Cells[coluna, linha] := 'SE��O';
        StringGridSecoes.ColWidths[coluna] := 100;

      end;

      if ((coluna = 2) and (linha = 0)) then
      begin
        StringGridSecoes.Cells[coluna, linha] := 'Quantidade Produtos';
        StringGridSecoes.ColWidths[coluna] := 150;
      end;
    end;

    linha := 1;
    while not(Eof) do
    begin
      coluna := 0;

      codigo := FieldByName('CODIGO').AsString;
      descricao := FieldByName('SECAO').AsString;
      qtdProd := FieldByName('QTDE_PRODUTOS').AsString;
      if (coluna = 0) then
      begin
        StringGridSecoes.Cells[coluna, linha] := codigo;
      end;

      coluna := coluna + 1;
      if (coluna = 1) then
      begin
        StringGridSecoes.Cells[coluna, linha] := descricao;
      end;
      coluna := coluna + 1;
      if (coluna = 2) then
      begin
        StringGridSecoes.Cells[coluna, linha] := qtdProd;
      end;

      linha := linha + 1;

      Next;
    end;

    // numero := retornaQtdeRegistros;

  end;

end;

procedure TfrmCadastroSecao.cadastraSecao;
var
  secao: string;
begin

  with frmDm.tb_secao do
  begin

    close;
    sql.Clear;

    sql.Add('SELECT * FROM SECOES WHERE SECAO =:s');
    ParamByName('s').AsString := edtSecao.Text;
    Open;
    First;

    if not(Eof) then
    begin
      secao := VarToStr(frmDm.tb_secao['SECAO']);
      MessageDlg('O Produto: ' + secao + '. J� est� cadastrado!',
        TMsgDlgType.mtInformation, mbOKCancel, 0);
      Next;
      edtSecao.Text := '';
      edtSecao.SetFocus;

    end
    else
    begin
      sql.Clear;
      sql.Add(' INSERT INTO SECOES (SECAO) VALUES (:secao) ');
      ParamByName('secao').AsString := edtSecao.Text;

      ExecSQL(true);

      ShowMessage('SEC�O CADASTRADA COM SUCESSO');
      limparCampos;

    end;
  end;
end;

procedure TfrmCadastroSecao.Edit1Change(Sender: TObject);
begin
  inherited;

  if Edit1.Text <> '' then
  begin
    limparTabela;
  end;
end;

procedure TfrmCadastroSecao.edtSecaoChange(Sender: TObject);
begin
  inherited;
  validarCampos(true);
end;

procedure TfrmCadastroSecao.excluirSecao;
begin

  with frmDm.tb_produtos do
  begin
    close;
    sql.Clear;
    sql.Add('DELETE FROM PRODUTOS where CODIGO_SECAO = ' + edtCodigoSecao.Text);
    ExecSQL(true);
  end;

  with frmDm.tb_secao do
  begin
    close;
    sql.Clear;

    sql.Add('DELETE FROM SECOES WHERE CODIGO = :n ');
    ParamByName('n').AsString := edtCodigoSecao.Text;
    ExecSQL(true);

  end;
end;

procedure TfrmCadastroSecao.limparCampos;
begin
  if ((edtCodigoSecao.Text <> '') or (edtSecao.Text <> '') or
    (etdQtdeProdutos.Text <> '')) then

    edtCodigoSecao.Text := '';
  edtSecao.Text := '';
  etdQtdeProdutos.Text := '';

  edtSecao.SetFocus;
end;

procedure TfrmCadastroSecao.limparTabela;

var
  coluna, linha: Integer;

begin

  with StringGridSecoes do
  begin
    for coluna := 0 to ColCount - 1 do
    begin
      for linha := 0 to RowCount - 1 do
        Cells[coluna, linha] := '';

    end;
  end;

end;

function TfrmCadastroSecao.retornaQtdeRegistros: Integer;
begin
  with frmDm.tb_secao do
  begin
    close;
    sql.Clear;
    sql.Add('SELECT COUNT(CODIGO) AS CODIGO FROM SECOES');
    Open;
    First;

    Result := FieldByName('CODIGO').AsInteger;

  end;

end;

procedure TfrmCadastroSecao.StringGridSecoesDblClick(Sender: TObject);
var
  coluna, linha: Integer;
  teste: String;
begin
  inherited;

end;

procedure TfrmCadastroSecao.StringGridSecoesSelectCell(Sender: TObject;
  ACol, ARow: Integer; var CanSelect: Boolean);
var
  secao, codigo, qtdProd: string;
  linha: Integer;

  coluna: Integer;
begin
  inherited;
  linha := ARow;
  coluna := ACol;

  secao := StringGridSecoes.Cells[coluna, linha];

  with frmDm.tb_secao do
  begin
    close;
    sql.Clear;
    sql.Add(' SELECT CODIGO,SECAO, QTDE_PRODUTOS FROM  SECOES  WHERE SECAO = ' +
      QuotedStr(secao));

    Open;
    First;

    if not(Eof) then
    begin
      codigo := FieldByName('CODIGO').AsString;
      qtdProd := FieldByName('QTDE_PRODUTOS').AsString;
    end;

    edtCodigoSecao.Text := codigo;
    edtSecao.Text := secao;
    etdQtdeProdutos.Text := qtdProd;
  end;
end;

procedure TfrmCadastroSecao.validarCampos(resultado: Boolean);
begin
  if edtSecao.Text <> '' then

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

procedure TfrmCadastroSecao.verificarSecaoExiste;
var
  secao: String;
begin
  with frmDm.tb_secao do
  begin

  end;
end;

end.
