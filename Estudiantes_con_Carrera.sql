SELECT
    e.nombre,
    e.apellido,
    c.nombre AS carrera
FROM estudiantes e
INNER JOIN carreras c
    ON e.id_carrera = c.id_carrera;