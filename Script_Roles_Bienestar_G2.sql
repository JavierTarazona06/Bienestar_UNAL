use bienestar;

CREATE ROLE IF NOT EXISTS 'estudiante'@'localhost';
CREATE ROLE IF NOT EXISTS 'no_estudiante'@'localhost';
CREATE ROLE IF NOT EXISTS 'secretaria'@'localhost';
CREATE ROLE IF NOT EXISTS 'direccion_economica'@'localhost';
CREATE ROLE IF NOT EXISTS 'direccion_salud'@'localhost';
CREATE ROLE IF NOT EXISTS 'direccion_deporte'@'localhost';
CREATE ROLE IF NOT EXISTS 'direccion_cultural'@'localhost';

#-------------------------------------------------------------------------------------------------------
#														Javier
#--------------------------------------------------------------------------------------------------------

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
grant select,insert on bienestar.Estudiante_toma_convocatoria to 'estudiante'@'localhost';
grant select on bienestar.TiendaBienestar to 'estudiante'@'localhost';
grant select on bienestar.empleado_tiendaUN to 'estudiante'@'localhost';
grant select on bienestar.Producto to 'estudiante'@'localhost';
grant select on bienestar.producto_tiendaUN to 'estudiante'@'localhost';
grant select on bienestar.Factura to 'estudiante'@'localhost';
grant select on bienestar.factura_producto to 'estudiante'@'localhost';
grant select on bienestar.FallaAlimentacion to 'estudiante'@'localhost';
grant select on bienestar.ActividadCorresp to 'estudiante'@'localhost';
grant select on bienestar.Corresponsabilidad to 'estudiante'@'localhost';

grant select on bienestar.ConvocatoriaGestionAlimentaria to 'estudiante'@'localhost';
grant select on bienestar.ConvocatoriaGestionTransporte to 'estudiante'@'localhost';
grant select on bienestar.ConvocatoriaGestionEconomica to 'estudiante'@'localhost';
grant select on bienestar.ConvocatoriaFomentoEmprendimeinto to 'estudiante'@'localhost';
grant select on bienestar.ConvocatoriaGestionAlojamiento to 'estudiante'@'localhost';

grant select,update on bienestar.vw_info_estudiante to 'estudiante'@'localhost';
grant select,insert on bienestar.vw_info_convocatoria_estudiante to 'estudiante'@'localhost';
grant select on bienestar.vw_info_factura to 'estudiante'@'localhost';

GRANT EXECUTE ON PROCEDURE sp_fallaalimentacion_est TO 'estudiante'@'localhost';
GRANT EXECUTE ON PROCEDURE sp_actividadcorresp_est TO 'estudiante'@'localhost';
GRANT EXECUTE ON FUNCTION horas_corresponsabilidad_est TO 'estudiante'@'localhost';
GRANT EXECUTE ON FUNCTION pbm_est TO 'estudiante'@'localhost';

GRANT EXECUTE ON PROCEDURE sp_insertar_est_tm_conv_est TO 'estudiante'@'localhost';
GRANT EXECUTE ON PROCEDURE programa_area_convocatoria TO 'estudiante'@'localhost';

GRANT EXECUTE ON PROCEDURE sp_convocatoriafomentoemprendimeinto_est TO 'estudiante'@'localhost';
GRANT EXECUTE ON PROCEDURE sp_convocatoriagestionalimentaria_est TO 'estudiante'@'localhost';
GRANT EXECUTE ON PROCEDURE sp_convocatoriagestionalojamiento_est TO 'estudiante'@'localhost';
GRANT EXECUTE ON PROCEDURE sp_convocatoriagestioneconomica_est TO 'estudiante'@'localhost';
GRANT EXECUTE ON PROCEDURE sp_convocatoriagestiontransporte_est TO 'estudiante'@'localhost';

GRANT EXECUTE ON PROCEDURE sp_info_factura_per TO 'estudiante'@'localhost';
GRANT EXECUTE ON PROCEDURE sp_productos_tienda TO 'estudiante'@'localhost';
GRANT EXECUTE ON PROCEDURE sp_tiendas_ofrece_producto TO 'estudiante'@'localhost';
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

GRANT EXECUTE ON PROCEDURE sp_info_factura_per TO 'no_estudiante'@'localhost';
GRANT EXECUTE ON PROCEDURE sp_productos_tienda TO 'no_estudiante'@'localhost';
GRANT EXECUTE ON PROCEDURE sp_tiendas_ofrece_producto TO 'no_estudiante'@'localhost';

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

GRANT EXECUTE ON PROCEDURE sp_insertar_est_tm_conv_est TO 'secretaria'@'localhost';
GRANT EXECUTE ON PROCEDURE nombre_convocatorias_up TO 'secretaria'@'localhost';
GRANT EXECUTE ON PROCEDURE programa_area_convocatoria TO 'secretaria'@'localhost';
GRANT EXECUTE ON PROCEDURE insertar_conv_en_curso TO 'secretaria'@'localhost';

GRANT EXECUTE ON PROCEDURE insertar_empl_tienda_un TO 'secretaria'@'localhost';
GRANT EXECUTE ON PROCEDURE sp_info_factura_per TO 'secretaria'@'localhost';
GRANT EXECUTE ON PROCEDURE insertar_prod_tienda_un TO 'secretaria'@'localhost';
GRANT EXECUTE ON PROCEDURE insertar_factura TO 'secretaria'@'localhost';
GRANT EXECUTE ON PROCEDURE sp_productos_tienda TO 'secretaria'@'localhost';
GRANT EXECUTE ON PROCEDURE sp_tiendas_ofrece_producto TO 'secretaria'@'localhost';

GRANT EXECUTE ON PROCEDURE insertar_falla_alimentacion_sec TO 'secretaria'@'localhost';
GRANT EXECUTE ON PROCEDURE insertar_act_corresponsabilidad TO 'secretaria'@'localhost';
GRANT EXECUTE ON PROCEDURE insertar_conv_alimento TO 'secretaria'@'localhost';
GRANT EXECUTE ON PROCEDURE insertar_conv_emprendimiento TO 'secretaria'@'localhost';
GRANT EXECUTE ON PROCEDURE insertar_conv_alojamiento TO 'secretaria'@'localhost';
GRANT EXECUTE ON PROCEDURE insertar_conv_economica TO 'secretaria'@'localhost';
GRANT EXECUTE ON PROCEDURE insertar_conv_transporte TO 'secretaria'@'localhost';

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

GRANT EXECUTE ON PROCEDURE sp_insertar_est_tm_conv_est TO 'direccion_economica'@'localhost';
GRANT EXECUTE ON PROCEDURE nombre_convocatorias_up TO 'direccion_economica'@'localhost';
GRANT EXECUTE ON PROCEDURE insertar_conv_en_curso TO 'direccion_economica'@'localhost';

GRANT EXECUTE ON PROCEDURE insertar_empl_tienda_un TO 'direccion_economica'@'localhost';
GRANT EXECUTE ON PROCEDURE sp_info_factura_per TO 'direccion_economica'@'localhost';
GRANT EXECUTE ON PROCEDURE borrar_empl_tienda_un TO 'direccion_economica'@'localhost';
GRANT EXECUTE ON PROCEDURE insertar_prod_tienda_un TO 'direccion_economica'@'localhost';
GRANT EXECUTE ON PROCEDURE borrar_prod_tienda_un TO 'direccion_economica'@'localhost';
GRANT EXECUTE ON PROCEDURE eliminar_factura_tiempo TO 'direccion_economica'@'localhost';
GRANT EXECUTE ON PROCEDURE sp_productos_tienda TO 'direccion_economica'@'localhost';
GRANT EXECUTE ON PROCEDURE sp_tiendas_ofrece_producto TO 'direccion_economica'@'localhost';

GRANT EXECUTE ON PROCEDURE insertar_act_corresponsabilidad TO 'direccion_economica'@'localhost';
GRANT EXECUTE ON PROCEDURE insertar_conv_alimento TO 'direccion_economica'@'localhost';
GRANT EXECUTE ON PROCEDURE eliminar_conv_alimento TO 'direccion_economica'@'localhost';
GRANT EXECUTE ON PROCEDURE insertar_conv_emprendimiento TO 'direccion_economica'@'localhost';
GRANT EXECUTE ON PROCEDURE eliminar_conv_emprendimiento TO 'direccion_economica'@'localhost';
GRANT EXECUTE ON PROCEDURE insertar_conv_alojamiento TO 'direccion_economica'@'localhost';
GRANT EXECUTE ON PROCEDURE eliminar_conv_alojamiento TO 'direccion_economica'@'localhost';
GRANT EXECUTE ON PROCEDURE insertar_conv_economica TO 'direccion_economica'@'localhost';
GRANT EXECUTE ON PROCEDURE eliminar_conv_economica TO 'direccion_economica'@'localhost';
GRANT EXECUTE ON PROCEDURE insertar_conv_transporte TO 'direccion_economica'@'localhost';
GRANT EXECUTE ON PROCEDURE eliminar_conv_transporte TO 'direccion_economica'@'localhost';

#-------------------------------------------------------------------------------------------------------
#													Valeria
#--------------------------------------------------------------------------------------------------------

GRANT SELECT, UPDATE ON perfilriesgointegral TO 'estudiante'@'localhost';
GRANT SELECT ON enfermedad TO 'estudiante'@'localhost';
GRANT SELECT ON personalsalud TO 'estudiante'@'localhost';
GRANT SELECT ON ordenmedica TO 'estudiante'@'localhost';
GRANT SELECT ON medicamentos TO 'estudiante'@'localhost';
GRANT SELECT, UPDATE ON citamedica TO 'estudiante'@'localhost';

GRANT EXECUTE ON PROCEDURE pas_citas_disponibles TO 'estudiante'@'localhost';
GRANT EXECUTE ON PROCEDURE pas_citas_agendadas TO 'estudiante'@'localhost';
GRANT EXECUTE ON PROCEDURE pas_delete_cita_medica TO 'estudiante'@'localhost';
GRANT EXECUTE ON PROCEDURE pas_add_cita_medica TO 'estudiante'@'localhost';
GRANT EXECUTE ON PROCEDURE pas_check_resultados TO 'estudiante'@'localhost';
GRANT EXECUTE ON PROCEDURE pas_view_incapacidad TO 'estudiante'@'localhost';
GRANT EXECUTE ON PROCEDURE pas_add_incapacidad TO 'estudiante'@'localhost';
GRANT EXECUTE ON PROCEDURE pas_edit_incapacidad TO 'estudiante'@'localhost';
GRANT EXECUTE ON PROCEDURE pas_view_atencionsalud TO 'estudiante'@'localhost';
GRANT EXECUTE ON PROCEDURE pas_add_atencionsalud TO 'estudiante'@'localhost';
GRANT EXECUTE ON PROCEDURE pas_edit_atencionsalud TO 'estudiante'@'localhost';
GRANT EXECUTE ON PROCEDURE pas_view_perfilriesgo TO 'estudiante'@'localhost';

GRANT SELECT, UPDATE ON vw_citamedica_disponible TO 'estudiante'@'localhost';
GRANT SELECT ON vw_doctor_procedimiento TO 'estudiante'@'localhost';
# -----------------------------------------------------------------------------

GRANT SELECT, UPDATE ON perfilriesgointegral TO 'no_estudiante'@'localhost';
GRANT SELECT ON enfermedad TO 'no_estudiante'@'localhost';
GRANT SELECT ON personalsalud TO 'no_estudiante'@'localhost';
GRANT SELECT ON ordenmedica TO 'no_estudiante'@'localhost';
GRANT SELECT ON medicamentos TO 'no_estudiante'@'localhost';
GRANT SELECT, UPDATE ON citamedica TO 'no_estudiante'@'localhost';

GRANT EXECUTE ON PROCEDURE pas_citas_disponibles TO 'no_estudiante'@'localhost';
GRANT EXECUTE ON PROCEDURE pas_citas_agendadas TO 'no_estudiante'@'localhost';
GRANT EXECUTE ON PROCEDURE pas_delete_cita_medica TO 'no_estudiante'@'localhost';
GRANT EXECUTE ON PROCEDURE pas_add_cita_medica TO 'no_estudiante'@'localhost';
GRANT EXECUTE ON PROCEDURE pas_check_resultados TO 'no_estudiante'@'localhost';
GRANT EXECUTE ON PROCEDURE pas_view_incapacidad TO 'no_estudiante'@'localhost';
GRANT EXECUTE ON PROCEDURE pas_add_incapacidad TO 'no_estudiante'@'localhost';
GRANT EXECUTE ON PROCEDURE pas_edit_incapacidad TO 'no_estudiante'@'localhost';
GRANT EXECUTE ON PROCEDURE pas_view_atencionsalud TO 'no_estudiante'@'localhost';
GRANT EXECUTE ON PROCEDURE pas_add_atencionsalud TO 'no_estudiante'@'localhost';
GRANT EXECUTE ON PROCEDURE pas_edit_atencionsalud TO 'no_estudiante'@'localhost';
GRANT EXECUTE ON PROCEDURE pas_view_perfilriesgo TO 'no_estudiante'@'localhost';

GRANT SELECT, UPDATE ON vw_citamedica_disponible TO 'no_estudiante'@'localhost';
GRANT SELECT ON vw_doctor_procedimiento TO 'no_estudiante'@'localhost';
# -----------------------------------------------------------------------------

GRANT SELECT, UPDATE ON discapacidad TO 'secretaria'@'localhost';
GRANT SELECT, UPDATE ON incapacidad TO 'secretaria'@'localhost';
GRANT SELECT, UPDATE ON atencionensalud TO 'secretaria'@'localhost';
GRANT SELECT, UPDATE ON perfilriesgointegral TO 'secretaria'@'localhost';
GRANT ALL ON enfermedad TO 'secretaria'@'localhost';
GRANT SELECT, UPDATE ON personalsalud TO 'secretaria'@'localhost';
GRANT ALL ON citamedica TO 'secretaria'@'localhost';
GRANT SELECT, INSERT, UPDATE ON ordenmedica TO 'secretaria'@'localhost';
GRANT SELECT, INSERT, UPDATE ON medicamentos TO 'secretaria'@'localhost';
GRANT SELECT, INSERT, UPDATE ON evaluacionfisica TO 'secretaria'@'localhost';
GRANT SELECT, INSERT, UPDATE ON urgencia TO 'secretaria'@'localhost';
GRANT SELECT, UPDATE ON ambulancia TO 'secretaria'@'localhost';

GRANT EXECUTE ON PROCEDURE pas_create_citamedica TO 'secretaria'@'localhost';
GRANT EXECUTE ON PROCEDURE pas_remove_citamedica TO 'secretaria'@'localhost';
GRANT EXECUTE ON PROCEDURE pas_approve_incapacidad TO 'secretaria'@'localhost';
GRANT EXECUTE ON PROCEDURE pas_approve_atencionsalud TO 'secretaria'@'localhost';
GRANT EXECUTE ON PROCEDURE pas_update_resultados TO 'secretaria'@'localhost';
GRANT EXECUTE ON PROCEDURE pas_edit_perfilintegral TO 'secretaria'@'localhost';

GRANT ALL ON vw_citamedica_disponible TO 'secretaria'@'localhost';
GRANT SELECT ON vw_medicamentos_solicitados TO 'secretaria'@'localhost';
GRANT SELECT, UPDATE ON vw_doctor_procedimiento TO 'secretaria'@'localhost';

# -----------------------------------------------------------------------------

grant all on Persona to 'direccion_salud'@'localhost';
grant all on persona_cargo to 'direccion_salud'@'localhost';
grant all on Cargo to 'direccion_salud'@'localhost';
grant all on Estudiante to 'direccion_salud'@'localhost';
grant all on Carrera to 'direccion_salud'@'localhost';
grant all on Area to 'direccion_salud'@'localhost';
grant all on Programa to 'direccion_salud'@'localhost';
grant all on Programa_tiene_EventoTaller to 'direccion_salud'@'localhost';
grant all on EventoTaller to 'direccion_salud'@'localhost';
grant all on Programa_tiene_proyecto to 'direccion_salud'@'localhost';
grant all on Proyecto to 'direccion_salud'@'localhost';
grant all on Convocatoria to 'direccion_salud'@'localhost';
grant all on Estudiante_toma_convocatoria to 'direccion_salud'@'localhost';

grant all on vw_info_estudiante to 'direccion_salud'@'localhost';
grant all on vw_info_convocatoria_estudiante to 'direccion_salud'@'localhost';

GRANT ALL ON Discapacidad TO 'direccion_salud'@'localhost';
GRANT ALL ON Incapacidad TO 'direccion_salud'@'localhost';
GRANT ALL ON AtencionEnSalud TO 'direccion_salud'@'localhost';
GRANT ALL ON PerfilRiesgoIntegral TO 'direccion_salud'@'localhost';
GRANT ALL ON Enfermedad TO 'direccion_salud'@'localhost';
GRANT ALL ON PersonalSalud TO 'direccion_salud'@'localhost';
GRANT ALL ON CitaMedica TO 'direccion_salud'@'localhost';
GRANT ALL ON OrdenMedica TO 'direccion_salud'@'localhost';
GRANT ALL ON Medicamentos TO 'direccion_salud'@'localhost';
GRANT ALL ON EvaluacionFisica TO 'direccion_salud'@'localhost';
GRANT ALL ON Urgencia TO 'direccion_salud'@'localhost';
GRANT ALL ON Ambulancia TO 'direccion_salud'@'localhost';

GRANT EXECUTE ON PROCEDURE pas_create_citamedica TO 'direccion_salud'@'localhost';
GRANT EXECUTE ON PROCEDURE pas_remove_citamedica TO 'direccion_salud'@'localhost';
GRANT EXECUTE ON PROCEDURE pas_approve_incapacidad TO 'direccion_salud'@'localhost';
GRANT EXECUTE ON PROCEDURE pas_approve_atencionsalud TO 'direccion_salud'@'localhost';
GRANT EXECUTE ON PROCEDURE pas_update_resultados TO 'direccion_salud'@'localhost';
GRANT EXECUTE ON PROCEDURE pas_edit_perfilintegral TO 'direccion_salud'@'localhost';

GRANT ALL ON vw_citamedica_disponible TO 'direccion_salud'@'localhost';
GRANT ALL ON vw_medicamentos_solicitados TO 'direccion_salud'@'localhost';
GRANT ALL ON vw_doctor_procedimiento TO 'direccion_salud'@'localhost';


#-------------------------------------------------------------------------------------------------------
#													Carlos
#--------------------------------------------------------------------------------------------------------

#--------------------------------------------Permisos para estudiantes--------------------------------------------------------------
grant select on Bienestar.TorneoInterno to 'estudiante'@'localhost';
grant select on Bienestar.ConvocatoriaCursoLibre to 'estudiante'@'localhost';
grant select on Bienestar.ConvocatoriaSeleccion to 'estudiante'@'localhost';

grant select on vw_info_curso_libre_convocatoria to 'estudiante'@'localhost';
grant select on vw_info_seleccion_convocatoria to 'estudiante'@'localhost';
grant select on vw_info_convocatoria_estudiante to 'estudiante'@'localhost';

grant execute on procedure sp_consultar_mis_convocatorias to 'estudiante'@'localhost';
grant execute on procedure pas_participar_convocatoria to 'estudiante'@'localhost';
grant execute on procedure pas_consultar_eventoTaller_programa to 'estudiante'@'localhost';
grant execute on procedure pas_consultar_proyectos_programa to 'estudiante'@'localhost';
grant execute on procedure pas_consultar_proyectos_area to 'estudiante'@'localhost';
grant execute on procedure pas_consultar_eventoTaller_area to 'estudiante'@'localhost';
grant execute on procedure pas_consultar_info_eventoTaller to 'estudiante'@'localhost';
grant execute on procedure pas_consultar_info_proyecto to 'estudiante'@'localhost';
grant execute on procedure pas_estudiante_accede_conv to 'estudiante'@'localhost';


#------------------------------------------Permisos para no estudiantes-------------------------------------------------------------
grant select on Bienestar.TorneoInterno to 'no_estudiante'@'localhost';
grant select on Bienestar.ConvocatoriaCursoLibre to 'no_estudiante'@'localhost';
grant select on Bienestar.ConvocatoriaSeleccion to 'no_estudiante'@'localhost';

grant select on vw_info_curso_libre_convocatoria to 'no_estudiante'@'localhost';
grant select on vw_info_seleccion_convocatoria to 'no_estudiante'@'localhost';

grant execute on procedure pas_consultar_eventoTaller_programa to 'no_estudiante'@'localhost';
grant execute on procedure pas_consultar_proyectos_programa to 'no_estudiante'@'localhost';
grant execute on procedure pas_consultar_proyectos_area to 'no_estudiante'@'localhost';
grant execute on procedure pas_consultar_eventoTaller_area to 'no_estudiante'@'localhost';
grant execute on procedure pas_consultar_info_eventoTaller to 'no_estudiante'@'localhost';
grant execute on procedure pas_consultar_info_proyecto to 'no_estudiante'@'localhost';


#-----------------------------------------Permisos para la secretaria de bienestar----------------------------------------------------
grant all on Bienestar.TorneoInterno to 'secretaria'@'localhost';
grant select, insert, update on Bienestar.ConvocatoriaCursoLibre to 'secretaria'@'localhost';
grant select, insert, update on Bienestar.ConvocatoriaSeleccion to 'secretaria'@'localhost';

grant select, insert, update on vw_info_curso_libre_convocatoria to 'secretaria'@'localhost';
grant select, insert, update on vw_info_seleccion_convocatoria to 'secretaria'@'localhost';
grant all on vw_info_convocatoria_estudiante to 'secretaria'@'localhost';

grant execute on procedure pas_participar_convocatoria to 'secretaria'@'localhost';
grant execute on procedure pas_consultar_eventoTaller_programa to 'secretaria'@'localhost';
grant execute on procedure pas_consultar_proyectos_programa to 'secretaria'@'localhost';
grant execute on procedure pas_consultar_proyectos_area to 'secretaria'@'localhost';
grant execute on procedure pas_consultar_eventoTaller_area to 'secretaria'@'localhost';
grant execute on procedure pas_consultar_info_eventoTaller to 'secretaria'@'localhost';
grant execute on procedure pas_consultar_info_proyecto to 'secretaria'@'localhost';
grant execute on procedure pas_crear_nuevoProyecto to 'secretaria'@'localhost';
grant execute on procedure pas_agendar_nuevoEventoTaller to 'secretaria'@'localhost';
grant execute on procedure pas_agregar_nuevo_torneo to 'secretaria'@'localhost';
grant execute on procedure pas_actualizar_ejecucion_proyecto to 'secretaria'@'localhost';
grant execute on procedure pas_actualizar_fecha_torneo to 'secretaria'@'localhost';
grant execute on procedure pas_actualizar_hora_convSeleccion to 'secretaria'@'localhost';
grant execute on procedure pas_actualizar_lugar_convSeleccion to 'secretaria'@'localhost';
grant execute on procedure pas_actualizar_fecha_eventoTaller to 'secretaria'@'localhost';
grant execute on procedure pas_actualizar_lugar_eventoTaller to 'secretaria'@'localhost';
grant execute on procedure pas_actualizar_hora_eventoTaller to 'secretaria'@'localhost';
grant execute on procedure pas_actualizar_fechas_proyecto to 'secretaria'@'localhost';
grant execute on procedure pas_agregar_convocatoria_cur_libre to 'secretaria'@'localhost';
grant execute on procedure pas_agregar_convocatoria_seleccion to 'secretaria'@'localhost';
grant execute on procedure pas_consultar_num_estudiantes to 'secretaria'@'localhost';
grant execute on procedure pas_check_proyecto to 'secretaria'@'localhost';
grant execute on procedure pas_estudiante_accede_conv to 'secretaria'@'localhost';


#------------------------------Permisos para la dirección de deporte-----------------------------------------
grant all on Bienestar.TorneoInterno to 'direccion_deporte'@'localhost';
grant all on Bienestar.ConvocatoriaCursoLibre to 'direccion_deporte'@'localhost';
grant all on Bienestar.ConvocatoriaSeleccion to 'direccion_deporte'@'localhost';

grant all on vw_info_curso_libre_convocatoria to 'direccion_deporte'@'localhost';
grant all on vw_info_seleccion_convocatoriao to 'direccion_deporte'@'localhost';
grant all on vw_info_convocatoria_estudiante to 'direccion_deporte'@'localhost';

grant execute on procedure pas_participar_convocatoria to 'direccion_deporte'@'localhost';
grant execute on procedure pas_consultar_eventoTaller_programa to 'direccion_deporte'@'localhost';
grant execute on procedure pas_consultar_proyectos_programa to 'direccion_deporte'@'localhost';
grant execute on procedure pas_consultar_proyectos_area to 'direccion_deporte'@'localhost';
grant execute on procedure pas_consultar_eventoTaller_area to 'direccion_deporte'@'localhost';
grant execute on procedure pas_consultar_info_eventoTaller to 'direccion_deporte'@'localhost';
grant execute on procedure pas_consultar_info_proyecto to 'direccion_deporte'@'localhost';
grant execute on procedure pas_crear_nuevoProyecto to 'direccion_deporte'@'localhost';
grant execute on procedure pas_agendar_nuevoEventoTaller to 'direccion_deporte'@'localhost';
grant execute on procedure pas_agregar_nuevo_torneo to 'direccion_deporte'@'localhost';
grant execute on procedure pas_actualizar_ejecucion_proyecto to 'direccion_deporte'@'localhost';
grant execute on procedure pas_actualizar_fecha_torneo to 'direccion_deporte'@'localhost';
grant execute on procedure pas_actualizar_hora_convSeleccion to 'direccion_deporte'@'localhost';
grant execute on procedure pas_actualizar_lugar_convSeleccion to 'direccion_deporte'@'localhost';
grant execute on procedure pas_actualizar_fecha_eventoTaller to 'direccion_deporte'@'localhost';
grant execute on procedure pas_actualizar_lugar_eventoTaller to 'direccion_deporte'@'localhost';
grant execute on procedure pas_actualizar_hora_eventoTaller to 'direccion_deporte'@'localhost';
grant execute on procedure pas_actualizar_fechas_proyecto to 'direccion_deporte'@'localhost';
grant execute on procedure pas_agregar_convocatoria_cur_libre to 'direccion_deporte'@'localhost'; 
grant execute on procedure pas_agregar_convocatoria_seleccion to 'direccion_deporte'@'localhost';
grant execute on procedure pas_consultar_num_estudiantes to 'direccion_deporte'@'localhost';
grant execute on procedure pas_check_proyecto to 'direccion_deporte'@'localhost';
grant execute on procedure pas_estudiante_accede_conv to 'direccion_deporte'@'localhost';


FLUSH PRIVILEGES;