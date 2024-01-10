from openai import AzureOpenAI
from data.mensaje import Mensaje, generate_conversation
from globals import Globals

class SentimentModel:
    def __init__(self, client: AzureOpenAI, deployment_name: str):
        self.sentiment_prompt = Globals.promtp
        self.client = client
        self.deployment_name = deployment_name

    def analize_conversation(self, conversacion: [Mensaje]):
        conversacion_completa = generate_conversation(conversacion)
        mensajes = SentimentModel._generate_mensajes(self.sentiment_prompt, conversacion_completa)
        response = self.client.chat.completions.create(
            messages=mensajes,
            model=self.deployment_name,
            temperature=0.1,
            max_tokens=800,
            top_p=0.95,
            frequency_penalty=0,
            presence_penalty=0,
            stop=None
        )
        return response.choices[0].message.content

    def _generate_mensajes(prompt, conversacion):
        return [
            {"role":"system","content":prompt},
            {"role":"user", "content":f"La conversacion es la siguiente:\n{conversacion}"}
        ]