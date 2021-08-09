unit ClienteServidor;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Vcl.StdCtrls, Datasnap.DBClient, Data.DB,
  UVerificaException,system.Threading;

type
  TServidor = class
  private
    FPath: AnsiString;
  public
    constructor Create;
    //Tipo do parâmetro não pode ser alterado
    function SalvarArquivos(AData: OleVariant; nome:string = ''): Boolean;
  end;

  TfClienteServidor = class(TForm)
    ProgressBar: TProgressBar;
    btEnviarSemErros: TButton;
    btEnviarComErros: TButton;
    btEnviarParalelo: TButton;
    procedure FormCreate(Sender: TObject);
    procedure btEnviarSemErrosClick(Sender: TObject);
    procedure btEnviarComErrosClick(Sender: TObject);
    procedure moveProgressBar(Botao:TButton;Sizing:integer);
    procedure btEnviarParaleloClick(Sender: TObject);
  private
    FPath: AnsiString;
    FServidor: TServidor;

    function InitDataset: TClientDataset;
  public
  end;

var
  fClienteServidor: TfClienteServidor;

const
  QTD_ARQUIVOS_ENVIAR = 100;

implementation

uses
  IOUtils;

{$R *.dfm}

procedure TfClienteServidor.btEnviarComErrosClick(Sender: TObject);
var
  cds: TClientDataset;
  i: Integer;
begin
try
   ProgressBar.Position := 0;
   ProgressBar.Max := QTD_ARQUIVOS_ENVIAR;

  for i := 1 to QTD_ARQUIVOS_ENVIAR do
  begin

    cds := InitDataset;
    cds.Append;
    TBlobField(cds.FieldByName('Arquivo')).LoadFromFile(String(FPath));
    cds.Post;
    FServidor.SalvarArquivos(cds.Data,intToStr(i));
    ProgressBar.Position := ProgressBar.Position + 1;

    {$REGION Simulação de erro, não alterar}
    if i = (QTD_ARQUIVOS_ENVIAR/2) then
      FServidor.SalvarArquivos(NULL);
    {$ENDREGION}
    cds.Close;
    FreeAndNil(cds);
  end;


//  FServidor.SalvarArquivos(cds.Data);
except
  On erro:Exception do
    Begin
          TVerificaException.TrataException(erro);

    End;


end;

end;

procedure TfClienteServidor.btEnviarParaleloClick(Sender: TObject);
begin
//enviar paralelo
ProgressBar.Position:=0;
ProgressBar.Max := QTD_ARQUIVOS_ENVIAR;
TParallel.For(1,QTD_ARQUIVOS_ENVIAR,
procedure (Index:integer)
  Begin
  Sleep(100);
  TThread.Queue(TThread.CurrentThread,
  procedure
    var
    cds:TclientDataSet;
    Begin
      cds := InitDataset;
      cds.Append;
      TBlobField(cds.FieldByName('Arquivo')).LoadFromFile(String(FPath));
      cds.Post;
      ProgressBar.Position := ProgressBar.Position + 1;
      FServidor.SalvarArquivos(cds.Data,intToStr(Index));
      Application.ProcessMessages;
      cds.Close;
      FreeAndNil(cds);
    End);

  End);
end;

procedure TfClienteServidor.btEnviarSemErrosClick(Sender: TObject);
begin
try
    moveProgressBar(btEnviarSemErros,QTD_ARQUIVOS_ENVIAR);
except
  On erro:Exception do
    Begin
      TVerificaException.TrataException(erro);
    End;


end;
end;

procedure TfClienteServidor.FormCreate(Sender: TObject);
begin
{$WARN SYMBOL_PLATFORM OFF}
  inherited;
  FPath := AnsiString(IncludeTrailingBackslash(ExtractFilePath(ParamStr(0))) + 'pdf.pdf');
  FServidor := TServidor.Create;
{$WARN SYMBOL_PLATFORM ON}
end;


function TfClienteServidor.InitDataset: TClientDataset;
begin
  Result := TClientDataset.Create(nil);
  Result.FieldDefs.Add('Arquivo', ftBlob);
  Result.CreateDataSet;
end;


procedure TfClienteServidor.moveProgressBar( Botao: TButton;
  Sizing: integer);
var
  i: integer;
  cds: TClientDataSet;
begin
  try
    Botao.Enabled := false;
    ProgressBar.Position := 0;
    ProgressBar.Max := Sizing;
    for i := 1 to Sizing do
    begin
      cds := InitDataset;
      cds.Append;
      TBlobField(cds.FieldByName('Arquivo')).LoadFromFile(String(FPath));
      cds.Post;
      ProgressBar.Position := ProgressBar.Position + 1;
      FServidor.SalvarArquivos(cds.Data,intToStr(i));
      Application.ProcessMessages;
      cds.Close;
      FreeAndNil(cds);
    end;

  finally
    Botao.Enabled := true;
  end;

end;

{ TServidor }

constructor TServidor.Create;
begin
  FPath := AnsiString(ExtractFilePath(ParamStr(0)) + 'Servidor\');
end;

function TServidor.SalvarArquivos(AData: OleVariant;nome:string): Boolean;
var
  cds: TClientDataSet;
  FileName: string;
begin
Result := False;
  try
   if AData <> NULL then
    Begin
      cds := TClientDataset.Create(nil);
      cds.Data := AData;

      {$REGION Simulação de erro, não alterar}
      if cds.RecordCount = 0 then
        Exit;
      {$ENDREGION}

      cds.First;

      while not cds.Eof do
      begin
        FileName := String(FPath) + nome + '.pdf';
        if TFile.Exists(FileName) then
          TFile.Delete(FileName);

        TBlobField(cds.FieldByName('Arquivo')).SaveToFile(FileName);
        cds.Next;
      end;

      Result := True;
      cds.Close;
      FreeAndNil(cds);
    End;

  except

    raise;
  end;
end;

end.
