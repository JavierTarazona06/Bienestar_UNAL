import pandas as pd
import json


class reader:

    def __init__(self, ruta_csv:str) -> None:

        # Ruta del archivo CSV
        #ruta_csv = "Datos_persona.csv"

        # Leer el archivo CSV en un DataFrame
        self.dataframe = pd.read_csv(ruta_csv)

        # Mostrar el contenido del DataFrame
        #print(self.dataframe)

    def chanhe_file(self, ruta_csv:str) -> None:
        # Ruta del archivo CSV
        #ruta_csv = "Datos_persona.csv"

        # Leer el archivo CSV en un DataFrame
        self.dataframe = pd.read_csv(ruta_csv)

        # Mostrar el contenido del DataFrame
        #print(self.dataframe)

    def to_json(self, ruta_json) -> list:

        #Resultado es una lista de diccionarios
        resultado:list = []

        #Columnas
        nombres_columnas:list = self.dataframe.columns
        #print(nombres_columnas)

        # Iterar cada línea del DataFrame
        for indice, fila in self.dataframe.iterrows():
            cur_dic:dict = {}
            for encabezado in nombres_columnas:
                cur_dic[f"{encabezado}"] = fila[f"{encabezado}"]
            resultado.append(cur_dic)
            
        # Ruta del archivo JSON
        #ruta_json = "ruta_del_archivo.json"

        # Escribir los datos en el archivo JSON
        with open(ruta_json, "w",  encoding="utf-8") as archivo_json:
            json.dump(resultado, archivo_json, ensure_ascii=False, indent=4)

        print(resultado)

        

    

read = reader("Modelo NOSQL\Datos_persona.csv")
read.to_json("Modelo NOSQL\persona.json")