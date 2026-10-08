BEGIN;
UPDATE estudiantes SET nombre = 'Ana' WHERE id_estudiante = 3;
UPDATE estudiantes SET nombre = 'ERROR' WHERE id_estudiante = 11;
SAVEPOINT cambio_nombre;
UPDATE estudiantes SET nombre = 'Error' WHERE id_estudiante = 10;
UPDATE estudiantes SET nombre = 'Error' WHERE id_estudiante = 12;
ROLLBACK TO SAVEPOINT cambio_nombre;
COMMIT;

SELECT * FROM estudiantes 

begin;
update estudiantes
set estado = 'BAJA'
where id_estudiante = 13;

select id_estudiante, nombre, telefono
from estudiantes e 
where e.id_estudiante = 13;

commit;

select * from pagos p;

begin;
insert into pagos 
(id_estudiante, id_periodo, concepto, monto, fecha_pago, metodo_pago, referencia)
values 
(14,2,'reinscripcion',3500, current_timestamp , 'transferencia','REF004' );

commit;

select * from information_schema.triggers t; 

begin;

update estudiantes e 
set telefono = 6122485016
where id_estudiante = 14;

commit;

select * from estudiantes e 

begin;

insert into pagos 
(id_estudiante, id_periodo, concepto, monto, fecha_pago, metodo_pago, referencia)
values
(14,2,'reinscripcion',3500, current_timestamp , 'transferencia','REF004' );

select * from pagos p;

commit;












