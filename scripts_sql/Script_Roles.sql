use Bienestar;

CREATE ROLE IF NOT EXISTS 'estudiante'@'%';
CREATE ROLE IF NOT EXISTS 'no_estudiante'@'%';
CREATE ROLE IF NOT EXISTS 'secretaria'@'%';
CREATE ROLE IF NOT EXISTS 'direccion_economica'@'%';
CREATE ROLE IF NOT EXISTS 'direccion_salud'@'%';
CREATE ROLE IF NOT EXISTS 'direccion_deporte'@'%';
CREATE ROLE IF NOT EXISTS 'direccion_cultural'@'%';

#-------------------------------------------------------------------------------------------------------
#														Javier
#--------------------------------------------------------------------------------------------------------

grant update on Bienestar.persona to 'estudiante'@'%';
grant update on Bienestar.estudiante to 'estudiante'@'%';

grant select on Bienestar.carrera to 'estudiante'@'%';
grant select on Bienestar.area to 'estudiante'@'%';
grant select on Bienestar.programa to 'estudiante'@'%';
grant select on Bienestar.programa_tiene_eventotaller to 'estudiante'@'%';
grant select on Bienestar.eventotaller to 'estudiante'@'%';
grant select on Bienestar.programa_tiene_proyecto to 'estudiante'@'%';
grant select on Bienestar.proyecto to 'estudiante'@'%';
grant select on Bienestar.convocatoria to 'estudiante'@'%';
grant select,insert on Bienestar.estudiante_toma_convocatoria to 'estudiante'@'%';
grant select on Bienestar.tiendabienestar to 'estudiante'@'%';
grant select on Bienestar.empleado_tiendaun to 'estudiante'@'%';
grant select on Bienestar.producto to 'estudiante'@'%';
grant select on Bienestar.producto_tiendaun to 'estudiante'@'%';
grant select on Bienestar.factura to 'estudiante'@'%';
grant select on Bienestar.factura_producto to 'estudiante'@'%';
grant select on Bienestar.fallaalimentacion to 'estudiante'@'%';
grant select on Bienestar.actividadcorresp to 'estudiante'@'%';
grant select on Bienestar.corresponsabilidad to 'estudiante'@'%';

grant select on Bienestar.convocatoriagestionalimentaria to 'estudiante'@'%';
grant select on Bienestar.convocatoriagestiontransporte to 'estudiante'@'%';
grant select on Bienestar.convocatoriagestioneconomica to 'estudiante'@'%';
grant select on Bienestar.convocatoriafomentoemprendimiento to 'estudiante'@'%';
grant select on Bienestar.convocatoriagestionalojamiento to 'estudiante'@'%';

grant select,update on Bienestar.vw_info_estudiante to 'estudiante'@'%';
grant select,insert on Bienestar.vw_info_convocatoria_estudiante to 'estudiante'@'%';
grant select on Bienestar.vw_info_factura to 'estudiante'@'%';

grant execute on procedure sp_fallaalimentacion_est to 'estudiante'@'%';
grant execute on procedure sp_actividadcorresp_est to 'estudiante'@'%';
grant execute on function horas_corresponsabilidad_est to 'estudiante'@'%';
grant execute on procedure sp_horas_corresponsabilidad_est to 'estudiante'@'%';
grant execute on function pbm_est to 'estudiante'@'%';
grant execute on procedure sp_pbm_est to 'estudiante'@'%';
grant execute on procedure sp_consultar_convocatorias_programa to 'estudiante'@'%';
GRANT EXECUTE ON PROCEDURE sp_insertar_act_corresponsabilidad TO 'estudiante'@'%';

grant execute on procedure sp_insertar_est_tm_conv_est to 'estudiante'@'%';
grant execute on procedure programa_area_convocatoria to 'estudiante'@'%';

grant execute on procedure sp_convocatoriafomentoemprendimiento_est to 'estudiante'@'%';
grant execute on procedure sp_convocatoriagestionalimentaria_est to 'estudiante'@'%';
grant execute on procedure sp_convocatoriagestionalojamiento_est to 'estudiante'@'%';
grant execute on procedure sp_convocatoriagestioneconomica_est to 'estudiante'@'%';
grant execute on procedure sp_convocatoriagestiontransporte_est to 'estudiante'@'%';

grant execute on procedure sp_convocatoriafomentoemprendimiento to 'estudiante'@'%';
grant execute on procedure sp_convocatoriafomentoemprendimiento_nombre to 'estudiante'@'%';
grant execute on procedure sp_convocatoriagestionalimentaria to 'estudiante'@'%';
grant execute on procedure sp_convocatoriagestionalimentaria_com to 'estudiante'@'%';
grant execute on procedure sp_convocatoriagestionalojamiento to 'estudiante'@'%';
grant execute on procedure sp_convocatoriagestionalojamiento_loc to 'estudiante'@'%';
grant execute on procedure sp_convocatoriagestioneconomica_mayor to 'estudiante'@'%';
grant execute on procedure sp_convocatoriagestioneconomica_menor to 'estudiante'@'%';
grant execute on procedure sp_convocatoriagestiontransporte to 'estudiante'@'%';

grant execute on procedure sp_convocatoriafomentoemprendimiento_filtro to 'estudiante'@'%';
grant execute on procedure sp_convocatoriagestionalimentaria_filtro to 'estudiante'@'%';
grant execute on procedure sp_convocatoriagestionalojamiento_filtro to 'estudiante'@'%';
grant execute on procedure sp_convocatoriagestioneconomica_filtro to 'estudiante'@'%';
grant execute on procedure sp_convocatoriagestiontransporte_filtro to 'estudiante'@'%';
grant execute on procedure sp_conv_inscritas_est to 'estudiante'@'%';

grant execute on procedure sp_info_factura_per to 'estudiante'@'%';
grant execute on procedure sp_productos_tienda_nombre to 'estudiante'@'%';
grant execute on procedure sp_tiendas_ofrece_producto to 'estudiante'@'%';
grant execute on procedure eliminar_factura_usuario_tiempo to 'estudiante'@'%';
grant execute on procedure eliminar_factura_usuario to 'estudiante'@'%';
grant execute on procedure insertar_factura to 'estudiante'@'%';
grant execute on procedure sp_eliminar_factura_usuario_tiempo to 'estudiante'@'%';
grant execute on procedure sp_insertar_prod_factura_per to 'estudiante'@'%';
#---------------

grant update on Bienestar.persona to 'no_estudiante'@'%';

grant select on Bienestar.area to 'no_estudiante'@'%';
grant select on Bienestar.programa to 'no_estudiante'@'%';
grant select on Bienestar.programa_tiene_eventotaller to 'no_estudiante'@'%';
grant select on Bienestar.eventotaller to 'no_estudiante'@'%';
grant select on Bienestar.programa_tiene_proyecto to 'no_estudiante'@'%';
grant select on Bienestar.proyecto to 'no_estudiante'@'%';
grant select on Bienestar.convocatoria to 'no_estudiante'@'%';
grant select on Bienestar.tiendabienestar to 'no_estudiante'@'%';
grant select on Bienestar.empleado_tiendaun to 'no_estudiante'@'%';
grant select on Bienestar.producto to 'no_estudiante'@'%';
grant select on Bienestar.producto_tiendaun to 'no_estudiante'@'%';
grant select on Bienestar.factura to 'no_estudiante'@'%';
grant select on Bienestar.factura_producto to 'no_estudiante'@'%';

grant select on Bienestar.vw_info_factura to 'no_estudiante'@'%';

grant execute on procedure sp_info_factura_per to 'no_estudiante'@'%';
grant execute on procedure sp_productos_tienda_nombre to 'no_estudiante'@'%';
grant execute on procedure sp_tiendas_ofrece_producto to 'no_estudiante'@'%';
grant execute on procedure eliminar_factura_usuario_tiempo to 'no_estudiante'@'%';
grant execute on procedure eliminar_factura_usuario to 'no_estudiante'@'%';
grant execute on procedure sp_eliminar_factura_usuario_tiempo to 'no_estudiante'@'%';
grant execute on procedure sp_insertar_prod_factura_per to 'no_estudiante'@'%';

#---------------

grant select, insert, update on Bienestar.persona to 'secretaria'@'%';
grant select, insert, update on Bienestar.persona_cargo to 'secretaria'@'%';
grant select, insert, update on Bienestar.cargo to 'secretaria'@'%';
grant select, insert, update on Bienestar.estudiante to 'secretaria'@'%';
grant select, insert, update on Bienestar.carrera to 'secretaria'@'%';

grant select on Bienestar.area to 'secretaria'@'%';
grant select on Bienestar.programa to 'secretaria'@'%';

grant select, insert, update on Bienestar.programa_tiene_eventotaller to 'secretaria'@'%';
grant select, insert, update on Bienestar.eventotaller to 'secretaria'@'%';
grant select, insert, update on Bienestar.programa_tiene_proyecto to 'secretaria'@'%';

grant select on Bienestar.proyecto to 'secretaria'@'%';

grant select, update on Bienestar.convocatoria to 'secretaria'@'%';

grant all on Bienestar.estudiante_toma_convocatoria to 'secretaria'@'%';

grant select, update on Bienestar.tiendabienestar to 'secretaria'@'%';
grant select, insert, update on Bienestar.empleado_tiendaun to 'secretaria'@'%';
grant select, update on Bienestar.producto to 'secretaria'@'%';

grant select, insert, update on Bienestar.producto_tiendaun to 'secretaria'@'%';
grant select, insert, update on Bienestar.factura to 'secretaria'@'%';
grant select, insert, update on Bienestar.factura_producto to 'secretaria'@'%';

grant select, insert on Bienestar.fallaalimentacion to 'secretaria'@'%';
grant select, insert on Bienestar.actividadcorresp to 'secretaria'@'%';
grant select, insert, update on Bienestar.corresponsabilidad to 'secretaria'@'%';
grant select, update on Bienestar.convocatoriagestionalimentaria to 'secretaria'@'%';
grant select, update on Bienestar.convocatoriagestiontransporte to 'secretaria'@'%';
grant select, update on Bienestar.convocatoriagestioneconomica to 'secretaria'@'%';
grant select, update on Bienestar.convocatoriafomentoemprendimiento to 'secretaria'@'%';
grant select, update on Bienestar.convocatoriagestionalojamiento to 'secretaria'@'%';

grant select, insert, update on Bienestar.vw_info_estudiante to 'secretaria'@'%';
grant select, update on Bienestar.vw_info_convocatoria_estudiante to 'secretaria'@'%';
grant select, insert, update on Bienestar.vw_info_factura to 'secretaria'@'%';

grant execute on procedure sp_insertar_est_tm_conv_est to 'secretaria'@'%';
grant execute on procedure nombre_convocatorias_up to 'secretaria'@'%';
grant execute on procedure programa_area_convocatoria to 'secretaria'@'%';
grant execute on procedure insertar_conv_en_curso to 'secretaria'@'%';

grant execute on procedure insertar_empl_tienda_un to 'secretaria'@'%';
grant execute on procedure sp_info_factura_per to 'secretaria'@'%';
grant execute on procedure insertar_prod_tienda_un to 'secretaria'@'%';
grant execute on procedure insertar_factura to 'secretaria'@'%';
grant execute on procedure sp_productos_tienda_nombre to 'secretaria'@'%';
grant execute on procedure sp_tiendas_ofrece_producto to 'secretaria'@'%';
grant execute on procedure eliminar_factura_usuario_tiempo to 'secretaria'@'%';
grant execute on procedure eliminar_factura_usuario to 'secretaria'@'%';
grant execute on procedure sp_insertar_prod_factura to 'secretaria'@'%';

GRANT EXECUTE ON PROCEDURE insertar_falla_alimentacion_sec TO 'secretaria'@'%';
GRANT EXECUTE ON PROCEDURE sp_insertar_act_corresponsabilidad TO 'secretaria'@'%';
GRANT EXECUTE ON PROCEDURE insertar_conv_alimento TO 'secretaria'@'%';
GRANT EXECUTE ON PROCEDURE insertar_conv_emprendimiento TO 'secretaria'@'%';
GRANT EXECUTE ON PROCEDURE insertar_conv_alojamiento TO 'secretaria'@'%';
GRANT EXECUTE ON PROCEDURE insertar_conv_economica TO 'secretaria'@'%';
GRANT EXECUTE ON PROCEDURE insertar_conv_transporte TO 'secretaria'@'%';
grant execute on procedure sp_eliminar_factura_usuario_tiempo to 'secretaria'@'%';

#-----------------

grant all on Bienestar.persona to 'direccion_economica'@'%';
grant all on Bienestar.persona_cargo to 'direccion_economica'@'%';
grant all on Bienestar.cargo to 'direccion_economica'@'%';
grant all on Bienestar.estudiante to 'direccion_economica'@'%';
grant all on Bienestar.carrera to 'direccion_economica'@'%';
grant all on Bienestar.area to 'direccion_economica'@'%';
grant all on Bienestar.programa to 'direccion_economica'@'%';
grant all on Bienestar.programa_tiene_eventotaller to 'direccion_economica'@'%';
grant all on Bienestar.eventotaller to 'direccion_economica'@'%';
grant all on Bienestar.programa_tiene_proyecto to 'direccion_economica'@'%';
grant all on Bienestar.proyecto to 'direccion_economica'@'%';
grant all on Bienestar.convocatoria to 'direccion_economica'@'%';
grant all on Bienestar.estudiante_toma_convocatoria to 'direccion_economica'@'%';
grant all on Bienestar.tiendabienestar to 'direccion_economica'@'%';
grant all on Bienestar.empleado_tiendaun to 'direccion_economica'@'%';
grant all on Bienestar.producto to 'direccion_economica'@'%';
grant all on Bienestar.producto_tiendaun to 'direccion_economica'@'%';
grant all on Bienestar.factura to 'direccion_economica'@'%';
grant all on Bienestar.factura_producto to 'direccion_economica'@'%';

grant select, insert, update on Bienestar.fallaalimentacion to 'direccion_economica'@'%';
grant select, insert, update on Bienestar.actividadcorresp to 'direccion_economica'@'%';
grant select, insert, update on Bienestar.corresponsabilidad to 'direccion_economica'@'%';
grant all on Bienestar.convocatoriagestionalimentaria to 'direccion_economica'@'%';
grant all on Bienestar.convocatoriagestiontransporte to 'direccion_economica'@'%';
grant all on Bienestar.convocatoriagestioneconomica to 'direccion_economica'@'%';
grant all on Bienestar.convocatoriafomentoemprendimiento to 'direccion_economica'@'%';
grant all on Bienestar.convocatoriagestionalojamiento to 'direccion_economica'@'%';

grant all on Bienestar.vw_info_estudiante to 'direccion_economica'@'%';
grant all on Bienestar.vw_info_convocatoria_estudiante to 'direccion_economica'@'%';
grant all on Bienestar.vw_info_factura to 'direccion_economica'@'%';

GRANT EXECUTE ON PROCEDURE sp_insertar_est_tm_conv_est TO 'direccion_economica'@'%';
GRANT EXECUTE ON PROCEDURE nombre_convocatorias_up TO 'direccion_economica'@'%';
GRANT EXECUTE ON PROCEDURE insertar_conv_en_curso TO 'direccion_economica'@'%';

GRANT EXECUTE ON PROCEDURE insertar_empl_tienda_un TO 'direccion_economica'@'%';
GRANT EXECUTE ON PROCEDURE sp_info_factura_per TO 'direccion_economica'@'%';
GRANT EXECUTE ON PROCEDURE borrar_empl_tienda_un TO 'direccion_economica'@'%';
GRANT EXECUTE ON PROCEDURE insertar_prod_tienda_un TO 'direccion_economica'@'%';
GRANT EXECUTE ON PROCEDURE borrar_prod_tienda_un TO 'direccion_economica'@'%';
GRANT EXECUTE ON PROCEDURE eliminar_factura_tiempo TO 'direccion_economica'@'%';
GRANT EXECUTE ON PROCEDURE sp_productos_tienda_nombre TO 'direccion_economica'@'%';
GRANT EXECUTE ON PROCEDURE sp_tiendas_ofrece_producto TO 'direccion_economica'@'%';
GRANT EXECUTE ON PROCEDURE eliminar_factura_usuario_tiempo TO 'direccion_economica'@'%';
GRANT EXECUTE ON PROCEDURE eliminar_factura_usuario TO 'direccion_economica'@'%';
GRANT EXECUTE ON PROCEDURE sp_insertar_prod_factura TO 'direccion_economica'@'%';


GRANT EXECUTE ON PROCEDURE sp_insertar_act_corresponsabilidad TO 'direccion_economica'@'%';
GRANT EXECUTE ON PROCEDURE insertar_conv_alimento TO 'direccion_economica'@'%';
GRANT EXECUTE ON PROCEDURE eliminar_conv_alimento TO 'direccion_economica'@'%';
GRANT EXECUTE ON PROCEDURE insertar_conv_emprendimiento TO 'direccion_economica'@'%';
GRANT EXECUTE ON PROCEDURE eliminar_conv_emprendimiento TO 'direccion_economica'@'%';
GRANT EXECUTE ON PROCEDURE insertar_conv_alojamiento TO 'direccion_economica'@'%';
GRANT EXECUTE ON PROCEDURE eliminar_conv_alojamiento TO 'direccion_economica'@'%';
GRANT EXECUTE ON PROCEDURE insertar_conv_economica TO 'direccion_economica'@'%';
GRANT EXECUTE ON PROCEDURE eliminar_conv_economica TO 'direccion_economica'@'%';
GRANT EXECUTE ON PROCEDURE insertar_conv_transporte TO 'direccion_economica'@'%';
GRANT EXECUTE ON PROCEDURE eliminar_conv_transporte TO 'direccion_economica'@'%';
grant execute on procedure sp_eliminar_factura_usuario_tiempo to 'direccion_economica'@'%';

#-------------------------------------------------------------------------------------------------------
#													Valeria
#--------------------------------------------------------------------------------------------------------
Use Bienestar;
GRANT EXECUTE ON PROCEDURE pas_citas_disponibles TO 'estudiante'@'%';
GRANT EXECUTE ON PROCEDURE pas_citas_agendadas TO 'estudiante'@'%';
GRANT EXECUTE ON PROCEDURE pas_delete_cita_medica TO 'estudiante'@'%';
GRANT EXECUTE ON PROCEDURE pas_add_cita_medica TO 'estudiante'@'%';
GRANT EXECUTE ON PROCEDURE pas_check_resultados TO 'estudiante'@'%';
GRANT EXECUTE ON PROCEDURE pas_view_incapacidad TO 'estudiante'@'%';
GRANT EXECUTE ON PROCEDURE pas_add_incapacidad TO 'estudiante'@'%';
GRANT EXECUTE ON PROCEDURE pas_edit_incapacidad TO 'estudiante'@'%';
GRANT EXECUTE ON PROCEDURE pas_remove_incapacidad TO 'estudiante'@'%';
GRANT EXECUTE ON PROCEDURE pas_view_atencionsalud TO 'estudiante'@'%';
GRANT EXECUTE ON PROCEDURE pas_add_atencionsalud TO 'estudiante'@'%';
GRANT EXECUTE ON PROCEDURE pas_edit_atencionsalud TO 'estudiante'@'%';
GRANT EXECUTE ON PROCEDURE pas_remove_atencionsalud TO 'estudiante'@'%';
GRANT EXECUTE ON PROCEDURE pas_view_perfilriesgo TO 'estudiante'@'%';
# -----------------------------------------------------------------------------
GRANT EXECUTE ON PROCEDURE pas_citas_disponibles TO 'no_estudiante'@'%';
GRANT EXECUTE ON PROCEDURE pas_citas_agendadas TO 'no_estudiante'@'%';
GRANT EXECUTE ON PROCEDURE pas_delete_cita_medica TO 'no_estudiante'@'%';
GRANT EXECUTE ON PROCEDURE pas_add_cita_medica TO 'no_estudiante'@'%';
GRANT EXECUTE ON PROCEDURE pas_check_resultados TO 'no_estudiante'@'%';
GRANT EXECUTE ON PROCEDURE pas_view_incapacidad TO 'no_estudiante'@'%';
GRANT EXECUTE ON PROCEDURE pas_add_incapacidad TO 'no_estudiante'@'%';
GRANT EXECUTE ON PROCEDURE pas_edit_incapacidad TO 'no_estudiante'@'%';
GRANT EXECUTE ON PROCEDURE pas_view_atencionsalud TO 'no_estudiante'@'%';
GRANT EXECUTE ON PROCEDURE pas_add_atencionsalud TO 'no_estudiante'@'%';
GRANT EXECUTE ON PROCEDURE pas_edit_atencionsalud TO 'no_estudiante'@'%';
GRANT EXECUTE ON PROCEDURE pas_view_perfilriesgo TO 'no_estudiante'@'%';
# -----------------------------------------------------------------------------
GRANT EXECUTE ON PROCEDURE pas_create_citamedica TO 'secretaria'@'%';
GRANT EXECUTE ON PROCEDURE pas_remove_citamedica TO 'secretaria'@'%';
GRANT EXECUTE ON PROCEDURE pas_approve_incapacidad TO 'secretaria'@'%';
GRANT EXECUTE ON PROCEDURE pas_approve_atencionsalud TO 'secretaria'@'%';
GRANT EXECUTE ON PROCEDURE pas_update_resultados TO 'secretaria'@'%';
GRANT EXECUTE ON PROCEDURE pas_edit_perfilintegral TO 'secretaria'@'%';
# -----------------------------------------------------------------------------
GRANT EXECUTE ON PROCEDURE pas_create_citamedica TO 'direccion_salud'@'%';
GRANT EXECUTE ON PROCEDURE pas_remove_citamedica TO 'direccion_salud'@'%';
GRANT EXECUTE ON PROCEDURE pas_approve_incapacidad TO 'direccion_salud'@'%';
GRANT EXECUTE ON PROCEDURE pas_approve_atencionsalud TO 'direccion_salud'@'%';
GRANT EXECUTE ON PROCEDURE pas_update_resultados TO 'direccion_salud'@'%';
GRANT EXECUTE ON PROCEDURE pas_edit_perfilintegral TO 'direccion_salud'@'%';
#-------------------------------------------------------------------------------------------------------
#													Carlos
#--------------------------------------------------------------------------------------------------------

#--------------------------------------------Permisos para estudiantes--------------------------------------------------------------

grant select on Bienestar.torneointerno to 'estudiante'@'%';
grant select on Bienestar.convocatoriacursolibre to 'estudiante'@'%';
grant select on Bienestar.convocatoriaseleccion to 'estudiante'@'%';

grant select on vw_info_curso_libre_convocatoria to 'estudiante'@'%';
grant select on vw_info_seleccion_convocatoria to 'estudiante'@'%';
grant select on vw_info_convocatoria_estudiante to 'estudiante'@'%';

grant execute on procedure sp_consultar_mis_convocatorias to 'estudiante'@'%';
grant execute on procedure pas_participar_convocatoria to 'estudiante'@'%';
grant execute on procedure pas_consultar_eventoTaller_programa to 'estudiante'@'%';
grant execute on procedure pas_consultar_proyectos_programa to 'estudiante'@'%';
grant execute on procedure pas_consultar_proyectos_area to 'estudiante'@'%';
grant execute on procedure pas_consultar_eventoTaller_area to 'estudiante'@'%';
grant execute on procedure pas_consultar_info_eventoTaller to 'estudiante'@'%';
grant execute on procedure pas_consultar_info_proyecto to 'estudiante'@'%';
grant execute on procedure pas_estudiante_accede_conv to 'estudiante'@'%';

grant execute on procedure sp_consultar_torneos_internos to 'estudiante'@'%';
grant execute on procedure sp_consultar_convocatoria_cursos_libres to 'estudiante'@'%';
grant execute on procedure sp_consultar_convocatorias_programa to 'estudiante'@'%';


#------------------------------------------Permisos para no estudiantes-------------------------------------------------------------

grant select on Bienestar.torneointerno to 'no_estudiante'@'%';
grant select on Bienestar.convocatoriacursolibre to 'no_estudiante'@'%';
grant select on Bienestar.convocatoriaseleccion to 'no_estudiante'@'%';

grant select on vw_info_curso_libre_convocatoria to 'no_estudiante'@'%';
grant select on vw_info_seleccion_convocatoria to 'no_estudiante'@'%';

grant execute on procedure pas_consultar_eventoTaller_programa to 'no_estudiante'@'%';
grant execute on procedure pas_consultar_proyectos_programa to 'no_estudiante'@'%';
grant execute on procedure pas_consultar_proyectos_area to 'no_estudiante'@'%';
grant execute on procedure pas_consultar_eventoTaller_area to 'no_estudiante'@'%';
grant execute on procedure pas_consultar_info_eventoTaller to 'no_estudiante'@'%';
grant execute on procedure pas_consultar_info_proyecto to 'no_estudiante'@'%';


#-----------------------------------------Permisos para la secretaria de Bienestar----------------------------------------------------
grant all on Bienestar.torneointerno to 'secretaria'@'%';
grant select, insert, update on Bienestar.convocatoriacursolibre to 'secretaria'@'%';
grant select, insert, update on Bienestar.convocatoriaseleccion to 'secretaria'@'%';

grant select, insert, update on vw_info_curso_libre_convocatoria to 'secretaria'@'%';
grant select, insert, update on vw_info_seleccion_convocatoria to 'secretaria'@'%';
grant all on vw_info_convocatoria_estudiante to 'secretaria'@'%';

grant execute on procedure pas_participar_convocatoria to 'secretaria'@'%';
grant execute on procedure pas_consultar_eventoTaller_programa to 'secretaria'@'%';
grant execute on procedure pas_consultar_proyectos_programa to 'secretaria'@'%';
grant execute on procedure pas_consultar_proyectos_area to 'secretaria'@'%';
grant execute on procedure pas_consultar_eventoTaller_area to 'secretaria'@'%';
grant execute on procedure pas_consultar_info_eventoTaller to 'secretaria'@'%';
grant execute on procedure pas_consultar_info_proyecto to 'secretaria'@'%';
grant execute on procedure pas_crear_nuevoProyecto to 'secretaria'@'%';
grant execute on procedure pas_agendar_nuevoEventoTaller to 'secretaria'@'%';
grant execute on procedure pas_agregar_nuevo_torneo to 'secretaria'@'%';
grant execute on procedure pas_actualizar_ejecucion_proyecto to 'secretaria'@'%';
grant execute on procedure pas_actualizar_fecha_torneo to 'secretaria'@'%';
grant execute on procedure pas_actualizar_hora_convSeleccion to 'secretaria'@'%';
grant execute on procedure pas_actualizar_lugar_convSeleccion to 'secretaria'@'%';
grant execute on procedure pas_actualizar_fecha_eventoTaller to 'secretaria'@'%';
grant execute on procedure pas_actualizar_lugar_eventoTaller to 'secretaria'@'%';
grant execute on procedure pas_actualizar_hora_eventoTaller to 'secretaria'@'%';
grant execute on procedure pas_actualizar_fechas_proyecto to 'secretaria'@'%';
grant execute on procedure pas_agregar_convocatoria_cur_libre to 'secretaria'@'%';
grant execute on procedure pas_agregar_convocatoria_seleccion to 'secretaria'@'%';
grant execute on procedure pas_consultar_num_estudiantes to 'secretaria'@'%';
grant execute on procedure pas_check_proyecto to 'secretaria'@'%';
grant execute on procedure pas_estudiante_accede_conv to 'secretaria'@'%';


#------------------------------Permisos para la dirección de deporte-----------------------------------------
grant all on Bienestar.torneointerno to 'direccion_deporte'@'%';
grant all on Bienestar.convocatoriacursolibre to 'direccion_deporte'@'%';
grant all on Bienestar.convocatoriaseleccion to 'direccion_deporte'@'%';

grant all on vw_info_curso_libre_convocatoria to 'direccion_deporte'@'%';
grant all on vw_info_seleccion_convocatoriao to 'direccion_deporte'@'%';
grant all on vw_info_convocatoria_estudiante to 'direccion_deporte'@'%';

grant execute on procedure pas_participar_convocatoria to 'direccion_deporte'@'%';
grant execute on procedure pas_consultar_eventoTaller_programa to 'direccion_deporte'@'%';
grant execute on procedure pas_consultar_proyectos_programa to 'direccion_deporte'@'%';
grant execute on procedure pas_consultar_proyectos_area to 'direccion_deporte'@'%';
grant execute on procedure pas_consultar_eventoTaller_area to 'direccion_deporte'@'%';
grant execute on procedure pas_consultar_info_eventoTaller to 'direccion_deporte'@'%';
grant execute on procedure pas_consultar_info_proyecto to 'direccion_deporte'@'%';
grant execute on procedure pas_crear_nuevoProyecto to 'direccion_deporte'@'%';
grant execute on procedure pas_agendar_nuevoEventoTaller to 'direccion_deporte'@'%';
grant execute on procedure pas_agregar_nuevo_torneo to 'direccion_deporte'@'%';
grant execute on procedure pas_actualizar_ejecucion_proyecto to 'direccion_deporte'@'%';
grant execute on procedure pas_actualizar_fecha_torneo to 'direccion_deporte'@'%';
grant execute on procedure pas_actualizar_hora_convSeleccion to 'direccion_deporte'@'%';
grant execute on procedure pas_actualizar_lugar_convSeleccion to 'direccion_deporte'@'%';
grant execute on procedure pas_actualizar_fecha_eventoTaller to 'direccion_deporte'@'%';
grant execute on procedure pas_actualizar_lugar_eventoTaller to 'direccion_deporte'@'%';
grant execute on procedure pas_actualizar_hora_eventoTaller to 'direccion_deporte'@'%';
grant execute on procedure pas_actualizar_fechas_proyecto to 'direccion_deporte'@'%';
grant execute on procedure pas_agregar_convocatoria_cur_libre to 'direccion_deporte'@'%'; 
grant execute on procedure pas_agregar_convocatoria_seleccion to 'direccion_deporte'@'%';
grant execute on procedure pas_consultar_num_estudiantes to 'direccion_deporte'@'%';
grant execute on procedure pas_check_proyecto to 'direccion_deporte'@'%';
grant execute on procedure pas_estudiante_accede_conv to 'direccion_deporte'@'%';


FLUSH PRIVILEGES;
