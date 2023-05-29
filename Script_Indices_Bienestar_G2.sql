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

# 4.

# 5.

# 6.

#--------------------------------------------------------------------------------------------------------------------------------------------
#                                  									Javier
#--------------------------------------------------------------------------------------------------------------------------------------------

# 7. 

# 8. 

# 9. 



