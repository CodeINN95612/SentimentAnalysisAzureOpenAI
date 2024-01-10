import dotenv
import os
from constants import Environment
from openai import AzureOpenAI
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
    conversaciones = db.get_conversaciones()
    mensajes = db.get_mensajes_from_conversacion(conversaciones[0])
    analisis = sentimen_model.analize_conversation(mensajes)
    print(analisis)

if __name__ == '__main__':
    dotenv.load_dotenv()
    start()
    