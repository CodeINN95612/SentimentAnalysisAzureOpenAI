from datetime import datetime

class Analisis:
    def __init__(self, id: str, idConversacion: str, comentario: str, fecha: datetime) -> None:
        self.id = id
        self.comentario = comentario
        self.idConversacion = idConversacion
        self.fecha = fecha