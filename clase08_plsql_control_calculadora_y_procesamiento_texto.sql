--A) Realizar una calculadora en donde:


--1) Se puedan realizar todas las operaciones matemáticas aprendidas
--2) El calculo de las operaciones deben estar realizadas en funciones
--3) El programa que se ejecute debe ser un procedure que reciba por parametro dos valores numericos 
--y una operación a realizar
--4) Que se invoque al procedure al menos 6 veces o hasta que se indique que no se quiere continuar
--5) se deben mostrar los resultados por pantalla indicando la operación realizada

DBMS_OUTPUT.PUT_LINE(1);

CREATE OR REPLACE FUNCTION SUMA(X NUMBER, Y NUMBER)
RETURN NUMBER
AS
BEGIN
  RETURN X + Y;
END;


CREATE OR REPLACE FUNCTION RESTA(X NUMBER, Y NUMBER)
RETURN NUMBER
AS
BEGIN
  RETURN X - Y;
END;


CREATE OR REPLACE FUNCTION PRODUCTO(X NUMBER, Y NUMBER)
RETURN NUMBER
AS
BEGIN
  RETURN X * Y;
END;



CREATE OR REPLACE FUNCTION DIVISION(X NUMBER, Y NUMBER)
RETURN NUMBER
AS
BEGIN 
    IF Y >= 0 THEN
        RETURN X / Y;
    ELSE
        RAISE_APPLICATION_ERROR(-20001, 'Valor inválido');
    END IF;
END;


-- creando procedimiento
CREATE OR REPLACE PROCEDURE CALCULADORA (
  X IN  NUMBER,
  Y IN NUMBER ,
  OP IN VARCHAR,
  Z OUT NUMBER)
IS  
BEGIN
    IF OP = 'SUMA' THEN 
        Z := SUMA(X, Y);

    ELSIF OP = 'RESTA' THEN 
        Z := RESTA(X, Y);

    ELSIF OP = 'PRODUCTO' THEN 
        Z := PRODUCTO(X, Y);

    ELSIF OP = 'DIVISION' THEN 
        Z := DIVISION(X, Y);

    ELSE
        DBMS_OUTPUT.PUT_LINE('Operación no válida');
    END IF;
END;

DECLARE
RES NUMBER;
BEGIN
    FOR i IN 1..5 LOOP
        CALCULADORA(4, 1, 'DIVISION', RES);
        DBMS_OUTPUT.PUT_LINE(RES);
    END LOOP;
END;






--B) Realizar un algoritmo donde dado un texto libre se inserte en una tabla cada una de las palabras
-- que contiene el mismo, sin aceptar repetidos, y enumerandolas con un ID asignado con una secuencia


CREATE SEQUENCE SECX
START WITH 10
INCREMENT BY 1
MINVALUE 1
MAXVALUE 9999999999
NOCACHE
NOCYCLE;


CREATE TABLE XXX (
    IDX INTEGER NOT NULL PRIMARY KEY,
    LETRA VARCHAR2(1000) NOT NULL,   -- o VARCHAR(1)
    REPETICIONES INTEGER NOT NULL
);



CREATE PROCEDURE RECORRERPALABRA(X varchar2) 
IS
BEGIN
    FOR i IN 1..X.LENGTH LOOP
        INSERT INTO XXX VALUES (SEQUENCE.NEXTVAL , i , 1);
    END LOOP;
END;


SET SERVEROUTPUT ON;
BEGIN
 RECORRERPALABRA('HOLA');
 SELECT * FROM XXX;
END;






