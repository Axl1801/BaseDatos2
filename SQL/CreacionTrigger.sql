/* =========================================================
   1. TRIGGER - VALIDAR CUPO DEL GRUPO
   ========================================================= */

CREATE OR REPLACE FUNCTION validar_cupo_grupo()
RETURNS TRIGGER
AS $$
DECLARE
    total_inscritos INT;
    limite_grupo INT;
BEGIN

	--Obtener el total de Inscritos
    SELECT COUNT(*)
    INTO total_inscritos
    FROM inscripciones
    WHERE id_grupo = NEW.id_grupo
      AND estado = 'INSCRITO';

	--TOTAL DE CUPOS Maximos
    SELECT cupo_maximo
    INTO limite_grupo
    FROM grupos
    WHERE id_grupo = NEW.id_grupo;


    IF total_inscritos >= limite_grupo THEN
        RAISE EXCEPTION
        'No se puede realizar la inscripción. El grupo está lleno.';
    END IF;


    RETURN NEW;

END;
$$ LANGUAGE plpgsql;


CREATE TRIGGER trg_validar_cupo_grupo
BEFORE INSERT
ON inscripciones
FOR EACH ROW
EXECUTE FUNCTION validar_cupo_grupo();



/* =========================================================
   PRUEBA DEL TRIGGER
   ========================================================= */

SELECT
    g.id_grupo,
    m.nombre AS materia,
    g.grupo,
    g.cupo_maximo,
    COUNT(i.id_inscripcion) AS alumnos_inscritos
FROM grupos g
INNER JOIN materias m
    ON g.id_materia = m.id_materia
LEFT JOIN inscripciones i
    ON g.id_grupo = i.id_grupo
    AND i.estado = 'INSCRITO'
GROUP BY
    g.id_grupo,
    m.nombre,
    g.grupo,
    g.cupo_maximo
ORDER BY g.id_grupo;


/*
Ejemplo:

INSERT INTO inscripciones
(id_estudiante, id_grupo, id_periodo)
VALUES
(4, 1, 2);
*/

CREATE OR REPLACE FUNCTION validar_monto()
RETURNS TRIGGER
AS $$
declare
	pago int;
begin
	
	SELECT monto
    	INTO pago
    	FROM pagos
    	WHERE id_pago = NEW.id_pago
     	 AND estado = 'PAGADO';

    IF pago >= 20000 THEN
        RAISE EXCEPTION
        'El monto supera el limite permitido.';
    END IF;

    RETURN NEW;

END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER trg_validar_monto
BEFORE INSERT
ON pagos
FOR EACH ROW
EXECUTE FUNCTION validar_monto();

