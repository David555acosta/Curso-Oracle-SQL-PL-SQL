CREATE SEQUENCE seq_alumnos
START WITH 26
INCREMENT BY 1
NOCACHE
NOCYCLE;

CREATE SEQUENCE seq_materia
START WITH 26
INCREMENT BY 1
NOCACHE
NOCYCLE;

CREATE SEQUENCE seq_carrera
START WITH 26
INCREMENT BY 1
NOCACHE
NOCYCLE;




--1) Crear un trigger que complete con el valor de una secuencia el campo ID de 3 tablas que se
--han trabajado durante el curso. Si ya tiene datos insertados la secuencia iniciará luego del ID de mayor valor.


CREATE OR REPLACE TRIGGER trg_alumnos
BEFORE INSERT
ON alumnos
FOR EACH ROW
BEGIN
    :NEW.ID_ALUMNO := seq_alumnos.NEXTVAL;
END;



-----


CREATE OR REPLACE TRIGGER trg_carrera
BEFORE INSERT
ON carrera
FOR EACH ROW
BEGIN
    :NEW.ID_MATERIA := seq_materia.NEXTVAL;
END;


---




--2) Crear un trigger que registre en una tabla de auditoria cada cambio sufrido en 3 de las tablas
--que se trabajaron durante el curso.

CREATE TABLE auditoria (
    id_auditoria   NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    
    tabla          VARCHAR2(50) NOT NULL,
    operacion      VARCHAR2(10) NOT NULL,
    
    usuario_bd     VARCHAR2(50) DEFAULT USER,
    fecha_hora     TIMESTAMP DEFAULT SYSTIMESTAMP,
    
    pk_registro    VARCHAR2(100),
    
    datos_anteriores VARCHAR2(4000),
    datos_nuevos     VARCHAR2(4000)
);


CREATE OR REPLACE TRIGGER trg_aud_alumnos
AFTER INSERT OR UPDATE OR DELETE ON alumnos
FOR EACH ROW
BEGIN
    IF INSERTING THEN
        INSERT INTO auditoria (
            tabla, operacion, pk_registro, datos_nuevos
        )
        VALUES (
            'ALUMNOS',
            'INSERT',
            :NEW.id_alumno,
            'nombre=' || :NEW.nombre || ', barrio=' || :NEW.barrio
        );

    ELSIF UPDATING THEN
        INSERT INTO auditoria (
            tabla, operacion, pk_registro, datos_anteriores, datos_nuevos
        )
        VALUES (
            'ALUMNOS',
            'UPDATE',
            :NEW.id_alumno,
            'nombre=' || :OLD.nombre || ', barrio=' || :OLD.barrio,
            'nombre=' || :NEW.nombre || ', barrio=' || :NEW.barrio
        );

    ELSIF DELETING THEN
        INSERT INTO auditoria (
            tabla, operacion, pk_registro, datos_anteriores
        )
        VALUES (
            'ALUMNOS',
            'DELETE',
            :OLD.id_alumno,
            'nombre=' || :OLD.nombre || ', barrio=' || :OLD.barrio
        );
    END IF;
END;
/

--------------


CREATE OR REPLACE TRIGGER trg_aud_alumnos
AFTER INSERT OR UPDATE OR DELETE ON alumnos
FOR EACH ROW
BEGIN
    IF INSERTING THEN
        INSERT INTO auditoria (
            tabla, operacion, pk_registro, datos_nuevos
        )
        VALUES (
            'ALUMNOS',
            'INSERT',
            :NEW.id_alumno,
            'nombre=' || :NEW.nombre || ', barrio=' || :NEW.barrio
        );

    ELSIF UPDATING THEN
        INSERT INTO auditoria (
            tabla, operacion, pk_registro, datos_anteriores, datos_nuevos
        )
        VALUES (
            'ALUMNOS',
            'UPDATE',
            :NEW.id_alumno,
            'nombre=' || :OLD.nombre || ', barrio=' || :OLD.barrio,
            'nombre=' || :NEW.nombre || ', barrio=' || :NEW.barrio
        );

    ELSIF DELETING THEN
        INSERT INTO auditoria (
            tabla, operacion, pk_registro, datos_anteriores
        )
        VALUES (
            'ALUMNOS',
            'DELETE',
            :OLD.id_alumno,
            'nombre=' || :OLD.nombre || ', barrio=' || :OLD.barrio
        );
    END IF;
END;




---


CREATE OR REPLACE TRIGGER trg_aud_materias
AFTER INSERT OR UPDATE OR DELETE ON materias
FOR EACH ROW
BEGIN
    IF INSERTING THEN
        INSERT INTO auditoria (tabla, operacion, pk_registro, datos_nuevos)
        VALUES ('MATERIAS', 'INSERT', :NEW.id_materia, 'nombre=' || :NEW.nombre);

    ELSIF UPDATING THEN
        INSERT INTO auditoria (tabla, operacion, pk_registro, datos_anteriores, datos_nuevos)
        VALUES (
            'MATERIAS',
            'UPDATE',
            :NEW.id_materia,
            'nombre=' || :OLD.nombre,
            'nombre=' || :NEW.nombre
        );

    ELSIF DELETING THEN
        INSERT INTO auditoria (tabla, operacion, pk_registro, datos_anteriores)
        VALUES ('MATERIAS', 'DELETE', :OLD.id_materia, 'nombre=' || :OLD.nombre);
    END IF;
END;




