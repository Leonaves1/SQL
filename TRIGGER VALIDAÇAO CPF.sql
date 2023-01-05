SET SERVEROUTPUT ON;
CREATE OR REPLACE TRIGGER trg_cpf
BEFORE INSERT OR UPDATE OF nr_cpf
ON t_mc_cli_fisica
FOR EACH ROW
DECLARE
	PRAGMA AUTONOMOUS_TRANSACTION;
BEGIN
	pcd_validador_cpf(:new.nr_cpf);	
	DBMS_OUTPUT.PUT_LINE('CNPJ ANTIGO: ' || TO_CHAR(:old.nr_CPF));
	DBMS_OUTPUT.PUT_LINE('CNPJ NOVO: ' 	|| TO_CHAR(:new.nr_CPF));
EXCEPTION 
	WHEN OTHERS THEN RAISE;
END;