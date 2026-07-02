--1) Obtener todas las distintas localidades ordenadas alfabeticamente. Mostrarlas en Mayusculas.

SELECT * FROM EMPLOYEES;
SELECT * FROM DEPARTMENTS;

SELECT DISTINCT UPPER(DPT.LOCATION)
FROM DEPARTMENTS DPT
WHERE DPT.LOCATION IS NOT NULL
ORDER BY UPPER(DPT.LOCATION) DESC;


--2) Obtener todas las distintas personas ordenadas por nombre en forma descendente. 

SELECT DISTINCT INITCAP(EMP.NAME)
FROM EMPLOYEES EMP
WHERE EMP.NAME IS NOT NULL
ORDER BY INITCAP(EMP.NAME) DESC;


--3) Mostrar todos los datos de los departamentos agregando una columna "PAIS". 
--Cuando la localidad sea igual a PUNE la nueva columna debe ser Igual a "India".

SELECT DPT.DEPTNO AS NUMERO , DPT.NAME AS NOMBRE , 
CASE WHEN DPT.LOCATION = 'Pune' THEN 'INDIA' ELSE DPT.LOCATION END AS PAIS
FROM DEPARTMENTS DPT
WHERE DPT.LOCATION IS NOT NULL;


--4) Realizar el punto 3) pero esta vez con la función Decode

SELECT DPT.DEPTNO AS NUMERO , DPT.NAME AS NOMBRE , 
DECODE(DPT.LOCATION , 
'Pune' , 'INDIA',
DPT.LOCATION) AS PAIS
FROM DEPARTMENTS DPT
WHERE DPT.LOCATION IS NOT NULL;


--5)Mostrar todos los departamentos en minusculas

SELECT UPPER(DPT.DEPTNO) , UPPER(DPT.NAME) , UPPER(DPT.LOCATION)
FROM DEPARTMENTS DPT;


--6)Mostrar los nombres de los departamentos y las localidades en una nueva columna

--7)Obtener la primer palabra de cada valor de la columna job de la tabla de empleados

SELECT SUBSTR(EMP.JOB , 1 , 1) 
FROM EMPLOYEES EMP;


--8) Indique la longitud de cada columna string existente en la tabla de empleados

SELECT EMP.NAME AS NOMBRE  , EMP.JOB AS TRABAJO , LENGTH(EMP.NAME) AS LONG_NAME , LENGTH(EMP.JOB) AS LONG_JOB
FROM EMPLOYEES EMP
WHERE EMP.NAME IS NOT NULL AND EMP.JOB IS NOT NULL;


--9) Indique en que posicion se encuentra la primer letra a en el campo job de la tabla empleados

SELECT EMP.NAME AS NOMBRE  , EMP.JOB AS TRABAJO , INSTR(EMP.JOB , 'a' , 1, 1) AS INDICE_LETRA_a
FROM EMPLOYEES EMP
WHERE EMP.JOB IS NOT NULL;

--10) Rellene el campo empno con ceros a la izquierda hasta completar 5 digitos en total

SELECT LPAD(EMP.EMPNO , 5, '0') AS CON_MAS_DIGITOS, EMP.NAME AS NOMBRE  , EMP.JOB AS TRABAJO
FROM EMPLOYEES EMP;

--11) Rellene con puntos el campo nombre de la tabla empleados hasta completar 40 caracteres


SELECT RPAD(EMP.EMPNO , 40, '0') AS CON_MAS_DIGITOS, EMP.NAME AS NOMBRE  , EMP.JOB AS TRABAJO
FROM EMPLOYEES EMP;

--12) Reemplace en el campo localidad todas las vocales, por la misma vocal pero con acento

SELECT SUBSTR(
         REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(EMP.NAME,
         'a','á'),'e','é'),'i','í'),'o','ó'),'u','ú'),
       1,
       LENGTH(EMP.JOB))
FROM EMPLOYEES EMP;

--13) Redondee el campo salary sin decimales

select ROUND(EMP.SALARY , 0)
FROM EMPLOYEES EMP
WHERE EMP.SALARY IS NOT NULL;


--14) Haga lo mismo del punto 13 pero usando TRUNC


select TRUNC(EMP.SALARY , 0)
FROM EMPLOYEES EMP
WHERE EMP.SALARY IS NOT NULL;


--15) Quite las horas del campo hiredate usando TRUNC

SELECT EMP.EMPNO AS NOMBRE , EMP.NAME , TRUNC(EMP.HIREDATE, 'DD') AS FECHA_SINHORAS
FROM EMPLOYEES EMP
WHERE EMP.HIREDATE IS NOT NULL and EMP.EMPNO >= 2006;



--16) Quite las horas del campo hiredate usando mascaras de fechas

SELECT empno, name, TO_CHAR(hiredate, 'YYYY-MM-DD') AS hiredate_full
FROM EMPLOYEES; --visualizar fecha completa

--17) Devuelva la fecha actual usando diferentes funciones

SELECT SYSDATE FROM DUAL;
SELECT CURRENT_DATE FROM DUAL;

--18) Devuelva la fecha actual con difentes mascaras

SELECT TO_CHAR(SYSDATE , 'DD/MM/YYYY HH24:MI:SS') AS HORA_ACTUAL_SISTEMA_MASCARA
FROM DUAL;

SELECT TO_DATE('2019-07-19 17:20:45', 'YYYY-MM-DD HH24:MI:SS')
AS HORA_ACTUAL_SISTEMA_MASCARA
FROM DUAL;

--19) Devuelva la fecha del primer Jueves de Septiembre

SELECT NEXT_DAY(TO_DATE('31-08-' || TO_CHAR(SYSDATE, 'YYYY'), 'DD-MM-YYYY'), 'Jueves') AS PRIMER_JUEVES_SEPT
FROM DUAL;

--20) Devuelva la cantidad de meses que hay entre el primer dia de este año y su cumpleaños

--21) Extraiga en diferentes columnas, el dia, el mes y el año del campo hiredate
SELECT EXTRACT(EMP.HIREDATE)
FROM EMPLOYEES EMP
WHERE EMP.HIREDATE IS NOT NULL;
