unit uPessoa;

interface

uses System.Generics.Collections, cxCustomData, cxGridTableView, cxGridCustomTableView;

type
  TPessoa = class
  private
    FID: Int64;
    FNome: String;
    FCPF_CNPJ: String;

    procedure SetCPF_CNPJ(const Value: String);
    procedure SetID(const Value: Int64);
    procedure SetNome(const Value: String);
  published
    property ID : Int64 read FID write SetID;
    property Nome : String read FNome write SetNome;
    property CPF_CNPJ : String read FCPF_CNPJ write SetCPF_CNPJ;
  public

  end;

  TPessoaList = class(TList<TPessoa>)
  private
  { private declarations }

  public
  { public declarations }

  end;

  TDsPessoa = class(TcxCustomDataSource)
  private
  { private declarations }
    FView : TcxGridTableView;
    FLinkRecords : TPessoaList;

    procedure SetLinkRecords(const Value: TPessoaList);
    function GetDataBinding(aItemIndex : integer) : TcxGridItemDataBinding;
  published
    property LinkRecords : TPessoaList read FLinkRecords write SetLinkRecords;

  protected
    { unit cxCustomData (Detalhe que todos estes métodos tem que existir,
                         se não a grid entende que não há registro, tanto
                         por causa do RecordCount como do ItemHandle }
    Function GetRecordCount: Integer; override;
    Function GetItemHandle(AItemIndex: Integer): TcxDataItemHandle; override;
    Function GetValue(aRecordHandle: TcxDataRecordHandle; aItemHandle: TcxDataItemHandle) : Variant; override;
    Procedure SetValue(ARecordHandle: TcxDataRecordHandle; AItemHandle: TcxDataItemHandle; const AValue: Variant); override;
  public
  { public declarations }
    Constructor Create(cxGridTableView : TcxGridTableView);
  end;

implementation

{ TPessoa }

procedure TPessoa.SetCPF_CNPJ(const Value: String);
begin
  FCPF_CNPJ := Value;
end;

procedure TPessoa.SetID(const Value: Int64);
begin
  FID := Value;
end;

procedure TPessoa.SetNome(const Value: String);
begin
  FNome := Value;
end;

{ TDsPessoa }

constructor TDsPessoa.Create(cxGridTableView: TcxGridTableView);
begin
  inherited Create();
  FView := cxGridTableView;
end;

function TDsPessoa.GetDataBinding(aItemIndex: integer): TcxGridItemDataBinding;
begin
  result := TcxCustomGridTableItem(DataController.GetItem(AItemIndex)).DataBinding;
end;

Function TDsPessoa.GetItemHandle(AItemIndex: Integer): TcxDataItemHandle;
begin
  result := TcxDataItemHandle(GetDataBinding(aItemIndex));
end;

function TDsPessoa.GetRecordCount: Integer;
begin
  if FLinkRecords = nil then
  begin
    Result := 0;
  end
  else
  begin
    Result := FLinkRecords.Count;
  end;
end;

function TDsPessoa.GetValue(aRecordHandle: TcxDataRecordHandle;aItemHandle: TcxDataItemHandle): Variant;
var
  aDataBinding : TcxGridItemDataBinding;
  aRecordIndex : Integer;
begin
  aDataBinding := TcxGridItemDataBinding(aItemHandle);
  aRecordIndex := Integer(aRecordHandle);
  case Integer(aDataBinding.Data) of
    0 : Result := FLinkRecords[aRecordIndex].ID;
    1 : Result := FLinkRecords[aRecordIndex].Nome;
    2 : Result := FLinkRecords[aRecordIndex].CPF_CNPJ;
  end;
end;

procedure TDsPessoa.SetLinkRecords(const Value: TPessoaList);
begin
  FLinkRecords := Value;
end;

procedure TDsPessoa.SetValue(ARecordHandle: TcxDataRecordHandle;AItemHandle: TcxDataItemHandle; const AValue: Variant);
var
  aDataBinding : TcxGridItemDataBinding;
  aRecordIndex : Integer;
begin
  aDataBinding := TcxGridItemDataBinding(aItemHandle);
  aRecordIndex := Integer(aRecordHandle);
  case Integer(aDataBinding.Data) of
    0 : FLinkRecords[aRecordIndex].ID       := aValue;
    1 : FLinkRecords[aRecordIndex].Nome     := aValue;
    2 : FLinkRecords[aRecordIndex].CPF_CNPJ := aValue;
  end;
end;

end.
