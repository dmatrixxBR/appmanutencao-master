unit UVerificaException;

interface

uses
   Winapi.Windows,
   Winapi.Messages,
   System.SysUtils,
   System.Variants,
   System.Classes,
   System.UItypes,
   Vcl.Graphics,
   Vcl.Controls,
   Vcl.Forms,
   Vcl.Dialogs,
   Vcl.ExtCtrls,
   Vcl.StdCtrls,
   DB;

type
   TVerificaException = class
   public
      class function TrataException(E:Exception): boolean;

      class procedure setLineErro(Value: Integer);
      class procedure setFileErro(Value: string);

      class function getLineErro: Integer;
      class function getFileErro: string;

      class procedure SalvarLog(E:Exception);
   end;

implementation

{ TMyExceptions }

var FcFileErro: string;
    FcLineErro: Integer;


class function TVerificaException.TrataException(E: Exception):boolean;
begin
result := True;

    if E is EConvertError then
      Begin
       MessageDlg('Erro de Conversão',mtError,[mbok],0);
      End

    else
      begin
        result := False;
        MessageDlg('Erro - '+E.Message,mtError,[mbok],0);
      end;

 SalvarLog(E);

end;


class function TVerificaException.getFileErro: string;
begin
   result:= FcFileErro;
end;

class function TVerificaException.getLineErro: Integer;
begin
   result:= FcLineErro;
end;

class procedure TVerificaException.setFileErro(Value: string);
begin
   FcFileErro:= Value;
end;

class procedure TVerificaException.setLineErro(Value: Integer);
begin
   FcLineErro:= Value;
end;

class procedure TVerificaException.SalvarLog(E: Exception);
var
   ListaErro: TStringList;
   LocalDir, LocalFile: string;
begin
   LocalDir:= ExtractFilePath(Application.ExeName) + 'log';
   if not DirectoryExists(LocalDir) then
      CreateDir(LocalDir);
   LocalFile:= LocalDir + '\' + FormatDateTime('yyyy-mm-dd', Now) + '-erro.txt';
   ListaErro:= TStringList.Create;
   try
      if FileExists(LocalFile) then
         ListaErro.LoadFromFile(LocalFile);

      ListaErro.Add('--------------------------------------------------');
      ListaErro.Add('Data: ' + DateToStr(Date));
      ListaErro.Add('Hora: ' + TimeToStr(Time));
      ListaErro.Add('Erro: ' + E.Message);
      ListaErro.Add('Classe: ' + E.ClassName);
      ListaErro.Add('Linha: ' + IntToStr(FcLineErro));
      ListaErro.Add('Arquivo: ' + FcFileErro);
      ListaErro.SaveToFile(LocalFile);
   finally
      ListaErro.Free;
   end;
end;

end.
