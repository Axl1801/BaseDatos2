BEGIN;
UPDATE estudiantes SET nombre = 'Ana' WHERE id_estudiante = 3;
SAVEPOINT cambio_nombre;
UPDATE estudiantes SET nombre = 'Error' WHERE id_estudiante = 10;
ROLLBACK TO SAVEPOINT cambio_nombre;
COMMIT;

SELECT * FROM estudiantes e