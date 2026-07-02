--5) Obtener todos los empleados que si o si puedan tener la descripcion del departamento.

SELECT * FROM EMPLOYEES EMP 
INNER JOIN DEPARTMENTS DPT
ON EMP.DEPTNO = DPT.DEPTNO AND  DPT.NAME is not null;

--6) Obtener todos los empleados con las descripciones de los departamentos, si es que la tuvieran
--(es decir, si no la tuvieran a la descripcion del departamento igual los muestro).

SELECT EMP.EMPNO , EMP.NAME , EMP.JOB , DPT.NAME 
FROM EMPLOYEES EMP 
INNER JOIN DEPARTMENTS DPT
ON EMP.DEPTNO = DPT.DEPTNO ;
 
 
--7) Obtener todos los departamentos de las dos tablas de departamentos (la original y la nueva), sin registros repetidos.

SELECT * FROM EMPLOYEES
INTERSECT
SELECT * FROM EMPLOYEESBY;


--8) Obtener todos los departamentos de las dos tablas de departamentos (la original y la nueva), con los registros repetidos.


SELECT * FROM EMPLOYEES
UNION ALL
SELECT * FROM EMPLOYEESBY;


--9) Obtener solo los departamentos repetidos en las dos tablas de departamentos (la original y la nueva).

 
 --10) Combinar todos los empleados que NO tengan departamento con todos los departamentos de la tabla departamento.
 

 select EMP.NAME , EMP.DEPTNO , DPT.NAME from EMPLOYEES EMP , DEPARTMENTS DPT
 where EMP.DEPTNO is null;

--11) Obtener todos los empleados y todos los departamentos (tabla original de departamentos), tengan o no tengan valores en comun.


 select EMP.NAME AS NOMBRE_EMPLEADO , EMP.DEPTNO AS NRO_EMPLADO , DPT.DEPTNO AS ID_DEPARTAMENTO , DPT.NAME AS NOMBRE_DPT
 from EMPLOYEES EMP , DEPARTMENTS DPT;


--12) Obtener el listado de empleados que tengan departamento, con la descripcion del mismo, 
--pero asi mismo traer todas las descripciones de los departamentos aunque no esten asignados a ningun empleado.

SELECT EMP.DEPTNO AS NUMERO_DEPARTAMENTO , EMP.NAME AS NOMBRE_EMPLEADO , DPT.NAME AS NOMBRE_DEPARTAMENTO
FROM EMPLOYEES EMP ,DEPARTMENTS DPT
where EMP.DEPTNO IS NOT NULL;

--13) Mostrar los departamentos que tienen misma descripcion (en misma tabla original) pero el id es diferente.


