use bienestar;

drop user if exists 'estudiante'@'localhost';
drop user if exists 'no_estudiante'@'localhost';
drop user if exists 'secretaria'@'localhost';
drop user if exists 'direccion_economica'@'localhost';
drop user if exists 'direccion_salud'@'localhost';
drop user if exists 'direccion_deporte'@'localhost';
drop user if exists 'direccion_cultural'@'localhost';
CREATE user 'estudiante'@'localhost' identified by 'root';
CREATE user 'no_estudiante'@'localhost' identified by 'root';
CREATE user 'secretaria'@'localhost' identified by 'root';
CREATE user 'direccion_economica'@'localhost' identified by 'root';
CREATE user 'direccion_salud'@'localhost' identified by 'root';
CREATE user 'direccion_deporte'@'localhost' identified by 'root';
CREATE user 'direccion_cultural'@'localhost' identified by 'root';

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
#Valeria
#--------------------------------------------------------------------

GRANT SELECT, UPDATE ON perfilriesgointegral TO 'estudiante';
GRANT SELECT ON historiaclinica TO 'estudiante';
GRANT SELECT ON personalsalud TO 'estudiante';
GRANT SELECT ON ordenmedica TO 'estudiante';
GRANT SELECT ON medicamentos TO 'estudiante';
GRANT SELECT, UPDATE ON citamedica TO 'estudiante';

GRANT SELECT, UPDATE ON vw_citamedica_disponible TO 'estudiante';
GRANT SELECT ON vw_doctor_procedimiento TO 'estudiante';
# -----------------------------------------------------------------------------

GRANT SELECT, UPDATE ON perfilriesgointegral TO 'no_estudiante';
GRANT SELECT ON historiaclinica TO 'no_estudiante';
GRANT SELECT ON personalsalud TO 'no_estudiante';
GRANT SELECT ON ordenmedica TO 'no_estudiante';
GRANT SELECT ON medicamentos TO 'no_estudiante';
GRANT SELECT, UPDATE ON citamedica TO 'no_estudiante';

GRANT SELECT, UPDATE ON vw_citamedica_disponible TO 'no_estudiante';
GRANT SELECT ON vw_doctor_procedimiento TO 'no_estudiante';
# -----------------------------------------------------------------------------

GRANT SELECT, UPDATE ON discapacidad TO 'secretaria';
GRANT SELECT, UPDATE ON incapacidad TO 'secretaria';
GRANT SELECT, UPDATE ON atencionensalud TO 'secretaria';
GRANT SELECT, UPDATE ON perfilriesgointegral TO 'secretaria';
GRANT SELECT, INSERT, UPDATE ON historiaclinica TO 'secretaria';
GRANT ALL ON enfermedad TO 'secretaria';
GRANT SELECT, UPDATE ON personalsalud TO 'secretaria';
GRANT ALL ON citamedica TO 'secretaria';
GRANT SELECT, INSERT, UPDATE ON ordenmedica TO 'secretaria';
GRANT SELECT, INSERT, UPDATE ON medicamentos TO 'secretaria';
GRANT SELECT, INSERT, UPDATE ON evaluacionfisica TO 'secretaria';
GRANT SELECT, INSERT, UPDATE ON urgencia TO 'secretaria';
GRANT SELECT, UPDATE ON ambulancia TO 'secretaria';

GRANT ALL ON vw_citamedica_disponible TO 'secretaria';
GRANT SELECT ON vw_medicamentos_solicitados TO 'secretaria';
GRANT SELECT, UPDATE ON vw_doctor_procedimiento TO 'secretaria';

# -----------------------------------------------------------------------------

grant all on Persona to 'direccion_salud';
grant all on persona_cargo to 'direccion_salud';
grant all on Cargo to 'direccion_salud';
grant all on Estudiante to 'direccion_salud';
grant all on Carrera to 'direccion_salud';
grant all on Area to 'direccion_salud';
grant all on Programa to 'direccion_salud';
grant all on Programa_tiene_EventoTaller to 'direccion_salud';
grant all on EventoTaller to 'direccion_salud';
grant all on Programa_tiene_proyecto to 'direccion_salud';
grant all on Proyecto to 'direccion_salud';
grant all on Convocatoria to 'direccion_salud';
grant all on Estudiante_toma_convocatoria to 'direccion_salud';

GRANT ALL ON Discapacidad TO 'direccion_salud';
GRANT ALL ON Incapacidad TO 'direccion_salud';
GRANT ALL ON AtencionEnSalud TO 'direccion_salud';
GRANT ALL ON PerfilRiesgoIntegral TO 'direccion_salud';
GRANT ALL ON HistoriaClinica TO 'direccion_salud';
GRANT ALL ON Enfermedad TO 'direccion_salud';
GRANT ALL ON PersonalSalud TO 'direccion_salud';
GRANT ALL ON CitaMedica TO 'direccion_salud';
GRANT ALL ON OrdenMedica TO 'direccion_salud';
GRANT ALL ON Medicamentos TO 'direccion_salud';
GRANT ALL ON EvaluacionFisica TO 'direccion_salud';
GRANT ALL ON Urgencia TO 'direccion_salud';
GRANT ALL ON Ambulancia TO 'direccion_salud';

grant all on vw_info_estudiante to 'direccion_salud';
grant all on vw_info_convocatoria_estudiante to 'direccion_salud';

#--------------------------------------------------------------------

GRANT ALL ON vw_citamedica_disponible TO 'direccion_salud';
GRANT ALL ON vw_medicamentos_solicitados TO 'direccion_salud';
GRANT ALL ON vw_doctor_procedimiento TO 'direccion_salud';

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

#-------------------------------------------------------------------
#Permisos para la direccion de bienestar salud

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



FLUSH PRIVILEGES;

show grants for 'estudiante'@'localhost';
show grants for 'no_estudiante'@'localhost';
show grants for 'secretaria'@'localhost';
show grants for 'direccion_economica'@'localhost';
show grants for 'direccion_salud'@'localhost';
show grants for 'direccion_deporte'@'localhost';
show grants for 'direccion_cultural'@'localhost';
