
try
   //aqui coloque o c�digo que deseja executar no seu sistema
   //se acontecer uma excess�o, o c�digo abaixo vai jogar isso para aquela Unit de tratamentos, se o erro n�o estiver tratado la, ele mostra propaga o erro para o usu�rio, caso contr�rio mostra o tratamento que voc� fez.
except
   on erro: Exception do begin
      if not TVerificaException.TrataExcception(erro) then begin
         Assert(False, '');
         TVerificaException.SalvarLog(erro);
         raise;
      end;
   end;
end;