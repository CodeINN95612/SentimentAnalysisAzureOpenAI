from globals import Globals
import os
import json

def _loadPrompt(path):
    path = os.path.join(path, "prompt.json")
    try:
        with open(path, 'r') as file:
            objeto = json.load(file)
            Globals.promtp = objeto['prompt']
    except FileNotFoundError:
        print(f"Error: No se encontró el archivo '{path}'.")
    except json.JSONDecodeError:
        print(f"Error: No se pudo decodificar el contenido JSON del archivo '{path}'.")

def load(path):
    _loadPrompt(path)
