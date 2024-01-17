from datetime import datetime
from utils import eliminar_html

class Mensaje:
    def __init__(self, contenido: str, fecha: datetime, tipo_usuario: str) -> None:
        contenido = contenido\
            .replace('\xa0', ' ')\
            .replace('&nbsp;', ' ')
        self.contenido = eliminar_html(contenido)
        self.fecha = fecha
        self.tipo_usuario = tipo_usuario

    def __str__(self) -> str:
        return f"({self.contenido}, {self.fecha}, {self.tipo_usuario})"
    
def generate_conversation(mensajes: [Mensaje]):
    mensajes = sorted(mensajes, key=lambda k: k.fecha)
    return "\n".join([f"{m.tipo_usuario}: {m.contenido}" for m in mensajes])