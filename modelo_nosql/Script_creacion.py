import copy
import json
from pymongo import MongoClient

def insert_to_mongo(coleccion, path:str):

    
    try:

        # Leer el archivo JSON
        with open(path, 'r', encoding='utf-8') as file:
            documentos = json.load(file)

        #Obtener el nombre del primer atributo que corresponde al ID del documento
        primer_atributo = next(iter(next(iter(documentos))))

        #Establecer el id del docuemnto como _id para Mongo
        for documento in documentos:
            documento['_id'] = documento.pop(f'{primer_atributo}')
            #documento.move_to_end('_id', last=False)

        # Insertar los documentos en la colección
        result = coleccion.insert_many(documentos)
    except Exception: #En caso de que la llave primaria sea compuesta y no se pueda realizar el cambio del primer atributo a _id

        coleccion.drop()

        # Leer el archivo JSON
        with open(path, 'r', encoding='utf-8') as file:
            documentos = json.load(file)

        # Insertar los documentos en la colección
        result = coleccion.insert_many(documentos)

    # Imprimir los Objetos de los documentos insertados
    print(result.inserted_ids)


#--------------------------------------

# Conectar a la instancia de MongoDB
client = MongoClient('mongodb://localhost:27017')

# Seleccionar la base de datos
db = client.bienestar

#--------------------------------------

# Obtener la colección en la que se realizará la inserción masiva
collection = db.persona #Nombre de la colección
insert_to_mongo(collection,"modelo_nosql\general\persona.json") #Datos de la coleccion

collection = db.estudiante
insert_to_mongo(collection,"modelo_nosql\general\estudiante.json")

collection = db.area
insert_to_mongo(collection,"modelo_nosql\general\\area.json")

collection = db.carrera
insert_to_mongo(collection,"modelo_nosql\general\carrera.json")

collection = db.convocatoria_estudiante
insert_to_mongo(collection,"modelo_nosql\general\convocatoria_estudiante.json")

collection = db.convocatoria
insert_to_mongo(collection,"modelo_nosql\general\convocatoria.json")

collection = db.convocatoria_emb
insert_to_mongo(collection,"modelo_nosql\general\convocatoria_emb.json")

collection = db.programa
insert_to_mongo(collection,"modelo_nosql\general\programa.json")


#Área Económica

collection = db.actividad_corresponsabilidad
insert_to_mongo(collection,"modelo_nosql\\area_economica\\actividad_corresponsabilidad.json")

collection = db.conv_gest_alimento
insert_to_mongo(collection,"modelo_nosql\\area_economica\\conv_gest_alimento.json")

collection = db.conv_gest_alojamiento
insert_to_mongo(collection,"modelo_nosql\\area_economica\\conv_gest_alojamiento.json")

collection = db.conv_gest_economica
insert_to_mongo(collection,"modelo_nosql\\area_economica\\conv_gest_economica.json")

collection = db.conv_gest_emprendimiento
insert_to_mongo(collection,"modelo_nosql\\area_economica\\conv_gest_emprendimiento.json")

collection = db.conv_gest_transporte
insert_to_mongo(collection,"modelo_nosql\\area_economica\\conv_gest_transporte.json")

collection = db.estudiante_falla_alimentacion
insert_to_mongo(collection,"modelo_nosql\\area_economica\\estudiante_falla_alimentacion.json")

collection = db.factura
insert_to_mongo(collection,"modelo_nosql\\area_economica\\factura.json")

collection = db.producto
insert_to_mongo(collection,"modelo_nosql\\area_economica\\producto.json")

#Área Deporte

collection = db.curso_libre
insert_to_mongo(collection,"modelo_nosql\\area_deporte\curso_libre.json")

collection = db.evento_taller
insert_to_mongo(collection,"modelo_nosql\\area_deporte\evento_taller.json")

collection = db.proyecto
insert_to_mongo(collection,"modelo_nosql\general\proyecto.json")

collection = db.seleccion_convocatoria
insert_to_mongo(collection,"modelo_nosql\\area_deporte\seleccion_convocatoria.json")

collection = db.torneo_interno
insert_to_mongo(collection,"modelo_nosql\\area_deporte\\torneo_interno.json")