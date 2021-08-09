program Foo;

uses
  Vcl.Forms,
  Main in 'Main.pas' {fMain},
  DatasetLoop in 'DatasetLoop.pas' {fDatasetLoop},
  ClienteServidor in 'ClienteServidor.pas' {fClienteServidor},
  UAssertionErro in 'exceptions\UAssertionErro.pas',
  UVerificaException in 'exceptions\UVerificaException.pas',
  untException in 'exceptions\untException.pas' {frmExceptions},
  Threads in 'Threads.pas' {FThreads};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfMain, fMain);
  Application.CreateForm(TFThreads, FThreads);
  Application.Run;
end.
