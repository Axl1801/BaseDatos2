select
e.matricula as matricula,
e.nombre nombre,
e.apellido as apellido,
c.nombre as carrera
from carreras c
inner join estudiantes e  on e.id_carrera = c.id_carrera 

SELECT
    g.id_grupo as "id grupo",
    m.nombre as materia,
    g.grupo,
    g.cupo_maximo as "cupo maximo",
    COUNT(i.id_inscripcion) as "cantidad alumnos inscritos"
FROM grupos g
INNER JOIN materias m
    ON g.id_materia = m.id_materia
INNER JOIN inscripciones i
    ON g.id_grupo = i.id_grupo
WHERE i.estado = 'INSCRITO'
GROUP BY
    g.id_grupo,
    m.nombre,
    g.grupo,
    g.cupo_maximo;

select
e.matricula as matricula,
e.nombre nombre,
e.apellido as apellido,
p.concepto,
p.monto,
p.metodo_pago,
p.referencia 
from pagos p
inner join estudiantes e  on e.id_estudiante  = p.id_estudiante 

--Validacion de calificacion
CREATE OR REPLACE FUNCTION validar_rango_calificacion()
RETURNS TRIGGER
AS $$
BEGIN

    IF NEW.calificacion < 0 OR NEW.calificacion > 100 THEN
        RAISE EXCEPTION 'La calificación debe estar entre 0 y 100. Valor recibido: %',
            NEW.calificacion;
    END IF;

    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER trg_validar_rango_calificacion
BEFORE INSERT OR UPDATE
ON calificaciones
FOR EACH ROW
EXECUTE FUNCTION validar_rango_calificacion();

--Procedimiento almacenado
CREATE OR REPLACE PROCEDURE cambiar_estado_pago(p_referencia VARCHAR, p_estado VARCHAR)
AS $$
BEGIN

    -- Buscar y actualizar el pago
    UPDATE pagos
    SET estado = p_estado
    WHERE referencia = p_referencia;

    -- Verificar si se encontró el pago
    IF NOT FOUND THEN
        RAISE EXCEPTION 'No existe un pago con la referencia: %',
            p_referencia;
    END IF;

    -- Mensaje de confirmación
    RAISE NOTICE 'El estado del pago con referencia % fue actualizado a %',
        p_referencia, p_estado;

END;
$$ LANGUAGE plpgsql;

CALL cambiar_estado_pago('REF009', 'PAGADO');