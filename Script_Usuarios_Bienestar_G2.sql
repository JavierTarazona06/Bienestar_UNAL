use bienestar;

drop user if exists 'juanEstudiante'@'localhost';
create user 'juanEstudiante'@'localhost' 	
	identified by 'root@1234' default role 'estudiante'@'localhost';

drop user if exists 'mariaPersona'@'localhost';
create user 'mariaPersona'@'localhost' 
	identified by 'root@1234' default role 'no_estudiante'@'localhost';

drop user if exists 'jeisonSecretario'@'localhost';
create user 'jeisonSecretario'@'localhost' 
	identified by 'root@1234' default role 'secretaria'@'localhost';

drop user if exists 'elizabethGodDirEco'@'localhost';
create user 'elizabethGodDirEco'@'localhost'
	identified by 'root@1234' default role 'direccion_economica'@'localhost';

drop user if exists 'juanaDirSalud'@'localhost';
create user 'juanaDirSalud'@'localhost' 
	identified by 'root@1234' default role 'direccion_salud'@'localhost';

drop user if exists 'estebanDirDeporte'@'localhost';
create user 'estebanDirDeporte'@'localhost'
	identified by 'root@1234' default role 'direccion_deporte'@'localhost';

drop user if exists 'sabrinaDirCultural'@'localhost';
create user 'sabrinaDirCultural'@'localhost'
	identified by 'root@1234' default role 'direccion_cultural'@'localhost';


/*
#-------------------------------------------------------------------
#Javier
#--------------------------------------------------------------------

grant select,update on bienestar.persona to 'estudiante'@'localhost';
grant select,update on bienestar.estudiante to 'estudiante'@'localhost';

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

grant select,update on bienestar.persona to 'no_estudiante'@'localhost';

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
#Carlos
#--------------------------------------------------------------------

#Permisos para estudiante
grant select on Bienestar.TorneoInterno to 'estudiante'@'localhost';
grant select on Bienestar.ConvocatoriaCursoLibre to 'estudiante'@'localhost';
grant select on Bienestar.ConvocatoriaSeleccion to 'estudiante'@'localhost';
grant select on Bienestar.grupoartisticoinstitucional to 'estudiante'@'localhost';

grant select on Bienestar.CursoCultural to 'estudiante'@'localhost';
grant select on Bienestar.CursoCultural_has_Inscripcion to 'estudiante'@'localhost';
grant select on Bienestar.ConvocatoriaGAI to 'estudiante'@'localhost';

grant select on vw_info_curso_libre_convocatoria to 'estudiante'@'localhost';
grant select on vw_info_gai_convocatoria to 'estudiante'@'localhost';
grant select on vw_info_seleccion_convocatoria to 'estudiante'@'localhost';

#-------------------------------------------------------------------
#Permisos para no estudiantes

grant select on Bienestar.TorneoInterno to 'no_estudiante'@'localhost';
grant select on Bienestar.ConvocatoriaCursoLibre to 'no_estudiante'@'localhost';
grant select on Bienestar.ConvocatoriaSeleccion to 'no_estudiante'@'localhost';
grant select on Bienestar.grupoartisticoinstitucional to 'no_estudiante'@'localhost';

grant select on Bienestar.CursoCultural to 'no_estudiante'@'localhost';
grant select on Bienestar.CursoCultural_has_Inscripcion to 'no_estudiante'@'localhost';
grant select on Bienestar.ConvocatoriaGAI to 'no_estudiante'@'localhost';

grant select on vw_info_curso_libre_convocatoria to 'no_estudiante'@'localhost';
grant select on vw_info_gai_convocatoria to 'no_estudiante'@'localhost';
grant select on vw_info_seleccion_convocatoria to 'no_estudiante'@'localhost';

#-------------------------------------------------------------------
#Permisos para la secretaria de bienestar

grant all on Bienestar.TorneoInterno to 'secretaria'@'localhost';
grant select, insert, update on Bienestar.ConvocatoriaCursoLibre to 'secretaria'@'localhost';
grant select, insert, update on Bienestar.ConvocatoriaSeleccion to 'secretaria'@'localhost';
grant select, insert, update on Bienestar.grupoartisticoinstitucional to 'secretaria'@'localhost';

grant select, insert, update on Bienestar.CursoCultural to 'secretaria'@'localhost';
grant select, insert, update on Bienestar.CursoCultural_has_Inscripcion to 'secretaria'@'localhost';
grant select, insert, update on Bienestar.ConvocatoriaGAI to 'secretaria'@'localhost';

grant select, insert, update on vw_info_curso_libre_convocatoria to 'secretaria'@'localhost';
grant select, insert, update on vw_info_gai_convocatoria to 'secretaria'@'localhost';
grant select, insert, update on vw_info_seleccion_convocatoria to 'secretaria'@'localhost';

#-------------------------------------------------------------------
#Permisos para la direccion de bienestar economico
-- no tiene permisos sobre las siguientes tablas.

/*
TorneoInterno,
ConvocatoriaCursoLibre,
GrupoArtisticoInstitucional,
CursoCultural,
CursoCultural_has_inscripcion,
Convocatoria_GAI
vw_info_curso_libre_convocatoria
vw_info_gai_convocatoria
vw_info_seleccion_convocatoria
*/

/*
#-------------------------------------------------------------------
#Permisos para la direccion de bienestar salud

-- no tiene permisos sobre las siguientes tablas.


TorneoInterno,
ConvocatoriaCursoLibre,
GrupoArtisticoInstitucional,
CursoCultural,
CursoCultural_has_inscripcion,
Convocatoria_GAI
vw_info_curso_libre_convocatoria
vw_info_gai_convocatoria
vw_info_seleccion_convocatoria
*/

/*
#-------------------------------------------------------------------
#Permisos para la direccion de bienstar deporte
grant all on Bienestar.TorneoInterno to 'direccion_deporte'@'localhost';
grant all on Bienestar.ConvocatoriaSeleccion to 'direccion_deporte'@'localhost';
grant all on Bienestar.ConvocatoriaCursoLibre to 'direccion_deporte'@'localhost';

grant all on vw_info_curso_libre_convocatoria to 'direccion_deporte'@'localhost';
grant all on vw_info_seleccion_convocatoria to 'direccion_deporte'@'localhost';

#-------------------------------------------------------------------
#Permisos para la direccion de bienstar cultura
grant all on Bienestar.CursoCultural to 'direccion_cultural'@'localhost';
grant all on Bienestar.CursoCultural_has_Inscripcion to 'direccion_cultural'@'localhost';
grant all on Bienestar.ConvocatoriaGAI to 'direccion_cultural'@'localhost';
grant all on Bienestar.grupoartisticoinstitucional to 'direccion_cultural'@'localhost';

grant all on vw_info_gai_convocatoria to 'direccion_cultural'@'localhost';
*/
