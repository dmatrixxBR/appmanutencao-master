unit UAssertionErro;

interface

implementation

uses Winapi.Windows, System.SysUtils, UVerificaException;

procedure AssertErrorHandler(const Message, Filename: string; LineNumber: Integer; ErrorAddr: Pointer);
var
   LocalUnit: string;
begin
   LocalUnit:= ExtractFileName(Filename);
   TVerificaException.setLineErro(LineNumber);
   TVerificaException.setFileErro(LocalUnit);
end;

initialization
   AssertErrorProc := @AssertErrorHandler;

end.