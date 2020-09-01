import requests
from bs4 import BeautifulSoup
from numpy import asarray


def related(keyword):
    url = "https://search.naver.com/search.naver?sm=top_hty&fbm=1&ie=utf8&query=" + keyword

    response = requests.get(url)
    html = response.text
    soup = BeautifulSoup(html, 'html.parser')
    ul = soup.find("ul", {"class": "_related_keyword_ul"})

    keywordarray = []

    for value in ul.find_all("li"):
        keywordarray.append(value.text)

    return keywordarray
