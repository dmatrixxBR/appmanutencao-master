unit Main;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TfMain = class(TForm)
    btDatasetLoop: TButton;
    btThreads: TButton;
    btStreams: TButton;
    btExceptions: TButton;
    procedure btDatasetLoopClick(Sender: TObject);
    procedure btStreamsClick(Sender: TObject);
    procedure btExceptionsClick(Sender: TObject);
    procedure btThreadsClick(Sender: TObject);
  private
  public
  end;

var
  fMain: TfMain;

implementation

uses
  DatasetLoop, ClienteServidor, untException, Threads;

{$R *.dfm}

procedure TfMain.btDatasetLoopClick(Sender: TObject);
begin
  Application.CreateForm(TfDatasetLoop, fDatasetLoop);
  fDatasetLoop.ShowModal;
  fDatasetLoop.Release;
end;

procedure TfMain.btExceptionsClick(Sender: TObject);
begin
  Application.CreateForm(TfrmExceptions, frmExceptions);
  frmExceptions.ShowModal;
  frmExceptions.Release;

end;

procedure TfMain.btStreamsClick(Sender: TObject);
begin
  Application.CreateForm(TfClienteServidor, fClienteServidor);
  fClienteServidor.ShowModal;
  fClienteServidor.Release;
end;

procedure TfMain.btThreadsClick(Sender: TObject);
begin
 Application.CreateForm(TFThreads, fThreads);
 fThreads.ShowModal;
 fThreads.Release;
end;

end.
