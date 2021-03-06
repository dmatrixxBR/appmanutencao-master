unit untException;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.UiTypes,
   System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls,
  UVerificaException;

type
  TfrmExceptions = class(TForm)
    EditA: TEdit;
    EditB: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    RgOperacao: TRadioGroup;
    Button1: TButton;
    procedure Button1Click(Sender: TObject);
    function calcular(a,b:string):string;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmExceptions: TfrmExceptions;

implementation

{$R *.dfm}

procedure TfrmExceptions.Button1Click(Sender: TObject);
begin
try
if RgOperacao.ItemIndex >= 0 then
  Begin
    ShowMessage(calcular(Edita.Text,Editb.Text));
  End
else
   Begin
     messageDlg('Voc? precisa escolher uma opera??o!',
                  mtInformation,[mbOk],0);
   End;
except
On erro:Exception do
    Begin
        TVerificaException.TrataException(erro);
    End;

end;
end;

function TfrmExceptions.calcular(a, b: string): string;
const mensagem = 'O resultado ? %s';
var
 resultado:real;
begin
resultado:=0;
case RgOperacao.ItemIndex of
0:
  Begin
    resultado:= strToFloat(a) + strtoFloat(b);
  End;
1:
  Begin
    resultado:= strToFloat(a) - strToFloat(b);
  End;
2:
  Begin
    resultado:= strToFloat(a) * strToFloat(b);
  End;
3:
  Begin
    resultado:= strToFloat(a) / strToFloat(b);
  End;

end;
result:=  format(mensagem,[FloatToStr(resultado)]);
end;

end.
