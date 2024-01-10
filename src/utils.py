from bs4 import BeautifulSoup

def eliminar_html(texto_html) -> str:
    soup = BeautifulSoup(texto_html, 'html.parser')
    texto_sin_html = soup.get_text(separator=' ', strip=True)
    return texto_sin_html