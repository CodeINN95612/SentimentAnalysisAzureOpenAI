from datetime import datetime
from utils import eliminar_html

class Mensaje:
    def __init__(self, contenido: str, fecha: datetime) -> None:
        contenido = contenido\
            .replace('\xa0', ' ')\
            .replace('&nbsp;', ' ')
        self.contenido = eliminar_html(contenido)
        self.fecha = fecha

    def __str__(self) -> str:
        return f"({self.contenido}, {self.fecha})"
    
def generate_conversation(mensajes: [Mensaje]):
    mensajes = sorted(mensajes, key=lambda k: k.fecha)
    return "\n".join([f"mensaje: {m.contenido}" for m in mensajes])