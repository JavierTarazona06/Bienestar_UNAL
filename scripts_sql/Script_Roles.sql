use bienestar;

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

grant update on bienestar.persona to 'estudiante'@'%';
grant update on bienestar.estudiante to 'estudiante'@'%';

grant select on bienestar.Carrera to 'estudiante'@'%';
grant select on bienestar.Area to 'estudiante'@'%';
grant select on bienestar.Programa to 'estudiante'@'%';
grant select on bienestar.Programa_tiene_EventoTaller to 'estudiante'@'%';
grant select on bienestar.EventoTaller to 'estudiante'@'%';
grant select on bienestar.Programa_tiene_proyecto to 'estudiante'@'%';
grant select on bienestar.Proyecto to 'estudiante'@'%';
grant select on bienestar.Convocatoria to 'estudiante'@'%';
grant select,insert on bienestar.Estudiante_toma_convocatoria to 'estudiante'@'%';
grant select on bienestar.TiendaBienestar to 'estudiante'@'%';
grant select on bienestar.empleado_tiendaUN to 'estudiante'@'%';
grant select on bienestar.Producto to 'estudiante'@'%';
grant select on bienestar.producto_tiendaUN to 'estudiante'@'%';
grant select on bienestar.Factura to 'estudiante'@'%';
grant select on bienestar.factura_producto to 'estudiante'@'%';
grant select on bienestar.FallaAlimentacion to 'estudiante'@'%';
grant select on bienestar.ActividadCorresp to 'estudiante'@'%';
grant select on bienestar.Corresponsabilidad to 'estudiante'@'%';

grant select on bienestar.ConvocatoriaGestionAlimentaria to 'estudiante'@'%';
grant select on bienestar.ConvocatoriaGestionTransporte to 'estudiante'@'%';
grant select on bienestar.ConvocatoriaGestionEconomica to 'estudiante'@'%';
grant select on bienestar.ConvocatoriaFomentoEmprendimeinto to 'estudiante'@'%';
grant select on bienestar.ConvocatoriaGestionAlojamiento to 'estudiante'@'%';

grant select,update on bienestar.vw_info_estudiante to 'estudiante'@'%';
grant select,insert on bienestar.vw_info_convocatoria_estudiante to 'estudiante'@'%';
grant select on bienestar.vw_info_factura to 'estudiante'@'%';

GRANT EXECUTE ON PROCEDURE sp_fallaalimentacion_est TO 'estudiante'@'%';
GRANT EXECUTE ON PROCEDURE sp_actividadcorresp_est TO 'estudiante'@'%';
GRANT EXECUTE ON FUNCTION horas_corresponsabilidad_est TO 'estudiante'@'%';
GRANT EXECUTE ON FUNCTION pbm_est TO 'estudiante'@'%';

GRANT EXECUTE ON PROCEDURE sp_insertar_est_tm_conv_est TO 'estudiante'@'%';
GRANT EXECUTE ON PROCEDURE programa_area_convocatoria TO 'estudiante'@'%';

GRANT EXECUTE ON PROCEDURE sp_convocatoriafomentoemprendimeinto_est TO 'estudiante'@'%';
GRANT EXECUTE ON PROCEDURE sp_convocatoriagestionalimentaria_est TO 'estudiante'@'%';
GRANT EXECUTE ON PROCEDURE sp_convocatoriagestionalojamiento_est TO 'estudiante'@'%';
GRANT EXECUTE ON PROCEDURE sp_convocatoriagestioneconomica_est TO 'estudiante'@'%';
GRANT EXECUTE ON PROCEDURE sp_convocatoriagestiontransporte_est TO 'estudiante'@'%';

GRANT EXECUTE ON PROCEDURE sp_info_factura_per TO 'estudiante'@'%';
GRANT EXECUTE ON PROCEDURE sp_productos_tienda TO 'estudiante'@'%';
GRANT EXECUTE ON PROCEDURE sp_tiendas_ofrece_producto TO 'estudiante'@'%';
GRANT EXECUTE ON PROCEDURE eliminar_factura_usuario_tiempo TO 'estudiante'@'%';
GRANT EXECUTE ON PROCEDURE eliminar_factura_usuario TO 'estudiante'@'%';
GRANT EXECUTE ON PROCEDURE sp_insertar_prod_factura TO 'estudiante'@'%';
#---------------

grant update on bienestar.persona to 'no_estudiante'@'%';

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

GRANT EXECUTE ON PROCEDURE sp_info_factura_per TO 'no_estudiante'@'%';
GRANT EXECUTE ON PROCEDURE sp_productos_tienda TO 'no_estudiante'@'%';
GRANT EXECUTE ON PROCEDURE sp_tiendas_ofrece_producto TO 'no_estudiante'@'%';
GRANT EXECUTE ON PROCEDURE eliminar_factura_usuario_tiempo TO 'no_estudiante'@'%';
GRANT EXECUTE ON PROCEDURE eliminar_factura_usuario TO 'no_estudiante'@'%';
GRANT EXECUTE ON PROCEDURE sp_insertar_prod_factura TO 'no_estudiante'@'%';

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

GRANT EXECUTE ON PROCEDURE sp_insertar_est_tm_conv_est TO 'secretaria'@'%';
GRANT EXECUTE ON PROCEDURE nombre_convocatorias_up TO 'secretaria'@'%';
GRANT EXECUTE ON PROCEDURE programa_area_convocatoria TO 'secretaria'@'%';
GRANT EXECUTE ON PROCEDURE insertar_conv_en_curso TO 'secretaria'@'%';

GRANT EXECUTE ON PROCEDURE insertar_empl_tienda_un TO 'secretaria'@'%';
GRANT EXECUTE ON PROCEDURE sp_info_factura_per TO 'secretaria'@'%';
GRANT EXECUTE ON PROCEDURE insertar_prod_tienda_un TO 'secretaria'@'%';
GRANT EXECUTE ON PROCEDURE insertar_factura TO 'secretaria'@'%';
GRANT EXECUTE ON PROCEDURE sp_productos_tienda TO 'secretaria'@'%';
GRANT EXECUTE ON PROCEDURE sp_tiendas_ofrece_producto TO 'secretaria'@'%';
GRANT EXECUTE ON PROCEDURE eliminar_factura_usuario_tiempo TO 'secretaria'@'%';
GRANT EXECUTE ON PROCEDURE eliminar_factura_usuario TO 'secretaria'@'%';
GRANT EXECUTE ON PROCEDURE sp_insertar_prod_factura TO 'secretaria'@'%';

GRANT EXECUTE ON PROCEDURE insertar_falla_alimentacion_sec TO 'secretaria'@'%';
GRANT EXECUTE ON PROCEDURE insertar_act_corresponsabilidad TO 'secretaria'@'%';
GRANT EXECUTE ON PROCEDURE insertar_conv_alimento TO 'secretaria'@'%';
GRANT EXECUTE ON PROCEDURE insertar_conv_emprendimiento TO 'secretaria'@'%';
GRANT EXECUTE ON PROCEDURE insertar_conv_alojamiento TO 'secretaria'@'%';
GRANT EXECUTE ON PROCEDURE insertar_conv_economica TO 'secretaria'@'%';
GRANT EXECUTE ON PROCEDURE insertar_conv_transporte TO 'secretaria'@'%';

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

GRANT EXECUTE ON PROCEDURE sp_insertar_est_tm_conv_est TO 'direccion_economica'@'%';
GRANT EXECUTE ON PROCEDURE nombre_convocatorias_up TO 'direccion_economica'@'%';
GRANT EXECUTE ON PROCEDURE insertar_conv_en_curso TO 'direccion_economica'@'%';

GRANT EXECUTE ON PROCEDURE insertar_empl_tienda_un TO 'direccion_economica'@'%';
GRANT EXECUTE ON PROCEDURE sp_info_factura_per TO 'direccion_economica'@'%';
GRANT EXECUTE ON PROCEDURE borrar_empl_tienda_un TO 'direccion_economica'@'%';
GRANT EXECUTE ON PROCEDURE insertar_prod_tienda_un TO 'direccion_economica'@'%';
GRANT EXECUTE ON PROCEDURE borrar_prod_tienda_un TO 'direccion_economica'@'%';
GRANT EXECUTE ON PROCEDURE eliminar_factura_tiempo TO 'direccion_economica'@'%';
GRANT EXECUTE ON PROCEDURE sp_productos_tienda TO 'direccion_economica'@'%';
GRANT EXECUTE ON PROCEDURE sp_tiendas_ofrece_producto TO 'direccion_economica'@'%';
GRANT EXECUTE ON PROCEDURE eliminar_factura_usuario_tiempo TO 'direccion_economica'@'%';
GRANT EXECUTE ON PROCEDURE eliminar_factura_usuario TO 'direccion_economica'@'%';
GRANT EXECUTE ON PROCEDURE sp_insertar_prod_factura TO 'direccion_economica'@'%';


GRANT EXECUTE ON PROCEDURE insertar_act_corresponsabilidad TO 'direccion_economica'@'%';
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

#-------------------------------------------------------------------------------------------------------
#													Valeria
#--------------------------------------------------------------------------------------------------------
GRANT EXECUTE ON PROCEDURE pas_citas_disponibles TO 'estudiante'@'%';
GRANT EXECUTE ON PROCEDURE pas_citas_agendadas TO 'estudiante'@'%';
GRANT EXECUTE ON PROCEDURE pas_delete_cita_medica TO 'estudiante'@'%';
GRANT EXECUTE ON PROCEDURE pas_add_cita_medica TO 'estudiante'@'%';
GRANT EXECUTE ON PROCEDURE pas_check_resultados TO 'estudiante'@'%';
GRANT EXECUTE ON PROCEDURE pas_view_incapacidad TO 'estudiante'@'%';
GRANT EXECUTE ON PROCEDURE pas_add_incapacidad TO 'estudiante'@'%';
GRANT EXECUTE ON PROCEDURE pas_edit_incapacidad TO 'estudiante'@'%';
GRANT EXECUTE ON PROCEDURE pas_view_atencionsalud TO 'estudiante'@'%';
GRANT EXECUTE ON PROCEDURE pas_add_atencionsalud TO 'estudiante'@'%';
GRANT EXECUTE ON PROCEDURE pas_edit_atencionsalud TO 'estudiante'@'%';
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
grant select on Bienestar.TorneoInterno to 'estudiante'@'%';
grant select on Bienestar.ConvocatoriaCursoLibre to 'estudiante'@'%';
grant select on Bienestar.ConvocatoriaSeleccion to 'estudiante'@'%';

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


#------------------------------------------Permisos para no estudiantes-------------------------------------------------------------
grant select on Bienestar.TorneoInterno to 'no_estudiante'@'%';
grant select on Bienestar.ConvocatoriaCursoLibre to 'no_estudiante'@'%';
grant select on Bienestar.ConvocatoriaSeleccion to 'no_estudiante'@'%';

grant select on vw_info_curso_libre_convocatoria to 'no_estudiante'@'%';
grant select on vw_info_seleccion_convocatoria to 'no_estudiante'@'%';

grant execute on procedure pas_consultar_eventoTaller_programa to 'no_estudiante'@'%';
grant execute on procedure pas_consultar_proyectos_programa to 'no_estudiante'@'%';
grant execute on procedure pas_consultar_proyectos_area to 'no_estudiante'@'%';
grant execute on procedure pas_consultar_eventoTaller_area to 'no_estudiante'@'%';
grant execute on procedure pas_consultar_info_eventoTaller to 'no_estudiante'@'%';
grant execute on procedure pas_consultar_info_proyecto to 'no_estudiante'@'%';


#-----------------------------------------Permisos para la secretaria de bienestar----------------------------------------------------
grant all on Bienestar.TorneoInterno to 'secretaria'@'%';
grant select, insert, update on Bienestar.ConvocatoriaCursoLibre to 'secretaria'@'%';
grant select, insert, update on Bienestar.ConvocatoriaSeleccion to 'secretaria'@'%';

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
grant all on Bienestar.TorneoInterno to 'direccion_deporte'@'%';
grant all on Bienestar.ConvocatoriaCursoLibre to 'direccion_deporte'@'%';
grant all on Bienestar.ConvocatoriaSeleccion to 'direccion_deporte'@'%';

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