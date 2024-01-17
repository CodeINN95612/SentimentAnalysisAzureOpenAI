# Análisis de Sentimiento con Azure OpenAI

Este proyecto utiliza el servicio de AzureOpenAI de Azure para realizar el análisis de una conversación de teams entre un consejero estudiantil y un estudiante de una universidad, a travez de la plataforma Teams.

## Estructura de base de datos

Este proyecto está estructurado para funcionar con una base de datos MSSQLSERVER.  
Para que funcione por defecto se debe ejecutar el archivo `DatabaseGeneration.sql` que se encuentra en la raiz del proyecto.
Este script generará una base de datos nueva llamada `InfoMentorTeams` con todas las tablas y campos mínimos requeridos para le funcionamiento del proyecto, y llenará con algunos datos.

> Nota: Se puede cambiar el funcionamiento de lectura y escritura de la base de datos alterando el archivo `./src/data/sentiment_database`

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

Para hacer el análisis se debe colocar un mensaje de sistema al servicio de OpenAI, este puede ser cambiado en `./config/prompt.json`.

```json
{
  "system_message": "Analiza la conversacion"
}
```

## Ejecucion

Desde la raiz del proyecto ejecutar:

```bash
python .\src\main.py
```

Por defecto ejecutará el análisis de las conversaciones que existan en la base de datos.

## Posibles Mejoras

- Si no existen datos en las tablas de bdd loggear en consola o lanzar error.
- Utilizar un ORM para base de datos.
- Mejorar el prompt de la conversación.
- Mejorar el parse de los datos.
- Normalizar tabla Parametros.
