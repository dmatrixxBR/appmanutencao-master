unit Threads;

interface

uses
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
  System.Variants,
  System.Classes,
  System.Threading,
  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Dialogs,
  Vcl.StdCtrls,
  Vcl.ComCtrls;

type
  TFThreads = class(TForm)
    edtThreads: TEdit;
    edtTime: TEdit;
    Executar: TButton;
    Memo1: TMemo;
    ProgressBar1: TProgressBar;
    Label1: TLabel;
    Label2: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure ExecutarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FThreads: TFThreads;

implementation

{$R *.dfm}

procedure TFThreads.ExecutarClick(Sender: TObject);
begin
memo1.Lines.Clear;
ProgressBar1.Position:=0;
ProgressBar1.Max:= 101 * strToInt(edtThreads.Text);
executar.Enabled:=false;
TParallel.For(1,strToInt(edtThreads.Text),
procedure (Index:integer)
  Begin
  TThread.Queue(TThread.CurrentThread,
  procedure
    var
    i,linha:integer;
    Begin
      Sleep(Random(100));
      linha  := Memo1.CaretPos.Y;
      Memo1.Lines.Add('['+ inttostr(linha)  + '] - Iniciando Processamento');
      linha  := Memo1.CaretPos.Y;
      for i := 0 to 100 do
        Begin
         Sleep(strToInt(edtTime.Text));
         ProgressBar1.Position:= ProgressBar1.Position + 1;

        End;
      Memo1.Lines.Strings[linha-1]:= '['+ intToStr(linha-1)  + '] - Processamento Finalizado';


    End);

  End);

executar.Enabled:=true;
end;

procedure TFThreads.FormCreate(Sender: TObject);
begin
memo1.Lines.Clear;
edtThreads.Text:='10';
edtTime.Text:='5';

end;


end.
