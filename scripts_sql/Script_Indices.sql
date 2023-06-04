/*
	Script de definición de índices. Justificar la creación de cada uno de los índices
*/

#--------------------------------------------------------------------------------------------------------------------------------------------
#                                  									Valeria
#--------------------------------------------------------------------------------------------------------------------------------------------
USE bienestar;

# El ID de todas las personas es unico y ayuda a buscar la informacion mas facilmente
CREATE UNIQUE INDEX perID_UNIQUE ON Persona (perID);

# La mayoria de las veces las urgencias seran localizadas segun la cedula de la persona, por ello es util este index
CREATE INDEX Urgencia_Persona_idx ON Urgencia (perID);

# O en otros casos una urgencia se encuentra segun la fecha en que sucedio o la ambulancia usada
CREATE INDEX Urgencia_Fecha_idx ON Urgencia (urgFecha);
CREATE INDEX Urgencia_Ambulancia_idx ON Urgencia (ambulanciaID);

# Para encontrar las citas medicas, muchas de las busquedas se haran con respecto al paciente, por ello tener un index con la cedula del 
# usuario es util
CREATE INDEX CitaMedica_Persona_idx ON CitaMedica (pacienteID);

# Para determinar el horario de un doctor y para varias de las consultas interesantes, es necesario buscar las citas medicas por el doctor
CREATE INDEX CitaMedica_Doctor_idx ON CitaMedica (doctorID);

# Las fechas son usadas constantemente para determinar las citas medicas que ya pasaron o las que estan por pasar
CREATE INDEX CitaMedica_Fecha_idx ON CitaMedica (citFecha);

# Para ver que incapacidades, discapacidades y atenciones en salud faltan por verificar, es necesario buscar por dicha columna; sin embargo, dicho
# valor no es unico
CREATE INDEX Incapacidad_Verificado_idx ON Incapacidad (incVerificado);
CREATE INDEX Discapacidad_Verificado_idx ON Discapacidad (disVerificado);
CREATE INDEX AtencionEnSalud_Verificado_idx ON AtencionEnSalud (ateVerificado);

#--------------------------------------------------------------------------------------------------------------------------------------------
#																	Carlos
#--------------------------------------------------------------------------------------------------------------------------------------------

# Este indice sirve para mejorar las búsquedas sobre que programas existen en el área de bienestar, ya que estos son muchos, indexar su tabla
# de acuerdo a su nombre puede ser bastante útil. Como todos los programas de bienestar son diferentes, es lógico pensar que no pueden haber 2
# programas con el mismo nombre.
CREATE UNIQUE INDEX Programa_Bienestar_idx ON Programa (progNombre);

# Este es uno de los indices más importantes de esta base de datos, debido a que por programa pueden haber muchisimas convocatorias en un solo
# período del año. Y de igual manera, como se requiere llevar un registro de las convocatorias que han estado disponibles a lo largo del tiempo
# indexar de acuerdo al periodo es adecuado. También es util indexar de acuerdo al nombre, pues es factible que un usuario quiera buscar convocatorias
# de acuerdo al nombre que estas puedan tener. y finalmente, resulta útil indexar de acuerdo al id del programa pues de este modo podemos obtener las 
# convocatorias de un programa en partícular si es lo que se desea. Cabe aclarar que este indice se establece como único, pues no es lógico que hallan
# dos convocatorias identicas: es decir, con el mismo, nombre, programa, y periodo.
CREATE INDEX Convocatoria_Bienestar_idx ON Convocatoria (Programa_progID, convNombre, convPeriodo);

# Este indice es útil pues permite consultar todos los torneos que se han realizado en la universidad, y permite conocer de manera detallada información puntual
# que alguien interesado en participar pueda necesitar. Se escogen estos atributos ya que dentro de la tabla torneo interno existen muchos por los cuales un usuario
# normalmente no buscaria, por ejemplo el estado.
CREATE INDEX Torneo_interno_idx ON TorneoInterno(torNombreTorneo, torDeporte, torSedeFacultad, torPeriodo);

# Los siguientes indices permiten realizar consultas eficientes sobre las tablas que derivan de la tabla Convocatoria. Estos son utilies pues permiten buscar 
# detalles de convocatorias del área de deportes directamente sin necesidad de revisar otros detalles que en el momento no sean necesarios. 
# Como la fecha de cierre o apertura.
CREATE INDEX Convocatoria_curso_libre_idx ON ConvocatoriaCursoLibre(curNombre);
CREATE INDEX Convocatoria_seleccion_idx ON ConvocatoriaSeleccion(convDeporte);

#--------------------------------------------------------------------------------------------------------------------------------------------
#                                  									Javier
#--------------------------------------------------------------------------------------------------------------------------------------------

/* En la práctica, van a haber muchas convocatorias económicas y cada una va a ser constantemente buscada por los estudiantes.
Es por este motivo que se crea un indice para que dichas búsquedas sean más eficientes.*/

CREATE UNIQUE INDEX indice_convocatoriafomentoemprendimeinto ON convocatoriafomentoemprendimeinto(conv_id);
CREATE UNIQUE INDEX indice_convocatoriagestionalimentaria ON convocatoriagestionalimentaria(conv_id);
CREATE UNIQUE INDEX indice_convocatoriagestionalojamiento ON convocatoriagestionalojamiento(conv_id);
CREATE UNIQUE INDEX indice_convocatoriagestioneconomica ON convocatoriagestioneconomica(conv_id);
CREATE UNIQUE INDEX indice_convocatoriagestiontransporte ON convocatoriagestiontransporte(conv_id);

/*
ALTER table convocatoriafomentoemprendimeinto DROP INDEX indice_convocatoriafomentoemprendimeinto;
ALTER TABLE convocatoriagestionalimentaria DROP INDEX indice_convocatoriagestionalimentaria;
ALTER TABLE convocatoriagestionalojamiento DROP INDEX indice_convocatoriagestionalojamiento;
ALTER TABLE convocatoriagestioneconomica DROP INDEX indice_convocatoriagestioneconomica;
ALTER TABLE convocatoriagestiontransporte DROP INDEX indice_convocatoriagestiontransporte;
*/

/*  Sobre las falllas de alimentación se pueden hacer muchas consultas con el id de la falla y el id del estudiante*/

CREATE INDEX indice_fallaalimentacion on fallaalimentacion(fallAlID, estID);


/*  Sobre las actividades de corresponsabilidad se pueden hacer muchas consultas con el id de la actividad de corresponsabilidad y el id del estudiante*/

CREATE INDEX indice_actividadcorresp on actividadcorresp(actCorID, estID);