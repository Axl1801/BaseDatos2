select 
cec.nombre as carrera,
f.nombre as facultad
from carreras_en_clase cec
inner join facultades f  on f.id_facultad = cec.id_facultad 
