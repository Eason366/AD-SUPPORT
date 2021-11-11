import tkinter as tk
from tkinter import filedialog

from bs4 import BeautifulSoup

root = tk.Tk()
root.withdraw()

# 获取文件路径
file_path = filedialog.askopenfilename()

file = open(file_path)

subject = ['AA', 'AAA', 'ACC', 'ACE', 'AER', 'AES', 'AMS', 'APC', 'ARB', 'ARC', 'ART', 'ASO', 'ATH', 'BIO', 'BIS',
           'BLS', 'BOT', 'BSC', 'BTE', 'BUS', 'BWS', 'CAS', 'CCA', 'CEC', 'CHI', 'CHM', 'CIT', 'CJS', 'CLA', 'CLS',
           'CMA', 'CMR', 'CMS', 'COM', 'CPB', 'CPE', 'CPS', 'CRD', 'CRE', 'CSE', 'DSC', 'DST', 'EAS', 'ECE', 'ECO',
           'EDL', 'EDP', 'EDT', 'EGM', 'EGS', 'EHS', 'ENG', 'ENT', 'ENV', 'ESP', 'FAS', 'FIN', 'FRE', 'FST', 'FSW',
           'GEO', 'GER', 'GHS', 'GIC', 'GLG', 'GRK', 'GSC', 'GTY', 'HBW', 'HIN', 'HON', 'HST', 'HUM', 'IDS', 'IES',
           'IMS', 'ISA', 'ITL', 'ITS', 'JPN', 'JRN', 'KNH', 'KOR', 'LAS', 'LAT', 'LIN', 'LR', 'LST', 'LUX', 'MAC',
           'MBI', 'MGT', 'MJF', 'MKT', 'MME', 'MSC', 'MTH', 'MUS', 'NCS', 'NSC', 'NSG', 'ORG', 'PCE', 'PHL', 'PHY',
           'PLW', 'PMD', 'POL', 'POR', 'PSS', 'PSY', 'REL', 'RUS', 'SCA', 'SJS', 'SLM', 'SOC', 'SPA', 'SPN', 'STA',
           'STC', 'THE', 'UNV', 'WGS', 'WST', 'ZOO']

data = file.read()

soup = BeautifulSoup(data, 'html.parser')
soup.find_next_sibling()

for item in soup.find_all('td', 'dddefault'):
    if item.string in subject:
        courseNum = item.find_next_sibling('td').string
        print(item.string, courseNum)

"""
for items in soup.find('select', {'class': "form-control", 'id': "subject"}):
    items = BeautifulSoup(str(items), 'html.parser')
    for item in items.find_all('option'):
        result += '\''+item['value']+'\''+ ','


file = open('subject.txt', 'w', encoding="utf-8")
file.write(result)
file.close()

"""
