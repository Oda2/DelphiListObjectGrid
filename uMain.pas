unit uMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxStyles, cxCustomData, cxFilter, cxData,
  cxDataStorage, cxEdit, cxNavigator, cxContainer, dxBar, Vcl.StdCtrls,
  cxTextEdit, cxGroupBox, cxGridCustomTableView, cxGridTableView,
  cxGridCustomView, cxClasses, cxGridLevel, cxGrid, uPessoa, Vcl.Menus,
  cxButtons, cxMaskEdit, cxSpinEdit, cxMemo, cxRichEdit;

type
  TfrmMain = class(TForm)
    cxGridLevel: TcxGridLevel;
    cxGrid: TcxGrid;
    cxGridTableView: TcxGridTableView;
    cxGridColumnID: TcxGridColumn;
    cxGridColumnNome: TcxGridColumn;
    cxGridColumnCPFCNPJ: TcxGridColumn;
    gbCadastro: TcxGroupBox;
    edtNome: TcxTextEdit;
    lblNome: TLabel;
    lblCPFCNPJ: TLabel;
    lblID: TLabel;
    btnNovo: TcxButton;
    btnEditar: TcxButton;
    btnCancelar: TcxButton;
    btnGravar: TcxButton;
    edtID: TcxSpinEdit;
    edtCPFCNPJ: TcxMaskEdit;
    cxRichEdit: TcxRichEdit;
    procedure FormCreate(Sender: TObject);
    procedure btnNovoClick(Sender: TObject);
    procedure btnEditarClick(Sender: TObject);
    procedure btnGravarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
  private
    { Private declarations }
    Inserir : Boolean;
    _Pessoa : TPessoaList;
    dsPessoa : TDsPessoa;

    procedure Botoes(ModoEdicao : Boolean);
  public
    { Public declarations }
  end;

var
  frmMain: TfrmMain;

implementation

{$R *.dfm}

procedure TfrmMain.Botoes(ModoEdicao: Boolean);
begin
  btnNovo.Enabled := not ModoEdicao;
  btnEditar.Enabled := (not ModoEdicao) and (_Pessoa.Count > 0);
  btnCancelar.Enabled := ModoEdicao;
  btnGravar.Enabled := ModoEdicao;
  gbCadastro.Enabled := ModoEdicao;

  if ModoEdicao = False then
  begin
    edtNome.Text := '';
    edtCPFCNPJ.Text := '';
  end;

  cxGrid.Enabled := not ModoEdicao;
end;

procedure TfrmMain.btnCancelarClick(Sender: TObject);
begin
  Inserir := False;
  Botoes(False);
end;

procedure TfrmMain.btnEditarClick(Sender: TObject);
var
  I : Integer;
begin
  Inserir := False;
  Botoes(True);

  edtID.Value := _Pessoa[cxGridTableView.DataController.GetSelectedRowIndex(0)].ID;
  edtNome.Text := _Pessoa[cxGridTableView.DataController.GetSelectedRowIndex(0)].Nome;
  edtCPFCNPJ.Text := _Pessoa[cxGridTableView.DataController.GetSelectedRowIndex(0)].CPF_CNPJ;
end;

procedure TfrmMain.btnGravarClick(Sender: TObject);
var
  Pessoa : TPessoa;
begin
  if Inserir then
  begin
    Pessoa := TPessoa.Create();
    Pessoa.ID := _Pessoa.Count + 1;
  end
  else
  begin
    Pessoa := _Pessoa[cxGridTableView.DataController.GetSelectedRowIndex(0)];
  end;

  Pessoa.Nome := edtNome.Text;
  Pessoa.CPF_CNPJ := edtCPFCNPJ.Text;

  if Inserir then
  begin
    _Pessoa.Add(Pessoa);
  end;

  cxGridTableView.DataController.CustomDataSource.DataChanged();
  Botoes(False);
end;

procedure TfrmMain.btnNovoClick(Sender: TObject);
begin
  Inserir := True;
  Botoes(True);
end;

procedure TfrmMain.FormCreate(Sender: TObject);
var
  Pessoa : TPessoa;
begin
  _Pessoa := TPessoaList.Create();
  dsPessoa := TDsPessoa.Create(cxGridTableView);
  dsPessoa.LinkRecords := _Pessoa;
  cxGridTableView.DataController.CustomDataSource := dsPessoa;

  cxGridColumnID.DataBinding.Data := Pointer(0);
  cxGridColumnNome.DataBinding.Data := Pointer(1);
  cxGridColumnCPFCNPJ.DataBinding.Data := Pointer(2);

  cxGridTableView.DataController.CustomDataSource.DataChanged();

  Botoes(False);
end;

end.
