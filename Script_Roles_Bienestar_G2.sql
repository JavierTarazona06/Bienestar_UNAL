use bienestar;

drop role if exists 'estudiante'@'localhost';
drop role if exists 'no_estudiante'@'localhost';
drop role if exists 'secretaria'@'localhost';
drop role if exists 'direccion_economica'@'localhost';
drop role if exists 'direccion_salud'@'localhost';
drop role if exists 'direccion_deporte'@'localhost';
drop role if exists 'direccion_cultural'@'localhost';
CREATE ROLE 'estudiante'@'localhost';
CREATE ROLE 'no_estudiante'@'localhost';
CREATE ROLE 'secretaria'@'localhost';
CREATE ROLE 'direccion_economica'@'localhost';
CREATE ROLE 'direccion_salud'@'localhost';
CREATE ROLE 'direccion_deporte'@'localhost';
CREATE ROLE 'direccion_cultural'@'localhost';

#-------------------------------------------------------------------
#Javier
#--------------------------------------------------------------------

grant update on bienestar.persona to 'estudiante'@'localhost';
grant update on bienestar.estudiante to 'estudiante'@'localhost';

grant select on bienestar.Carrera to 'estudiante'@'localhost';
grant select on bienestar.Area to 'estudiante'@'localhost';
grant select on bienestar.Programa to 'estudiante'@'localhost';
grant select on bienestar.Programa_tiene_EventoTaller to 'estudiante'@'localhost';
grant select on bienestar.EventoTaller to 'estudiante'@'localhost';
grant select on bienestar.Programa_tiene_proyecto to 'estudiante'@'localhost';
grant select on bienestar.Proyecto to 'estudiante'@'localhost';
grant select on bienestar.Convocatoria to 'estudiante'@'localhost';
grant select on bienestar.Estudiante_toma_convocatoria to 'estudiante'@'localhost';
grant select on bienestar.TiendaBienestar to 'estudiante'@'localhost';
grant select on bienestar.empleado_tiendaUN to 'estudiante'@'localhost';
grant select on bienestar.Producto to 'estudiante'@'localhost';
grant select on bienestar.producto_tiendaUN to 'estudiante'@'localhost';
grant select on bienestar.Factura to 'estudiante'@'localhost';
grant select on bienestar.factura_producto to 'estudiante'@'localhost';
grant select on bienestar.FallaAlimentacion to 'estudiante'@'localhost';
grant select on bienestar.ActividadCorresp to 'estudiante'@'localhost';
grant select on bienestar.Corresponsabilidad to 'estudiante'@'localhost';

grant select,insert on bienestar.ConvocatoriaGestionAlimentaria to 'estudiante'@'localhost';
grant select,insert on bienestar.ConvocatoriaGestionTransporte to 'estudiante'@'localhost';
grant select,insert on bienestar.ConvocatoriaGestionEconomica to 'estudiante'@'localhost';
grant select,insert on bienestar.ConvocatoriaFomentoEmprendimeinto to 'estudiante'@'localhost';
grant select,insert on bienestar.ConvocatoriaGestionAlojamiento to 'estudiante'@'localhost';

grant select,update on bienestar.vw_info_estudiante to 'estudiante'@'localhost';
grant select,insert on bienestar.vw_info_convocatoria_estudiante to 'estudiante'@'localhost';
grant select on bienestar.vw_info_factura to 'estudiante'@'localhost';

#---------------

grant update on bienestar.persona to 'no_estudiante'@'localhost';

grant select on bienestar.Area to 'no_estudiante'@'localhost';
grant select on bienestar.Programa to 'no_estudiante'@'localhost';
grant select on bienestar.Programa_tiene_EventoTaller to 'no_estudiante'@'localhost';
grant select on bienestar.EventoTaller to 'no_estudiante'@'localhost';
grant select on bienestar.Programa_tiene_proyecto to 'no_estudiante'@'localhost';
grant select on bienestar.Proyecto to 'no_estudiante'@'localhost';
grant select on bienestar.Convocatoria to 'no_estudiante'@'localhost';
grant select on bienestar.TiendaBienestar to 'no_estudiante'@'localhost';
grant select on bienestar.empleado_tiendaUN to 'no_estudiante'@'localhost';
grant select on bienestar.Producto to 'no_estudiante'@'localhost';
grant select on bienestar.producto_tiendaUN to 'no_estudiante'@'localhost';
grant select on bienestar.Factura to 'no_estudiante'@'localhost';
grant select on bienestar.factura_producto to 'no_estudiante'@'localhost';

grant select on bienestar.vw_info_factura to 'no_estudiante'@'localhost';

#---------------

grant select, insert, update on bienestar.Persona to 'secretaria'@'localhost';
grant select, insert, update on bienestar.persona_cargo to 'secretaria'@'localhost';
grant select, insert, update on bienestar.Cargo to 'secretaria'@'localhost';
grant select, insert, update on bienestar.Estudiante to 'secretaria'@'localhost';
grant select, insert, update on bienestar.Carrera to 'secretaria'@'localhost';

grant select on bienestar.Area to 'secretaria'@'localhost';
grant select on bienestar.Programa to 'secretaria'@'localhost';

grant select, insert, update on bienestar.Programa_tiene_EventoTaller to 'secretaria'@'localhost';
grant select, insert, update on bienestar.EventoTaller to 'secretaria'@'localhost';
grant select, insert, update on bienestar.Programa_tiene_proyecto to 'secretaria'@'localhost';

grant select on bienestar.Proyecto to 'secretaria'@'localhost';

grant select, update on bienestar.Convocatoria to 'secretaria'@'localhost';

grant all on bienestar.Estudiante_toma_convocatoria to 'secretaria'@'localhost';

grant select, update on bienestar.TiendaBienestar to 'secretaria'@'localhost';
grant select, insert, update on bienestar.empleado_tiendaUN to 'secretaria'@'localhost';
grant select, update on bienestar.Producto to 'secretaria'@'localhost';

grant select, insert, update on bienestar.producto_tiendaUN to 'secretaria'@'localhost';
grant select, insert, update on bienestar.Factura to 'secretaria'@'localhost';
grant select, insert, update on bienestar.factura_producto to 'secretaria'@'localhost';

grant select, insert on bienestar.FallaAlimentacion to 'secretaria'@'localhost';
grant select, insert on bienestar.ActividadCorresp to 'secretaria'@'localhost';
grant select, insert, update on bienestar.Corresponsabilidad to 'secretaria'@'localhost';
grant select, update on bienestar.ConvocatoriaGestionAlimentaria to 'secretaria'@'localhost';
grant select, update on bienestar.ConvocatoriaGestionTransporte to 'secretaria'@'localhost';
grant select, update on bienestar.ConvocatoriaGestionEconomica to 'secretaria'@'localhost';
grant select, update on bienestar.ConvocatoriaFomentoEmprendimeinto to 'secretaria'@'localhost';
grant select, update on bienestar.ConvocatoriaGestionAlojamiento to 'secretaria'@'localhost';

grant select, insert, update on bienestar.vw_info_estudiante to 'secretaria'@'localhost';
grant select, update on bienestar.vw_info_convocatoria_estudiante to 'secretaria'@'localhost';
grant select, insert, update on bienestar.vw_info_factura to 'secretaria'@'localhost';

#-----------------

grant all on bienestar.Persona to 'direccion_economica'@'localhost';
grant all on bienestar.persona_cargo to 'direccion_economica'@'localhost';
grant all on bienestar.Cargo to 'direccion_economica'@'localhost';
grant all on bienestar.Estudiante to 'direccion_economica'@'localhost';
grant all on bienestar.Carrera to 'direccion_economica'@'localhost';
grant all on bienestar.Area to 'direccion_economica'@'localhost';
grant all on bienestar.Programa to 'direccion_economica'@'localhost';
grant all on bienestar.Programa_tiene_EventoTaller to 'direccion_economica'@'localhost';
grant all on bienestar.EventoTaller to 'direccion_economica'@'localhost';
grant all on bienestar.Programa_tiene_proyecto to 'direccion_economica'@'localhost';
grant all on bienestar.Proyecto to 'direccion_economica'@'localhost';
grant all on bienestar.Convocatoria to 'direccion_economica'@'localhost';
grant all on bienestar.Estudiante_toma_convocatoria to 'direccion_economica'@'localhost';
grant all on bienestar.TiendaBienestar to 'direccion_economica'@'localhost';
grant all on bienestar.empleado_tiendaUN to 'direccion_economica'@'localhost';
grant all on bienestar.Producto to 'direccion_economica'@'localhost';
grant all on bienestar.producto_tiendaUN to 'direccion_economica'@'localhost';
grant all on bienestar.Factura to 'direccion_economica'@'localhost';
grant all on bienestar.factura_producto to 'direccion_economica'@'localhost';

grant select, insert, update on bienestar.FallaAlimentacion to 'direccion_economica'@'localhost';
grant select, insert, update on bienestar.ActividadCorresp to 'direccion_economica'@'localhost';
grant select, insert, update on bienestar.Corresponsabilidad to 'direccion_economica'@'localhost';
grant all on bienestar.ConvocatoriaGestionAlimentaria to 'direccion_economica'@'localhost';
grant all on bienestar.ConvocatoriaGestionTransporte to 'direccion_economica'@'localhost';
grant all on bienestar.ConvocatoriaGestionEconomica to 'direccion_economica'@'localhost';
grant all on bienestar.ConvocatoriaFomentoEmprendimeinto to 'direccion_economica'@'localhost';
grant all on bienestar.ConvocatoriaGestionAlojamiento to 'direccion_economica'@'localhost';

grant all on bienestar.vw_info_estudiante to 'direccion_economica'@'localhost';
grant all on bienestar.vw_info_convocatoria_estudiante to 'direccion_economica'@'localhost';
grant all on bienestar.vw_info_factura to 'direccion_economica'@'localhost';

#--------------------------------------------------------------------

#-------------------------------------------------------------------
#Valeria
#--------------------------------------------------------------------

grant all on bienestar.Persona to 'direccion_salud'@'localhost';
grant all on bienestar.persona_cargo to 'direccion_salud'@'localhost';
grant all on bienestar.Cargo to 'direccion_salud'@'localhost';
grant all on bienestar.Estudiante to 'direccion_salud'@'localhost';
grant all on bienestar.Carrera to 'direccion_salud'@'localhost';
grant all on bienestar.Area to 'direccion_salud'@'localhost';
grant all on bienestar.Programa to 'direccion_salud'@'localhost';
grant all on bienestar.Programa_tiene_EventoTaller to 'direccion_salud'@'localhost';
grant all on bienestar.EventoTaller to 'direccion_salud'@'localhost';
grant all on bienestar.Programa_tiene_proyecto to 'direccion_salud'@'localhost';
grant all on bienestar.Proyecto to 'direccion_salud'@'localhost';
grant all on bienestar.Convocatoria to 'direccion_salud'@'localhost';
grant all on bienestar.Estudiante_toma_convocatoria to 'direccion_salud'@'localhost';

grant all on bienestar.vw_info_estudiante to 'direccion_salud'@'localhost';
grant all on bienestar.vw_info_convocatoria_estudiante to 'direccion_salud'@'localhost';

#--------------------------------------------------------------------


#-------------------------------------------------------------------
#Carlos
#--------------------------------------------------------------------

grant all on bienestar.Persona to 'direccion_deporte'@'localhost';
grant all on bienestar.persona_cargo to 'direccion_deporte'@'localhost';
grant all on bienestar.Cargo to 'direccion_deporte'@'localhost';
grant all on bienestar.Estudiante to 'direccion_deporte'@'localhost';
grant all on bienestar.Carrera to 'direccion_deporte'@'localhost';
grant all on bienestar.Area to 'direccion_deporte'@'localhost';
grant all on bienestar.Programa to 'direccion_deporte'@'localhost';
grant all on bienestar.Programa_tiene_EventoTaller to 'direccion_deporte'@'localhost';
grant all on bienestar.EventoTaller to 'direccion_deporte'@'localhost';
grant all on bienestar.Programa_tiene_proyecto to 'direccion_deporte'@'localhost';
grant all on bienestar.Proyecto to 'direccion_deporte'@'localhost';
grant all on bienestar.Convocatoria to 'direccion_deporte'@'localhost';
grant all on bienestar.Estudiante_toma_convocatoria to 'direccion_deporte'@'localhost';

grant all on bienestar.vw_info_estudiante to 'direccion_deporte'@'localhost';
grant all on bienestar.vw_info_convocatoria_estudiante to 'direccion_deporte'@'localhost';

grant all on bienestar.Persona to 'direccion_cultural'@'localhost';
grant all on bienestar.persona_cargo to 'direccion_cultural'@'localhost';
grant all on bienestar.Cargo to 'direccion_cultural'@'localhost';
grant all on bienestar.Estudiante to 'direccion_cultural'@'localhost';
grant all on bienestar.Carrera to 'direccion_cultural'@'localhost';
grant all on bienestar.Area to 'direccion_cultural'@'localhost';
grant all on bienestar.Programa to 'direccion_cultural'@'localhost';
grant all on bienestar.Programa_tiene_EventoTaller to 'direccion_cultural'@'localhost';
grant all on bienestar.EventoTaller to 'direccion_cultural'@'localhost';
grant all on bienestar.Programa_tiene_proyecto to 'direccion_cultural'@'localhost';
grant all on bienestar.Proyecto to 'direccion_cultural'@'localhost';
grant all on bienestar.Convocatoria to 'direccion_cultural'@'localhost';
grant all on bienestar.Estudiante_toma_convocatoria to 'direccion_cultural'@'localhost';

grant all on bienestar.vw_info_estudiante to 'direccion_cultural'@'localhost';
grant all on bienestar.vw_info_convocatoria_estudiante to 'direccion_cultural'@'localhost';

#--------------------------------------------------------------------

FLUSH PRIVILEGES;


drop user if exists 'juanEstudiante'@'localhost';
create user 'juanEstudiante'@'localhost' identified by 'root@1234';
grant 'estudiante'@'localhost' to 'juanEstudiante'@'localhost';
set default role 'estudiante'@'localhost' to 'juanEstudiante'@'localhost';
#set role  default to user


SHOW GRANTS FOR 'juanEstudiante'@'localhost';

drop user if exists 'mariaPersona'@'localhost';
create user 'mariaPersona'@'localhost' identified by 'root@1234';
grant 'no_estudiante'@'localhost' to 'mariaPersona'@'localhost';

SHOW GRANTS FOR 'mariaPersona'@'localhost';

drop user if exists 'jeisonSecretario'@'localhost';
create user 'jeisonSecretario'@'localhost' identified by 'root@1234';
grant 'secretaria'@'localhost' to 'jeisonSecretario'@'localhost';

drop user if exists 'elizabethGodDirEco'@'localhost';
create user 'elizabethGodDirEco'@'localhost' identified by 'root@1234';
grant 'direccion_economica'@'localhost' to 'elizabethGodDirEco'@'localhost';

drop user if exists 'juanaDirSalud'@'localhost';
create user 'juanaDirSalud'@'localhost' identified by 'root@1234';
grant 'direccion_salud'@'localhost' to 'juanaDirSalud'@'localhost';

drop user if exists 'estebanDirDeporte'@'localhost';
create user 'estebanDirDeporte'@'localhost' identified by 'root@1234';
grant 'direccion_deporte'@'localhost' to 'estebanDirDeporte'@'localhost';

drop user if exists 'sabrinaDirCultural'@'localhost';
create user 'sabrinaDirCultural'@'localhost' identified by 'root@1234';
grant 'direccion_cultural'@'localhost' to 'sabrinaDirCultural'@'localhost';

FLUSH PRIVILEGES;