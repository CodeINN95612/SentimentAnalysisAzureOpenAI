from openai import AzureOpenAI
from data.mensaje import Mensaje, generate_conversation
from data.parametro import Parametro
from globals import Globals

class SentimentModel:
    def __init__(self, client: AzureOpenAI, deployment_name: str):
        self.system_message = Globals.system_message
        self.client = client
        self.deployment_name = deployment_name

    def analize_conversation(self, conversacion: [Mensaje], parametros: [Parametro]) -> [(int, float)]:
        conversacion_completa = generate_conversation(conversacion)
        mensajes = self._generate_mensajes(conversacion_completa, parametros)
        response = self.client.chat.completions.create(
            messages=mensajes,
            model=self.deployment_name,
            temperature=0,
            max_tokens=800,
            top_p=0.95,
            frequency_penalty=0,
            presence_penalty=0,
            stop=None
        )
        analysis = response.choices[0].message.content
        comentario = self._separate_comentario(analysis)
        params = self._separate_params(analysis)
        return (comentario, params)

    def _generate_mensajes(self, conversacion: str, parametros: [Parametro]):

        contenido = "Analiza la conversacion siguiente:\n"
        contenido += conversacion
        contenido += "\nDebes analizar la conversacion en base a los siguientes parametros\n"
        for param in parametros:
            contenido += f"Nro {param.id}. {param.detalle} "
            contenido += f"(si = {param.si} ptos. "
            contenido += f"no = {param.no} ptos. "
            if param.parcial:
                contenido += f"/ parcial = {param.parcial}"
            contenido += ")\n"
        contenido += f"Dame un comentario de recomendacion para toda la conversacion en caso de ser necesario para el Consejero Estudiantil en formato: "
        contenido += f"\"Recomendación: <recomendacion>\"\n"
        contenido += f"Tu respuesta sera las calificaciones por cada uno de los {len(parametros)} parámetros siguiendo **SIEMPRE** el siguiente formato: "
        contenido += f"\"<NumeroDeParametro>. Puntuación: <calificacion>\"\n"
        
        return [
            {"role":"system","content": self.system_message},
            {"role":"user", "content": contenido}
        ]
    
    def _separate_comentario(self, analysis: str) -> str:
        lines = analysis.split("\n")
        lines = [l for l in lines if "Recom" in l]
        if len(lines) > 0:
            com = " ".join(lines[0].split(" ")[1:])
            return com
        return "No recommendation"

    def _separate_params(self, analysis: str) -> [(int, float)]:
        lines = analysis.split("\n")
        lines = [l for l in lines if "Puntu" in l]
        params = []
        for line in lines:
            datos = line.split(" ")
            nro = datos[0].replace(".", "")
            puntos = datos[2]
            params.append((int(nro), puntos))
        return params
