from datetime import datetime

class AnalisisParametro:
    def __init__(self, idAnalisis: str, idParametro: int, calificacion: float) -> None:
        self.idAnalisis = idAnalisis
        self.idParametro = idParametro
        self.calificacion = calificacion
        