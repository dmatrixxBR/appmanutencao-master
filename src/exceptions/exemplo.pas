
try
   //aqui coloque o código que deseja executar no seu sistema
   //se acontecer uma excessão, o código abaixo vai jogar isso para aquela Unit de tratamentos, se o erro não estiver tratado la, ele mostra propaga o erro para o usuário, caso contrário mostra o tratamento que você fez.
except
   on erro: Exception do begin
      if not TVerificaException.TrataExcception(erro) then begin
         Assert(False, '');
         TVerificaException.SalvarLog(erro);
         raise;
      end;
   end;
end;