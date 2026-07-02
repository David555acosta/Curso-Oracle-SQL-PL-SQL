DECLARE
NOMBREVAR VARCHAR(2000);
APELLIDOVAR VARCHAR(2000);
ERRORVAR VARCHAR(30);
BEGIN
NOMBREVAR := 'Camila';
APELLIDOVAR := 'Diaz';
    UPDATE ALUMNOS SET NOMBRE = NOMBBREVAR
    WHERE APELLIDO = APELLIDOVAR;
    COMMIT;
    DBMS_OUTPUT.put_line ('Se modificaron'||sql%rowcount||'Registros');
EXCEPTION
    WHEN OTHERS THEN
        ERRORVAR := SQLERRM;
        DBMS_OUTPUT.put_line ('Error update'|| ERRORVAR);
        ROLLBACK;
END;



--1) Crear un bloque de código anónimo que declare dos variables x , y 
--e imprima por pantalla la suma de los mismos 

SET SERVEROUTPUT ON;
DECLARE 
V1 NUMBER := 1;
V2 NUMBER := 2 ;
SALIDA NUMBER;
BEGIN
SALIDA := V1 + V2;
DBMS_OUTPUT.put_line (SALIDA);
END;



--2) Crear una función f_add(x number,y number) que tome dos parametros  x , y  
--y devuelva la suma de los mismos.

create function F_ADD(V1 NUMBER , V2
number) return NUMBER as
BEGIN
RETURN V1 + V2;
END;

SELECT F_ADD(1,5) FROM DUAL;


--3) Crear un Procedimiento p_add(x number,y number) que tome dos parametros  x , y
--e imprima por pantalla la suma de los mismos.

CREATE PROCEDURE P_ADD(X IN NUMBER , Y IN NUMBER , SALIDA OUT NUMBER) 
IS
BEGIN
SALIDA := X + Y;
END;

SET SERVEROUTPUT ON;
DECLARE
 RES NUMBER;
BEGIN
 P_ADD (1,2,RES);
 DBMS_OUTPUT.PUT_LINE(RES);
END;



--4) Crear un bloque de código anónimo que declare dos variables  x , y 
--e imprima por pantalla sus resta.


CREATE PROCEDURE P_RESS(X IN NUMBER , Y IN NUMBER , SALIDA OUT NUMBER) 
IS
BEGIN
SALIDA := X - Y;
END;

SET SERVEROUTPUT ON;
DECLARE
 RES NUMBER;
BEGIN
 P_RESS (1,2,RES);
 DBMS_OUTPUT.PUT_LINE(RES);
END;

--5) Crear una función f_sub(x number,y number) que tome dos valores  x , y  
--y devuelva su resta


create function F_RESTA(V1 varchar2 , V2 number) RETURN
VARCHAR AS
BEGIN
return V1 - V2;
END;

DECLARE
SALIDA NUMBER;
BEGIN
SALIDA := F_RESTA(1,2);
DBMS_OUTPUT.PUT_LINE(SALIDA);
END;


--7) Crear una función que declare dos variables  x := "Hello" , 
--y := "your_name" e imprima por pantalla los dos string de x e y concatenados


DECLARE
x varchar(100);
y varchar(100);

BEGIN

x := 'Hello';
y := 'David';

DBMS_OUTPUT.PUT_LINE(x || y);
END;



--9) Crear un procedimiento p_print(x varchar2,y varchar2) que tome dos valores  x , y  
--y los imprima concatenados.

CREATE PROCEDURE concatSalida(STR1 IN varchar2,STR2 IN varchar2 , SALIDA OUT varchar2)
IS
BEGIN
SALIDA := STR1 || STR2;
END;

SET SERVEROUTPUT ON;
DECLARE
 RES varchar2(100);
BEGIN
 concatSalida('David','Facha',RES);
 DBMS_OUTPUT.PUT_LINE(RES);
END;

--8) Crear una función f_print(x varchar2,y varchar2) que tome dos valores  x , y  
--y devuelva los strings concatenados de ambas variables


CREATE OR REPLACE FUNCTION F_CONCAT(STR1 VARCHAR2,STR2 VARCHAR2
) RETURN
VARCHAR2
AS
BEGIN
    RETURN STR1 || STR2;
END;

SET SERVEROUTPUT ON;
DECLARE
    SAL VARCHAR2(100);
BEGIN
    SAL := F_CONCAT('David', 'Facha');
    DBMS_OUTPUT.PUT_LINE(SAL);
END;


--10) crear una función que devuelva el dia actual

CREATE OR REPLACE FUNCTION FECHA
RETURN
DATE
AS
BEGIN
    RETURN SYSDATE;
END;

SET SERVEROUTPUT ON;
DECLARE
    SAL DATE;
BEGIN
    SAL := FECHA;
    DBMS_OUTPUT.PUT_LINE(SAL);
END;


--11) crear un procedimiento que dada una cadena de texto, imprima por pantalla el mismo 
--texto en minusculas o mayusculas depediendo el parametro ingresado


CREATE OR REPLACE FUNCTION IMPRIMIRCADENA(
    metodo VARCHAR2,
    cadena VARCHAR2
) RETURN VARCHAR2
AS
BEGIN
    RETURN CASE 
        WHEN metodo = 'MAYUS' THEN UPPER(cadena)
        WHEN metodo = 'MINUS' THEN LOWER(cadena)
        ELSE 'Metodo no valido'
    END;
END;

SET SERVEROUTPUT ON;
DECLARE
    SAL VARCHAR2(100);
BEGIN
    SAL := IMPRIMIRCADENA('MAYUS' , 'David');
    DBMS_OUTPUT.PUT_LINE(SAL);
END;



--12) Al procedimiento anterior agregarle que al texto a imprimir se le reemplacen 
--todas las vocales con acentos por vocales sin acento y si el texto no tuviera vocales con acentos,
--que imprima por pantalla un mensaje indicando "Error: el texto ingresado es invalido"




--13) crear una función que dada una Fecha de Nacimiento, se calcule la edad actual

CREATE OR REPLACE FUNCTION CALCULAR_EDAD(EDAD DATE
) RETURN
NUMBER
AS
BEGIN
    RETURN FLOOR(MONTHS_BETWEEN(SYSDATE, EDAD) / 12);
END;

SET SERVEROUTPUT ON;
DECLARE
    SAL NUMBER;
BEGIN
    SAL := CALCULAR_EDAD(TO_DATE('08-05-1945','DD-MM-YYYY'));
    DBMS_OUTPUT.PUT_LINE(SAL);
END;


--14) crear una función que dada una Fecha de Nacimiento, se calcule la edad 
--que se tenia según fecha ingresada por parametro.

CREATE OR REPLACE FUNCTION CALCULAR_EDAD_POTENCIADO(EDAD DATE , CALCULARDESDE DATE
) RETURN
NUMBER
AS
BEGIN
    RETURN CASE
        WHEN FLOOR(MONTHS_BETWEEN(CALCULARDESDE, EDAD) / 12) >= 0
            THEN FLOOR(MONTHS_BETWEEN(CALCULARDESDE, EDAD) / 12)
            ELSE 0
        END;
END;

SET SERVEROUTPUT ON;
DECLARE
    SAL NUMBER;
BEGIN
    SAL := CALCULAR_EDAD_POTENCIADO(TO_DATE('08-05-1945','DD-MM-YYYY'),TO_DATE('08-05-1946','DD-MM-YYYY'));
    DBMS_OUTPUT.PUT_LINE(SAL);
END;