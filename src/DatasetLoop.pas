unit DatasetLoop;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids,
  Datasnap.DBClient, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.DBCtrls, UVerificaException;

type
  TfDatasetLoop = class(TForm)
    DBGrid: TDBGrid;
    ClientDataSet: TClientDataSet;
    DataSource: TDataSource;
    btDeletarPares: TButton;
    DBNavigator: TDBNavigator;
    procedure FormCreate(Sender: TObject);
    procedure btDeletarParesClick(Sender: TObject);
  private
  public
  end;

var
  fDatasetLoop: TfDatasetLoop;

implementation

{$R *.dfm}

procedure TfDatasetLoop.btDeletarParesClick(Sender: TObject);
begin
try
  ClientDataSet.First;
  while not ClientDataSet.Eof do
  begin
    if ClientDataSet.FieldByName('Field2').AsInteger mod 2 = 0 then
       ClientDataSet.Delete
       else
       ClientDataSet.Next;
  end;
except
  On erro:Exception do
    Begin
      TVerificaException.TrataException(erro)
    End;

end;
end;

procedure TfDatasetLoop.FormCreate(Sender: TObject);
begin

try


  ClientDataSet.CreateDataSet;

  ClientDataSet.Append;
  ClientDataSet.FieldByName('Field1').AsString := 'Field1';
  ClientDataSet.FieldByName('Field2').AsInteger := 1;
  ClientDataSet.Post;

  ClientDataSet.Append;
  ClientDataSet.FieldByName('Field1').AsString := 'Field2';
  ClientDataSet.FieldByName('Field2').AsInteger := 2;
  ClientDataSet.Post;

  ClientDataSet.Append;
  ClientDataSet.FieldByName('Field1').AsString := 'Field3';
  ClientDataSet.FieldByName('Field2').AsInteger := 2;
  ClientDataSet.Post;

  ClientDataSet.Append;
  ClientDataSet.FieldByName('Field1').AsString := 'Field4';
  ClientDataSet.FieldByName('Field2').AsInteger := 1;
  ClientDataSet.Post;

  ClientDataSet.Append;
  ClientDataSet.FieldByName('Field1').AsString := 'Field5';
  ClientDataSet.FieldByName('Field2').AsInteger := 2;
  ClientDataSet.Post;

  ClientDataSet.Append;
  ClientDataSet.FieldByName('Field1').AsString := 'Field6';
  ClientDataSet.FieldByName('Field2').AsInteger := 2;
  ClientDataSet.Post;

  ClientDataSet.Append;
  ClientDataSet.FieldByName('Field1').AsString := 'Field7';
  ClientDataSet.FieldByName('Field2').AsInteger := 2;
  ClientDataSet.Post;

  ClientDataSet.Append;
  ClientDataSet.FieldByName('Field1').AsString := 'Field8';
  ClientDataSet.FieldByName('Field2').AsInteger := 1;
  ClientDataSet.Post;

  ClientDataSet.Append;
  ClientDataSet.FieldByName('Field1').AsString := 'Field9';
  ClientDataSet.FieldByName('Field2').AsInteger := 2;
  ClientDataSet.Post;

  ClientDataSet.Append;
  ClientDataSet.FieldByName('Field1').AsString := 'Field10';
  ClientDataSet.FieldByName('Field2').AsInteger := 1;
  ClientDataSet.Post;
except
  On erro:Exception do
    Begin
      if not TVerificaException.TrataException(erro) then
        Begin
        TVerificaException.SalvarLog(erro);
        raise;
        End;
    End;
end;

end;

end.
