import pyodbc
from data.analisis import Analisis
from data.analisis_parametro import AnalisisParametro
from data.mensaje import Mensaje
from data.parametro import Parametro

class SentimentDatabase:
    
    def __init__(self, server, database, username, password):
            self.server = server
            self.database = database
            self.username = username
            self.password = password
            self.connection = None

    def connect(self):
        connection_string = f"DRIVER={{SQL Server}};SERVER={self.server};DATABASE={self.database};UID={self.username};PWD={self.password}"
        self.connection = pyodbc.connect(connection_string)

    def get_conversaciones(self) -> [str]:
        if not self.connection:
            raise Exception("No connection to the database. Call connect() first.")
        
        cursor = self.connection.cursor()
        cursor.execute("SELECT identifier FROM [Conversaciones]")
        ids = cursor.fetchall()
        cursor.close()

        return [id[0] for id in ids]
    
    def get_mensajes_from_conversacion(self, idConversacion):
        if not self.connection:
            raise Exception("No connection to the database. Call connect() first.")
        
        cursor = self.connection.cursor()
        cursor.execute(f"SELECT content, fecha, tipoUsuario FROM [Mensajes] WHERE [identifierConversacion] = '{idConversacion}'")
        mensajes = cursor.fetchall()
        cursor.close()

        return [Mensaje(m[0], m[1], m[2]) for m in mensajes]
    
    def get_parametros(self):
        if not self.connection:
            raise Exception("No connection to the database. Call connect() first.")
        
        cursor = self.connection.cursor()
        cursor.execute(f"SELECT id, detalle, si, no, parcial FROM [Parametros] WHERE [Activo] = 1")
        parametros = cursor.fetchall()
        cursor.close()

        return [Parametro(p[0], p[1], p[2], p[3], p[4]) for p in parametros]
    
    def guarda_analisis_masivo(self, analisis: Analisis, analisis_parametros: [AnalisisParametro]):
        if not self.connection:
            raise Exception("No connection to the database. Call connect() first.")
        
        cursor = self.connection.cursor()

        try:
            cursor.execute(
                "INSERT INTO [Analisis] (id, idConversacion, comentario, fecha) VALUES (?, ?, ?, ?)",
                analisis.id, analisis.idConversacion, analisis.comentario, analisis.fecha
            )

            cursor.executemany(
                "INSERT INTO [AnalisisParametro] (idAnalisis, idParametro, calificacion) VALUES (?, ?, ?)",
                [(a.idAnalisis, a.idParametro, a.calificacion) for a in analisis_parametros]
            )

            self.connection.commit()

            print(f"Analizada conversacion {analisis.idConversacion}")

        except Exception as e:
            self.connection.rollback()
            print(f"Error en conversacion {analisis.idConversacion}: \n{e}")

        finally:
            cursor.close()

