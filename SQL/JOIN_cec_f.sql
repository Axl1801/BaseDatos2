select 
c.nombre as carrera,
f.nombre as facultad
from carreras c
inner join facultades f  on f.id_facultad = c.id_facultad 
