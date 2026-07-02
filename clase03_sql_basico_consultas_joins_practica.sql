--Hacer un select de todas las tablas seleccionando todas las columnas, 
--utilizando las dos maneras posibles de seleccionar todas las columnas.

select * from employeeS; 
select * from departments;


-- Hacer un select de cada tabla ordenando por la PK
-- de forma ascendente y luego de forma Descendente.

select EMPNO from employees
order by EMPNO asc;

--3) Hacer un select de cada tabla "renombrando" cada columna por su correspondiente nombre en español

SELECT DPT.deptno as numero , DPT.name as nombre
FROM DEPARTMENTS DPT;


--4) En el select de la tabla de empleados mostrar una nueva columna llamada sueldo_total que multiplique el sueldo por el campo comision

select EMP.EMPNO , EMP.name , EMP.JOB , EMP.salary * EMP.commission as CALCULO
from employees EMP

--5) En el select de la tabla de empleados mostrar una nueva columna llamada aumento equivalente al sueldo m�s un 20% de aumento

select EMP.EMPNO , EMP.name , EMP.JOB , EMP.salary + ((EMP.salary * 20) / 100) as SUELDO_MAS_20
from employees EMP;


--6) Hacer una query donde se pueda obtener todos los diferentes nombres de los empleados.

SELECT DISTINCT EMP.NAME 
from EMPLOYEES EMP;

--7) Obtener todos los diferentes nombres de departamento.

SELECT DISTINCT DPT.NAME FROM DEPARTMENTS DPT;


--8) Obtener todos los empleados en que la fecha de contrato sea menor al 01/01/2019

SELECT * FROM EMPLOYEES EMP
where EMP.HIREDATE < '01/01/2019' ;

--9) Obtener todos los nombres de los empleados que pertenecen al departamento con el nombre "Engineering"

SELECT * FROM DEPARTMENTS DPT
where DPT.NAME = 'Engineering';


--10) Obtener todos los nombres de los empleados que pertenecen al departamento con el nombre "Engineering"
--   y que tengan un salario entre 1000 y 5500

SELECT * FROM EMPLOYEES EMP
where EMP.NAME = 'Engineering' AND EMP.SALARY between 1000 and 5500;

--11) Obtener todos los empleados y todos los departamentos (tabla original de departamentos), tengan o no tengan valores en comun.

select * from employees , departments;


--12) Obtener el listado de empleados que tengan departamento, con la descripcion del mismo, 
--pero asi mismo traer todas las descripciones de los departamentos aunque no esten asignados a ningun empleado.

select DPT.NAME , EMP.EMPNO , EMP.NAME , EMP.JOB , EMP.HIREDATE , EMP.SALARY , EMP.SALARY , EMP.COMMISSION
from DEPARTMENTS DPT , EMPLOYEES EMP
where EMP.DEPTNO IS NOT NULL;


--13) Mostrar los departamentos que tienen misma descripcion (en misma tabla original) pero el id es diferente



