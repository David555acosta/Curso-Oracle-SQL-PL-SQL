--1) Obtener todos los empleados que si o si tengan la descripcion del departamento usando IN

select * from employees;
select * from departments;
SELECT * FROM DEPARTMENTSBIS;

SELECT EMP.EMPNO , EMP.NAME , EMP.JOB , EMP.DEPTNO
FROM EMPLOYEES EMP
WHERE EMP.DEPTNO IN (
    SELECT DEPTNO
    FROM DEPARTMENTS
);

--2) Obtener todos los empleados que si o si tengan la descripcion del departamento usando EXISTS

SELECT EMP.EMPNO , EMP.NAME , EMP.JOB , EMP.DEPTNO
FROM EMPLOYEES EMP
WHERE EXISTS (
   SELECT 1 
   FROM DEPARTMENTS DPT
   WHERE DPT.DEPTNO = EMP.DEPTNO AND DPT.DEPTNO IS NOT NULL
);


--3) Obtener la cantidad de departamentos (misma descripcion) de las dos tablas de departamentos, sin repetidos

SELECT COUNT(*) AS cantidad_sin_repetidos
FROM (
    SELECT deptno, name, location FROM DEPARTMENTS
    UNION
    SELECT deptno, name, location FROM DEPARTMENTSBIS
);

--4) Obtener la cantidad de departamentos de las dos tablas  de departamentos, con repetidos

SELECT COUNT(*) AS cantidad_con_repetidos
FROM (
    SELECT deptno, name, location FROM DEPARTMENTS
    UNION ALL
    SELECT deptno, name, location FROM DEPARTMENTSBIS
);



--5) Mostrar la suma de los salarios de los empleados agrupados por departamento. 

SELECT SUM(EMP.SALARY) AS SALARIO_TOTAL_DPT
FROM EMPLOYEES EMP
INNER JOIN DEPARTMENTS DPT
ON EMP.DEPTNO = DPT.DEPTNO 
GROUP BY EMP.DEPTNO;

--6) Calcular el promedio de salarios de todos los empleados

SELECT AVG(EMP.SALARY) AS PROMEDIO_TOTAL_SALARIOS
FROM EMPLOYEES EMP
WHERE EMP.SALARY IS NOT NULL;

--7) Sumar el monto total de todos los salarios de los empleados

SELECT SUM(EMP.SALARY) AS SUMA_TOTAL_SALARIOS
FROM EMPLOYEES EMP;

--8) Del punto 5) mostrar la suma de los salarios de aquellos departamentos que superen los 5000

SELECT SUM(EMP.SALARY) AS SALARIO_TOTAL_DPT
FROM EMPLOYEES EMP
INNER JOIN DEPARTMENTS DPT
ON EMP.DEPTNO = DPT.DEPTNO
GROUP BY EMP.DEPTNO
HAVING SUM(EMP.SALARY) > 5000;


--9) Mostrar la suma de los salarios de los empleados agrupados por departamento, 
--pero solo de aquellos que tienen un departamento asociado.

--11) Mostrar todos los empleados de los departamentos que se encuentran en ciudades que comienzan con la letra k

SELECT EMP.EMPNO , EMP.NAME , EMP.DEPTNO , DPT.NAME , DPT.LOCATION
FROM EMPLOYEES EMP
INNER JOIN DEPARTMENTS DPT
ON EMP.DEPTNO = DPT.DEPTNO
WHERE DPT.LOCATION LIKE 'K%';


--12) Contar los empleados que tienen una comision superior a 500 y que existan en los departamentos
--pertenecientes a la localidad de Pune

SELECT EMP.NAME , EMP.SALARY , DPT.LOCATION
FROM EMPLOYEES EMP
INNER JOIN DEPARTMENTS DPT
ON EMP.DEPTNO = DPT.DEPTNO
WHERE EMP.SALARY > 500 AND DPT.LOCATION = 'Pune';

--13) Contar la cantidad de departamentos que corresponden a la localidad de Delhi, 
--y el resto sumarlo en una categoria "Otros" 


SELECT 
SUM (CASE WHEN DPT.LOCATION = 'Delhi' THEN 1 ELSE 0 END) AS CANTIDAD_EMPLEADOS_DELHI ,
SUM (CASE WHEN DPT.LOCATION != 'Delhi' THEN 1 ELSE 0 END) AS NO_PERTENECEN_A_DELHI
FROM DEPARTMENTS DPT;

 