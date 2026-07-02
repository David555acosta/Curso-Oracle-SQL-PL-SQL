--1) Agregar manejo de error en cada Procedure y Function creados en la clase anterior.
--Para esto tenga en cuenta que tipo de Exception se ajusta más a cada caso.
--2) En al menos uno de los Procedure o Function cree una exception customizada.
--Dispare esa exception en el código cuando considere necesario.


CREATE OR REPLACE PROCEDURE DIVISION_BY(X IN NUMBER , Y IN NUMBER , SALIDA OUT NUMBER) 
IS
mi_error EXCEPTION;
BEGIN

    IF Y = 0
        THEN    
            RAISE mi_error;
    END IF;
    
    SALIDA := X / Y;
EXCEPTION
    WHEN mi_error THEN
        DBMS_OUTPUT.PUT_LINE('Error manejado');
END;

SET SERVEROUTPUT ON;
DECLARE
 RES NUMBER;
BEGIN
 DIVISION_BY (1,0,RES);
 DBMS_OUTPUT.PUT_LINE(RES);
END;