/* =========================================================
   6. PROCEDIMIENTO - CAMBIAR DOCENTE DE GRUPO
   ========================================================= */

select * from grupos g

CREATE OR REPLACE PROCEDURE cambiar_docente_grupo(
    p_docente INTEGER,
    p_grupo INTEGER
)
LANGUAGE plpgsql
AS $$
BEGIN

    UPDATE g
    SET id_docente = p_docente
    WHERE id_grupo = p_grupo;


    IF NOT FOUND THEN

        RAISE EXCEPTION
        'No existe un grupo con el ID %',
        p_grupo;

    END IF;


    RAISE NOTICE
    'Grupo del docente actualizado correctamente.';

END;
$$;
/* =========================================================
   EJECUTAR PROCEDIMIENTO
   ========================================================= */

CALL cambiar_docente_grupo(3, 10);
