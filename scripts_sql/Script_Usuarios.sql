use bienestar;

drop user if exists 'juanEstudiante'@'%';
create user 'juanEstudiante'@'%' 	
	identified by 'root@1234' default role 'estudiante'@'%';
    
GRANT 'estudiante' to 'juanEstudiante'@'%';
SET DEFAULT ROLE 'estudiante' to 'juanEstudiante'@'%';

drop user if exists 'mariaPersona'@'%';
create user 'mariaPersona'@'%' 
	identified by 'root@1234' default role 'no_estudiante'@'%';

drop user if exists 'jeisonSecretario'@'%';
create user 'jeisonSecretario'@'%' 
	identified by 'root@1234' default role 'secretaria'@'%';

drop user if exists 'elizabethGodDirEco'@'%';
create user 'elizabethGodDirEco'@'%'
	identified by 'root@1234' default role 'direccion_economica'@'%';

drop user if exists 'juanaDirSalud'@'%';
create user 'juanaDirSalud'@'%' 
	identified by 'root@1234' default role 'direccion_salud'@'%';

drop user if exists 'estebanDirDeporte'@'%';
create user 'estebanDirDeporte'@'%'
	identified by 'root@1234' default role 'direccion_deporte'@'%';

drop user if exists 'sabrinaDirCultural'@'%';
create user 'sabrinaDirCultural'@'%'
	identified by 'root@1234' default role 'direccion_cultural'@'%';


/*
#-------------------------------------------------------------------
#Javier
#--------------------------------------------------------------------

grant select,update on bienestar.persona to 'estudiante'@'%';
grant select,update on bienestar.estudiante to 'estudiante'@'%';

grant select on bienestar.Carrera to 'estudiante'@'%';
grant select on bienestar.Area to 'estudiante'@'%';
grant select on bienestar.Programa to 'estudiante'@'%';
grant select on bienestar.Programa_tiene_EventoTaller to 'estudiante'@'%';
grant select on bienestar.EventoTaller to 'estudiante'@'%';
grant select on bienestar.Programa_tiene_proyecto to 'estudiante'@'%';
grant select on bienestar.Proyecto to 'estudiante'@'%';
grant select on bienestar.Convocatoria to 'estudiante'@'%';
grant select on bienestar.Estudiante_toma_convocatoria to 'estudiante'@'%';
grant select on bienestar.TiendaBienestar to 'estudiante'@'%';
grant select on bienestar.empleado_tiendaUN to 'estudiante'@'%';
grant select on bienestar.Producto to 'estudiante'@'%';
grant select on bienestar.producto_tiendaUN to 'estudiante'@'%';
grant select on bienestar.Factura to 'estudiante'@'%';
grant select on bienestar.factura_producto to 'estudiante'@'%';
grant select on bienestar.FallaAlimentacion to 'estudiante'@'%';
grant select on bienestar.ActividadCorresp to 'estudiante'@'%';
grant select on bienestar.Corresponsabilidad to 'estudiante'@'%';

grant select,insert on bienestar.ConvocatoriaGestionAlimentaria to 'estudiante'@'%';
grant select,insert on bienestar.ConvocatoriaGestionTransporte to 'estudiante'@'%';
grant select,insert on bienestar.ConvocatoriaGestionEconomica to 'estudiante'@'%';
grant select,insert on bienestar.ConvocatoriaFomentoEmprendimeinto to 'estudiante'@'%';
grant select,insert on bienestar.ConvocatoriaGestionAlojamiento to 'estudiante'@'%';

grant select,update on bienestar.vw_info_estudiante to 'estudiante'@'%';
grant select,insert on bienestar.vw_info_convocatoria_estudiante to 'estudiante'@'%';
grant select on bienestar.vw_info_factura to 'estudiante'@'%';

#---------------

grant select,update on bienestar.persona to 'no_estudiante'@'%';

grant select on bienestar.Area to 'no_estudiante'@'%';
grant select on bienestar.Programa to 'no_estudiante'@'%';
grant select on bienestar.Programa_tiene_EventoTaller to 'no_estudiante'@'%';
grant select on bienestar.EventoTaller to 'no_estudiante'@'%';
grant select on bienestar.Programa_tiene_proyecto to 'no_estudiante'@'%';
grant select on bienestar.Proyecto to 'no_estudiante'@'%';
grant select on bienestar.Convocatoria to 'no_estudiante'@'%';
grant select on bienestar.TiendaBienestar to 'no_estudiante'@'%';
grant select on bienestar.empleado_tiendaUN to 'no_estudiante'@'%';
grant select on bienestar.Producto to 'no_estudiante'@'%';
grant select on bienestar.producto_tiendaUN to 'no_estudiante'@'%';
grant select on bienestar.Factura to 'no_estudiante'@'%';
grant select on bienestar.factura_producto to 'no_estudiante'@'%';

grant select on bienestar.vw_info_factura to 'no_estudiante'@'%';

#---------------

grant select, insert, update on bienestar.Persona to 'secretaria'@'%';
grant select, insert, update on bienestar.persona_cargo to 'secretaria'@'%';
grant select, insert, update on bienestar.Cargo to 'secretaria'@'%';
grant select, insert, update on bienestar.Estudiante to 'secretaria'@'%';
grant select, insert, update on bienestar.Carrera to 'secretaria'@'%';

grant select on bienestar.Area to 'secretaria'@'%';
grant select on bienestar.Programa to 'secretaria'@'%';

grant select, insert, update on bienestar.Programa_tiene_EventoTaller to 'secretaria'@'%';
grant select, insert, update on bienestar.EventoTaller to 'secretaria'@'%';
grant select, insert, update on bienestar.Programa_tiene_proyecto to 'secretaria'@'%';

grant select on bienestar.Proyecto to 'secretaria'@'%';

grant select, update on bienestar.Convocatoria to 'secretaria'@'%';

grant all on bienestar.Estudiante_toma_convocatoria to 'secretaria'@'%';

grant select, update on bienestar.TiendaBienestar to 'secretaria'@'%';
grant select, insert, update on bienestar.empleado_tiendaUN to 'secretaria'@'%';
grant select, update on bienestar.Producto to 'secretaria'@'%';

grant select, insert, update on bienestar.producto_tiendaUN to 'secretaria'@'%';
grant select, insert, update on bienestar.Factura to 'secretaria'@'%';
grant select, insert, update on bienestar.factura_producto to 'secretaria'@'%';

grant select, insert on bienestar.FallaAlimentacion to 'secretaria'@'%';
grant select, insert on bienestar.ActividadCorresp to 'secretaria'@'%';
grant select, insert, update on bienestar.Corresponsabilidad to 'secretaria'@'%';
grant select, update on bienestar.ConvocatoriaGestionAlimentaria to 'secretaria'@'%';
grant select, update on bienestar.ConvocatoriaGestionTransporte to 'secretaria'@'%';
grant select, update on bienestar.ConvocatoriaGestionEconomica to 'secretaria'@'%';
grant select, update on bienestar.ConvocatoriaFomentoEmprendimeinto to 'secretaria'@'%';
grant select, update on bienestar.ConvocatoriaGestionAlojamiento to 'secretaria'@'%';

grant select, insert, update on bienestar.vw_info_estudiante to 'secretaria'@'%';
grant select, update on bienestar.vw_info_convocatoria_estudiante to 'secretaria'@'%';
grant select, insert, update on bienestar.vw_info_factura to 'secretaria'@'%';

#-----------------

grant all on bienestar.Persona to 'direccion_economica'@'%';
grant all on bienestar.persona_cargo to 'direccion_economica'@'%';
grant all on bienestar.Cargo to 'direccion_economica'@'%';
grant all on bienestar.Estudiante to 'direccion_economica'@'%';
grant all on bienestar.Carrera to 'direccion_economica'@'%';
grant all on bienestar.Area to 'direccion_economica'@'%';
grant all on bienestar.Programa to 'direccion_economica'@'%';
grant all on bienestar.Programa_tiene_EventoTaller to 'direccion_economica'@'%';
grant all on bienestar.EventoTaller to 'direccion_economica'@'%';
grant all on bienestar.Programa_tiene_proyecto to 'direccion_economica'@'%';
grant all on bienestar.Proyecto to 'direccion_economica'@'%';
grant all on bienestar.Convocatoria to 'direccion_economica'@'%';
grant all on bienestar.Estudiante_toma_convocatoria to 'direccion_economica'@'%';
grant all on bienestar.TiendaBienestar to 'direccion_economica'@'%';
grant all on bienestar.empleado_tiendaUN to 'direccion_economica'@'%';
grant all on bienestar.Producto to 'direccion_economica'@'%';
grant all on bienestar.producto_tiendaUN to 'direccion_economica'@'%';
grant all on bienestar.Factura to 'direccion_economica'@'%';
grant all on bienestar.factura_producto to 'direccion_economica'@'%';

grant select, insert, update on bienestar.FallaAlimentacion to 'direccion_economica'@'%';
grant select, insert, update on bienestar.ActividadCorresp to 'direccion_economica'@'%';
grant select, insert, update on bienestar.Corresponsabilidad to 'direccion_economica'@'%';
grant all on bienestar.ConvocatoriaGestionAlimentaria to 'direccion_economica'@'%';
grant all on bienestar.ConvocatoriaGestionTransporte to 'direccion_economica'@'%';
grant all on bienestar.ConvocatoriaGestionEconomica to 'direccion_economica'@'%';
grant all on bienestar.ConvocatoriaFomentoEmprendimeinto to 'direccion_economica'@'%';
grant all on bienestar.ConvocatoriaGestionAlojamiento to 'direccion_economica'@'%';

grant all on bienestar.vw_info_estudiante to 'direccion_economica'@'%';
grant all on bienestar.vw_info_convocatoria_estudiante to 'direccion_economica'@'%';
grant all on bienestar.vw_info_factura to 'direccion_economica'@'%';

#--------------------------------------------------------------------

#-------------------------------------------------------------------
#Carlos
#--------------------------------------------------------------------

#Permisos para estudiante
grant select on Bienestar.TorneoInterno to 'estudiante'@'%';
grant select on Bienestar.ConvocatoriaCursoLibre to 'estudiante'@'%';
grant select on Bienestar.ConvocatoriaSeleccion to 'estudiante'@'%';
grant select on Bienestar.grupoartisticoinstitucional to 'estudiante'@'%';

grant select on Bienestar.CursoCultural to 'estudiante'@'%';
grant select on Bienestar.CursoCultural_has_Inscripcion to 'estudiante'@'%';
grant select on Bienestar.ConvocatoriaGAI to 'estudiante'@'%';

grant select on vw_info_curso_libre_convocatoria to 'estudiante'@'%';
grant select on vw_info_gai_convocatoria to 'estudiante'@'%';
grant select on vw_info_seleccion_convocatoria to 'estudiante'@'%';

#-------------------------------------------------------------------
#Permisos para no estudiantes

grant select on Bienestar.TorneoInterno to 'no_estudiante'@'%';
grant select on Bienestar.ConvocatoriaCursoLibre to 'no_estudiante'@'%';
grant select on Bienestar.ConvocatoriaSeleccion to 'no_estudiante'@'%';
grant select on Bienestar.grupoartisticoinstitucional to 'no_estudiante'@'%';

grant select on Bienestar.CursoCultural to 'no_estudiante'@'%';
grant select on Bienestar.CursoCultural_has_Inscripcion to 'no_estudiante'@'%';
grant select on Bienestar.ConvocatoriaGAI to 'no_estudiante'@'%';

grant select on vw_info_curso_libre_convocatoria to 'no_estudiante'@'%';
grant select on vw_info_gai_convocatoria to 'no_estudiante'@'%';
grant select on vw_info_seleccion_convocatoria to 'no_estudiante'@'%';

#-------------------------------------------------------------------
#Permisos para la secretaria de bienestar

grant all on Bienestar.TorneoInterno to 'secretaria'@'%';
grant select, insert, update on Bienestar.ConvocatoriaCursoLibre to 'secretaria'@'%';
grant select, insert, update on Bienestar.ConvocatoriaSeleccion to 'secretaria'@'%';
grant select, insert, update on Bienestar.grupoartisticoinstitucional to 'secretaria'@'%';

grant select, insert, update on Bienestar.CursoCultural to 'secretaria'@'%';
grant select, insert, update on Bienestar.CursoCultural_has_Inscripcion to 'secretaria'@'%';
grant select, insert, update on Bienestar.ConvocatoriaGAI to 'secretaria'@'%';

grant select, insert, update on vw_info_curso_libre_convocatoria to 'secretaria'@'%';
grant select, insert, update on vw_info_gai_convocatoria to 'secretaria'@'%';
grant select, insert, update on vw_info_seleccion_convocatoria to 'secretaria'@'%';

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
grant all on Bienestar.TorneoInterno to 'direccion_deporte'@'%';
grant all on Bienestar.ConvocatoriaSeleccion to 'direccion_deporte'@'%';
grant all on Bienestar.ConvocatoriaCursoLibre to 'direccion_deporte'@'%';

grant all on vw_info_curso_libre_convocatoria to 'direccion_deporte'@'%';
grant all on vw_info_seleccion_convocatoria to 'direccion_deporte'@'%';

#-------------------------------------------------------------------
#Permisos para la direccion de bienstar cultura
grant all on Bienestar.CursoCultural to 'direccion_cultural'@'%';
grant all on Bienestar.CursoCultural_has_Inscripcion to 'direccion_cultural'@'%';
grant all on Bienestar.ConvocatoriaGAI to 'direccion_cultural'@'%';
grant all on Bienestar.grupoartisticoinstitucional to 'direccion_cultural'@'%';

grant all on vw_info_gai_convocatoria to 'direccion_cultural'@'%';
*/
