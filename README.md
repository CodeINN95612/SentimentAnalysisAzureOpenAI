# Modelo de Análisis de Sentimiento con Azure OpenAI

Este proyecto utiliza el servicio de AzureOpenAI para realizar el análisis de una conversación.

## Estructura de base de datos

Este proyecto está estructurado para funcionar con una base de datos MSSQLSERVER.  
Para que funcione debe existir por lo menos:

- Tabla "Conversaciones":
  - identifier: Id de la conversación
- Tabla "Mensajes":
  - identifierConversacion: Id de la conversación a la que pertenece
  - content: Contenido del mensaje
  - fecha: Fecha tipo DateTime del mensaje

> Nota: Se puede cambiar el funcionamiento de lectura de la base de datos alterando el archivo `./src/data/sentiment_database`

## Variables de entorno

En la raiz del proyecto se debe generar un archivo `.env` el cual mantiene variables de entorno necesarios para el proyecto:

```
AZURE_OPENAI_API_KEY="<Key>"
AZURE_OPENAI_API_VERSION="<Version>"
AZURE_OPENAI_URL="<URL>"
AZURE_OPENAI_DEPLOYMENT_NAME="<Deployment>"
DATABASE_SERVER = "<database server>"
DATABASE_CATALOG = "<database password>"
DATABASE_USER = "<database user>"
DATABASE_PASSWORD = "<database password>"
```

## Prompt de la IA

Para hacer el análisis se debe hacer un prompt al servicio de OpenAI, este prompt puede ser cambiado en `./config/prompt.json`.

```json
{
  "prompt": "Analiza la conversacion y responde si es positiva o negativa, la conversacion es positiva si el que responde las preguntas sabe responderlas"
}
```

## Ejecucion

Desde la raiz del proyecto ejecutar:

```bash
python .\src\main.py
```
