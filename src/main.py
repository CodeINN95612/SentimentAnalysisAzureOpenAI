from datetime import datetime
from time import sleep
import uuid
import dotenv
import os
from constants import Environment
from openai import AzureOpenAI
from data.analisis import Analisis
from data.analisis_parametro import AnalisisParametro
from data.sentiment_database import SentimentDatabase
from sentiment_model import SentimentModel
import config

config.load("config")

def start():
    db = SentimentDatabase(\
        os.getenv(Environment.database_server), \
        os.getenv(Environment.database_catalog), \
        os.getenv(Environment.database_user), \
        os.getenv(Environment.database_password))
    client = AzureOpenAI(
        api_key=os.getenv(Environment.azure_openai_key),  
        api_version=os.getenv(Environment.azure_openai_api_version),
        azure_endpoint = os.getenv(Environment.azure_openai_url)
    )
    deployment_name=os.getenv(Environment.azure_openai_deployment_name)
    sentimen_model = SentimentModel(client, deployment_name)

    db.connect()
    parametros = db.get_parametros()
    conversaciones = db.get_conversaciones()
    for conversacion in conversaciones:
        mensajes = db.get_mensajes_from_conversacion(conversacion)
        (comentario, params) = sentimen_model.analize_conversation(mensajes, parametros)
        new_uuid = uuid.uuid4()
        analisis = Analisis(new_uuid, conversacion, comentario, datetime.today())
        analisis_parametros = [AnalisisParametro(new_uuid, p[0], p[1]) for p in params]
        db.guarda_analisis_masivo(analisis, analisis_parametros)
        sleep(0.1) #PARA NO SOBRECARGAR LA API DE AZURE

if __name__ == '__main__':
    dotenv.load_dotenv()
    start()
    