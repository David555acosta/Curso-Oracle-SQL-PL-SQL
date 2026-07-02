BEGIN
    DBMS_OUTPUT.PUT_LINE(
        CASE
            WHEN SQL%NOTFOUND THEN 'TRUE'
            ELSE 'FALSE'
        END
    );
END;



--1) Crear un procedimiento que recorra todos los empleados y los muestre uno a uno por consola
--indicando el nombre de cada campo y su valor. Utilice un cursor explícito

DECLARE
    v_nombre alumnos.NOMBRE%TYPE;

    CURSOR c_alumnos IS
        SELECT NOMBRE
        FROM ALUMNOS;
BEGIN
    OPEN c_alumnos;

    LOOP
        FETCH c_alumnos INTO v_nombre;

        DBMS_OUTPUT.PUT_LINE(v_nombre);
        
        EXIT WHEN c_alumnos%NOTFOUND;
        
    END LOOP;

    CLOSE c_alumnos;
END;

--2) Crear un procedimiento que reciba un parametro de busqueda que indique un valor a filtrar.
--Que se filtre por ese parametro de entrada, en cualquiera de los campos posibles de la tabla empleados.
--El procedimiento debe devolver un cursor con el resultado.
--Tambien debe mostrar por consola el valor de registros afectados.

DECLARE
    v_nombre alumnos.NOMBRE%TYPE;

    CURSOR c2_alumnos IS
        SELECT NOMBRE
        FROM ALUMNOS;
BEGIN
    OPEN c2_alumnos;

    LOOP
        FETCH c2_alumnos INTO v_nombre;

        DBMS_OUTPUT.PUT_LINE(v_nombre);
        
        EXIT WHEN c2_alumnos%NOTFOUND;
        
    END LOOP;

    CLOSE c2_alumnos;
END;

--3) Hacer un bloque PL en donde se habra un cursor, haciendo un select de la tabla empleados. Recorrer uno por uno 
--y concatenar en una nueva columna el nombre y el barrio.

DECLARE
    v_id alumnos.ID_ALUMNO%TYPE;
    v_nombre alumnos.NOMBRE%TYPE;
    v_barrio alumnos.BARRIO%TYPE;

    CURSOR c3_alumnos IS
        SELECT ID_ALUMNO, NOMBRE, BARRIO
        FROM ALUMNOS;
BEGIN
    OPEN c3_alumnos;

    LOOP
        FETCH c3_alumnos INTO v_id , v_nombre , v_barrio;
        
        EXIT WHEN c3_alumnos%NOTFOUND;
        
        UPDATE ALUMNOS
        SET NOMBRE_BARRIO = v_nombre || ' - ' || v_barrio
        WHERE ID_ALUMNO = v_id;
    END LOOP;

    CLOSE c3_alumnos;
END;


--4) Luego del punto 3 crear un cursor  con solo los atributos nombres y esa nueva columna.
--Recorrer el cursor y mostrarlo por consola uno por uno, dandole formato de json (clave-valor)

DECLARE
    v_nombre alumnos.NOMBRE%TYPE;
    v_nombre_barrio alumnos.NOMBRE_BARRIO%TYPE;

    CURSOR c4_alumnos IS
        SELECT NOMBRE, NOMBRE_BARRIO
        FROM ALUMNOS;

BEGIN
    OPEN c4_alumnos;

    LOOP
        FETCH c4_alumnos INTO v_nombre, v_nombre_barrio;

        EXIT WHEN c4_alumnos%NOTFOUND;

        DBMS_OUTPUT.PUT_LINE('{');
        DBMS_OUTPUT.PUT_LINE('  "nombre": "' || v_nombre || '",');
        DBMS_OUTPUT.PUT_LINE('  "nombre_barrio": "' || v_nombre_barrio || '"');
        DBMS_OUTPUT.PUT_LINE('}');
    END LOOP;

    CLOSE c4_alumnos;
END;





