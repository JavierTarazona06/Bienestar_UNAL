import copy
import json
from pymongo import MongoClient

def insert_to_mongo(coleccion, path:str):

    # Leer el archivo JSON
    with open(path, 'r', encoding='utf-8') as file:
        documentos1 = json.load(file)
        documentos2 = copy.deepcopy(documentos1)

    
    try:
        #Obtener el nombre del primer atributo que corresponde al ID del documento
        primer_atributo = next(iter(next(iter(documentos1))))

        #Establecer el id del docuemnto como _id para Mongo
        for documento in documentos1:
            documento['_id'] = documento.pop(f'{primer_atributo}')
            #documento.move_to_end('_id', last=False)

        # Insertar los documentos en la colección
        result = coleccion.insert_many(documentos1)
    except Exception: #En caso de que la llave primaria sea compuesta y no se pueda realizar el cambio del primer atributo a _id
        # Insertar los documentos en la colección
        result = coleccion.insert_many(documentos2)

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

collection = db.programa
insert_to_mongo(collection,"modelo_nosql\general\programa.json")

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

collection = db.curso_libre
insert_to_mongo(collection,"modelo_nosql\\area_deporte\curso_libre.json")