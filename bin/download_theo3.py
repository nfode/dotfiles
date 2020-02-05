#!/bin/python

from urllib import request
from bs4 import BeautifulSoup
import requests
import os
import shutil

def download_file(link, file_name):
    r = requests.get(base_link + link, stream=True)
    r.raw.decode_content = True
    cwd = os.getcwd()
    with open(cwd + '/' + file_name, 'wb') as f:
        shutil.copyfileobj(r.raw, f)


base_link = "https://fmi.uni-stuttgart.de"
site = "https://fmi.uni-stuttgart.de/ti/teaching/w19/ti3/"
page = request.urlopen(site)
soup = BeautifulSoup(page, 'html.parser')
table = soup.findAll('table', attrs={'class': 'lehre'})[1]
for row in table.findAll('tr'):
    cells = row.findAll('td')
    if len(cells) > 0 and len(cells) == 3:
        link = cells[2].find('a')
        if link is not None:
            url = link.get('href')
            title = cells[2].text.replace(' ', '_').replace('/', '_')
            new_filename = cells[0].text + '_' + title + '.pdf'
            download_file(url, new_filename)
