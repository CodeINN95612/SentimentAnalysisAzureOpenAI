import pyodbc
from data.mensaje import Mensaje

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
        cursor.execute(f"SELECT content, fecha FROM [Mensajes] WHERE [identifierConversacion] = '{idConversacion}'")
        mensajes = cursor.fetchall()
        cursor.close()

        return [Mensaje(m[0], m[1]) for m in mensajes]

