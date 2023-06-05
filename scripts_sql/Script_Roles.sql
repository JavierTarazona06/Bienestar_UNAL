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

grant update on Bienestar.persona to 'estudiante'@'localhost';
grant update on Bienestar.estudiante to 'estudiante'@'localhost';

grant select on Bienestar.carrera to 'estudiante'@'localhost';
grant select on Bienestar.area to 'estudiante'@'localhost';
grant select on Bienestar.programa to 'estudiante'@'localhost';
grant select on Bienestar.programa_tiene_eventotaller to 'estudiante'@'localhost';
grant select on Bienestar.eventotaller to 'estudiante'@'localhost';
grant select on Bienestar.programa_tiene_proyecto to 'estudiante'@'localhost';
grant select on Bienestar.proyecto to 'estudiante'@'localhost';
grant select on Bienestar.convocatoria to 'estudiante'@'localhost';
grant select,insert on Bienestar.estudiante_toma_convocatoria to 'estudiante'@'localhost';
grant select on Bienestar.tiendabienestar to 'estudiante'@'localhost';
grant select on Bienestar.empleado_tiendaun to 'estudiante'@'localhost';
grant select on Bienestar.producto to 'estudiante'@'localhost';
grant select on Bienestar.producto_tiendaun to 'estudiante'@'localhost';
grant select on Bienestar.factura to 'estudiante'@'localhost';
grant select on Bienestar.factura_producto to 'estudiante'@'localhost';
grant select on Bienestar.fallaalimentacion to 'estudiante'@'localhost';
grant select on Bienestar.actividadcorresp to 'estudiante'@'localhost';
grant select on Bienestar.corresponsabilidad to 'estudiante'@'localhost';

grant select on Bienestar.convocatoriagestionalimentaria to 'estudiante'@'localhost';
grant select on Bienestar.convocatoriagestiontransporte to 'estudiante'@'localhost';
grant select on Bienestar.convocatoriagestioneconomica to 'estudiante'@'localhost';
grant select on Bienestar.convocatoriafomentoemprendimiento to 'estudiante'@'localhost';
grant select on Bienestar.convocatoriagestionalojamiento to 'estudiante'@'localhost';

grant select,update on Bienestar.vw_info_estudiante to 'estudiante'@'localhost';
grant select,insert on Bienestar.vw_info_convocatoria_estudiante to 'estudiante'@'localhost';
grant select on Bienestar.vw_info_factura to 'estudiante'@'localhost';

GRANT EXECUTE ON PROCEDURE sp_fallaalimentacion_est TO 'estudiante'@'localhost';
GRANT EXECUTE ON PROCEDURE sp_actividadcorresp_est TO 'estudiante'@'localhost';
GRANT EXECUTE ON FUNCTION horas_corresponsabilidad_est TO 'estudiante'@'localhost';
GRANT EXECUTE ON FUNCTION pbm_est TO 'estudiante'@'localhost';

GRANT EXECUTE ON PROCEDURE sp_insertar_est_tm_conv_est TO 'estudiante'@'localhost';
GRANT EXECUTE ON PROCEDURE programa_area_convocatoria TO 'estudiante'@'localhost';

GRANT EXECUTE ON PROCEDURE sp_convocatoriafomentoemprendimiento_est TO 'estudiante'@'localhost';
GRANT EXECUTE ON PROCEDURE sp_convocatoriagestionalimentaria_est TO 'estudiante'@'localhost';
GRANT EXECUTE ON PROCEDURE sp_convocatoriagestionalojamiento_est TO 'estudiante'@'localhost';
GRANT EXECUTE ON PROCEDURE sp_convocatoriagestioneconomica_est TO 'estudiante'@'localhost';
GRANT EXECUTE ON PROCEDURE sp_convocatoriagestiontransporte_est TO 'estudiante'@'localhost';

GRANT EXECUTE ON PROCEDURE sp_info_factura_per TO 'estudiante'@'localhost';
GRANT EXECUTE ON PROCEDURE sp_productos_tienda TO 'estudiante'@'localhost';
GRANT EXECUTE ON PROCEDURE sp_tiendas_ofrece_producto TO 'estudiante'@'localhost';
#---------------

grant update on Bienestar.persona to 'no_estudiante'@'localhost';

grant select on Bienestar.area to 'no_estudiante'@'localhost';
grant select on Bienestar.programa to 'no_estudiante'@'localhost';
grant select on Bienestar.programa_tiene_eventotaller to 'no_estudiante'@'localhost';
grant select on Bienestar.eventotaller to 'no_estudiante'@'localhost';
grant select on Bienestar.programa_tiene_proyecto to 'no_estudiante'@'localhost';
grant select on Bienestar.proyecto to 'no_estudiante'@'localhost';
grant select on Bienestar.convocatoria to 'no_estudiante'@'localhost';
grant select on Bienestar.tiendabienestar to 'no_estudiante'@'localhost';
grant select on Bienestar.empleado_tiendaun to 'no_estudiante'@'localhost';
grant select on Bienestar.producto to 'no_estudiante'@'localhost';
grant select on Bienestar.producto_tiendaun to 'no_estudiante'@'localhost';
grant select on Bienestar.factura to 'no_estudiante'@'localhost';
grant select on Bienestar.factura_producto to 'no_estudiante'@'localhost';

grant select on Bienestar.vw_info_factura to 'no_estudiante'@'localhost';

GRANT EXECUTE ON PROCEDURE sp_info_factura_per TO 'no_estudiante'@'localhost';
GRANT EXECUTE ON PROCEDURE sp_productos_tienda TO 'no_estudiante'@'localhost';
GRANT EXECUTE ON PROCEDURE sp_tiendas_ofrece_producto TO 'no_estudiante'@'localhost';

#---------------

grant select, insert, update on Bienestar.persona to 'secretaria'@'localhost';
grant select, insert, update on Bienestar.persona_cargo to 'secretaria'@'localhost';
grant select, insert, update on Bienestar.cargo to 'secretaria'@'localhost';
grant select, insert, update on Bienestar.Estudiante to 'secretaria'@'localhost';
grant select, insert, update on Bienestar.carrera to 'secretaria'@'localhost';

grant select on Bienestar.area to 'secretaria'@'localhost';
grant select on Bienestar.programa to 'secretaria'@'localhost';

grant select, insert, update on Bienestar.programa_tiene_EventoTaller to 'secretaria'@'localhost';
grant select, insert, update on Bienestar.EventoTaller to 'secretaria'@'localhost';
grant select, insert, update on Bienestar.programa_tiene_proyecto to 'secretaria'@'localhost';

grant select on Bienestar.proyecto to 'secretaria'@'localhost';

grant select, update on Bienestar.convocatoria to 'secretaria'@'localhost';

grant all on Bienestar.Estudiante_toma_convocatoria to 'secretaria'@'localhost';

grant select, update on Bienestar.tiendabienestar to 'secretaria'@'localhost';
grant select, insert, update on Bienestar.empleado_tiendaun to 'secretaria'@'localhost';
grant select, update on Bienestar.producto to 'secretaria'@'localhost';

grant select, insert, update on Bienestar.producto_tiendaun to 'secretaria'@'localhost';
grant select, insert, update on Bienestar.factura to 'secretaria'@'localhost';
grant select, insert, update on Bienestar.factura_producto to 'secretaria'@'localhost';

grant select, insert on Bienestar.FallaAlimentacion to 'secretaria'@'localhost';
grant select, insert on Bienestar.ActividadCorresp to 'secretaria'@'localhost';
grant select, insert, update on Bienestar.corresponsabilidad to 'secretaria'@'localhost';
grant select, update on Bienestar.convocatoriagestionalimentaria to 'secretaria'@'localhost';
grant select, update on Bienestar.convocatoriagestiontransporte to 'secretaria'@'localhost';
grant select, update on Bienestar.convocatoriagestioneconomica to 'secretaria'@'localhost';
grant select, update on Bienestar.convocatoriafomentoemprendimiento to 'secretaria'@'localhost';
grant select, update on Bienestar.convocatoriagestionalojamiento to 'secretaria'@'localhost';

grant select, insert, update on Bienestar.vw_info_estudiante to 'secretaria'@'localhost';
grant select, update on Bienestar.vw_info_convocatoria_estudiante to 'secretaria'@'localhost';
grant select, insert, update on Bienestar.vw_info_factura to 'secretaria'@'localhost';

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

grant all on Bienestar.persona to 'direccion_economica'@'localhost';
grant all on Bienestar.persona_cargo to 'direccion_economica'@'localhost';
grant all on Bienestar.cargo to 'direccion_economica'@'localhost';
grant all on Bienestar.estudiante to 'direccion_economica'@'localhost';
grant all on Bienestar.carrera to 'direccion_economica'@'localhost'; 
grant all on Bienestar.area to 'direccion_economica'@'localhost'; 
grant all on Bienestar.programa to 'direccion_economica'@'localhost'; 
grant all on Bienestar.programa_tiene_eventotaller to 'direccion_economica'@'localhost'; 
grant all on Bienestar.eventotaller to 'direccion_economica'@'localhost'; 
grant all on Bienestar.programa_tiene_proyecto to 'direccion_economica'@'localhost';
grant all on Bienestar.proyecto to 'direccion_economica'@'localhost';
grant all on Bienestar.convocatoria to 'direccion_economica'@'localhost'; 
grant all on Bienestar.estudiante_toma_convocatoria to 'direccion_economica'@'localhost';
grant all on Bienestar.tiendabienestar to 'direccion_economica'@'localhost'; 
grant all on Bienestar.empleado_tiendaun to 'direccion_economica'@'localhost'; -- *
grant all on Bienestar.producto to 'direccion_economica'@'localhost';
grant all on Bienestar.producto_tiendaun to 'direccion_economica'@'localhost';
grant all on Bienestar.factura to 'direccion_economica'@'localhost';
grant all on Bienestar.factura_producto to 'direccion_economica'@'localhost';

grant select, insert, update on Bienestar.fallaalimentacion to 'direccion_economica'@'localhost';
grant select, insert, update on Bienestar.actividadCorresp to 'direccion_economica'@'localhost';
grant select, insert, update on Bienestar.corresponsabilidad to 'direccion_economica'@'localhost';
grant all on Bienestar.convocatoriagestionalimentaria to 'direccion_economica'@'localhost';
grant all on Bienestar.convocatoriagestiontransporte to 'direccion_economica'@'localhost';
grant all on Bienestar.convocatoriagestioneconomica to 'direccion_economica'@'localhost';
grant all on Bienestar.convocatoriafomentoemprendimiento to 'direccion_economica'@'localhost';
grant all on Bienestar.convocatoriagestionalojamiento to 'direccion_economica'@'localhost';

grant all on Bienestar.vw_info_estudiante to 'direccion_economica'@'localhost';
grant all on Bienestar.vw_info_convocatoria_estudiante to 'direccion_economica'@'localhost';
grant all on Bienestar.vw_info_factura to 'direccion_economica'@'localhost';

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
# -----------------------------------------------------------------------------
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
# -----------------------------------------------------------------------------
GRANT EXECUTE ON PROCEDURE pas_create_citamedica TO 'secretaria'@'localhost';
GRANT EXECUTE ON PROCEDURE pas_remove_citamedica TO 'secretaria'@'localhost';
GRANT EXECUTE ON PROCEDURE pas_approve_incapacidad TO 'secretaria'@'localhost';
GRANT EXECUTE ON PROCEDURE pas_approve_atencionsalud TO 'secretaria'@'localhost';
GRANT EXECUTE ON PROCEDURE pas_update_resultados TO 'secretaria'@'localhost';
GRANT EXECUTE ON PROCEDURE pas_edit_perfilintegral TO 'secretaria'@'localhost';
# -----------------------------------------------------------------------------
GRANT EXECUTE ON PROCEDURE pas_create_citamedica TO 'direccion_salud'@'localhost';
GRANT EXECUTE ON PROCEDURE pas_remove_citamedica TO 'direccion_salud'@'localhost';
GRANT EXECUTE ON PROCEDURE pas_approve_incapacidad TO 'direccion_salud'@'localhost';
GRANT EXECUTE ON PROCEDURE pas_approve_atencionsalud TO 'direccion_salud'@'localhost';
GRANT EXECUTE ON PROCEDURE pas_update_resultados TO 'direccion_salud'@'localhost';
GRANT EXECUTE ON PROCEDURE pas_edit_perfilintegral TO 'direccion_salud'@'localhost';
#-------------------------------------------------------------------------------------------------------
#													Carlos
#--------------------------------------------------------------------------------------------------------

#--------------------------------------------Permisos para estudiantes--------------------------------------------------------------
grant select on Bienestar.torneointerno to 'estudiante'@'localhost';
grant select on Bienestar.convocatoriacursolibre to 'estudiante'@'localhost';
grant select on Bienestar.convocatoriaseleccion to 'estudiante'@'localhost';

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
grant select on Bienestar.torneointerno to 'no_estudiante'@'localhost';
grant select on Bienestar.convocatoriacursolibre to 'no_estudiante'@'localhost';
grant select on Bienestar.convocatoriaseleccion to 'no_estudiante'@'localhost';

grant select on vw_info_curso_libre_convocatoria to 'no_estudiante'@'localhost';
grant select on vw_info_seleccion_convocatoria to 'no_estudiante'@'localhost';

grant execute on procedure pas_consultar_eventoTaller_programa to 'no_estudiante'@'localhost';
grant execute on procedure pas_consultar_proyectos_programa to 'no_estudiante'@'localhost';
grant execute on procedure pas_consultar_proyectos_area to 'no_estudiante'@'localhost';
grant execute on procedure pas_consultar_eventoTaller_area to 'no_estudiante'@'localhost';
grant execute on procedure pas_consultar_info_eventoTaller to 'no_estudiante'@'localhost';
grant execute on procedure pas_consultar_info_proyecto to 'no_estudiante'@'localhost';


#-----------------------------------------Permisos para la secretaria de Bienestar----------------------------------------------------
grant all on Bienestar.torneointerno to 'secretaria'@'localhost';
grant select, insert, update on Bienestar.convocatoriacursolibre to 'secretaria'@'localhost';
grant select, insert, update on Bienestar.convocatoriaseleccion to 'secretaria'@'localhost';

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
grant all on Bienestar.torneointerno to 'direccion_deporte'@'localhost';
grant all on Bienestar.convocatoriacursolibre to 'direccion_deporte'@'localhost';
grant all on Bienestar.convocatoriaseleccion to 'direccion_deporte'@'localhost';

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