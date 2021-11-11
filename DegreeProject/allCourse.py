import requests
from bs4 import BeautifulSoup

i = 0
file = open('allCourse.txt', 'w', encoding="utf-8")
header = {
    'User-Agent':   'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36'
}
subjects = ['AA','AAA', 'ACC', 'ACE', 'AER', 'AES', 'AMS', 'APC', 'ARB', 'ARC', 'ART', 'ASO', 'ATH', 'BIO', 'BIS',
           'BLS', 'BOT', 'BSC', 'BTE', 'BUS', 'BWS', 'CAS', 'CCA', 'CEC', 'CHI', 'CHM', 'CIT', 'CJS', 'CLA', 'CLS',
           'CMA', 'CMR', 'CMS', 'COM', 'CPB', 'CPE', 'CPS', 'CRD', 'CRE', 'CSE', 'DSC', 'DST', 'EAS', 'ECE', 'ECO',
           'EDL', 'EDP', 'EDT', 'EGM', 'EGS', 'EHS', 'ENG', 'ENT', 'ENV', 'ESP', 'FAS', 'FIN', 'FRE', 'FST', 'FSW',
           'GEO', 'GER', 'GHS', 'GIC', 'GLG', 'GRK', 'GSC', 'GTY', 'HBW', 'HIN', 'HON', 'HST', 'HUM', 'IDS', 'IES',
           'IMS', 'ISA', 'ITL', 'ITS', 'JPN', 'JRN', 'KNH', 'KOR', 'LAS', 'LAT', 'LIN', 'LR', 'LST', 'LUX', 'MAC',
           'MBI', 'MGT', 'MJF', 'MKT', 'MME', 'MSC', 'MTH', 'MUS', 'NCS', 'NSC', 'NSG', 'ORG', 'PCE', 'PHL', 'PHY',
           'PLW', 'PMD', 'POL', 'POR', 'PSS', 'PSY', 'REL', 'RUS', 'SCA', 'SJS', 'SLM', 'SOC', 'SPA', 'SPN', 'STA',
           'STC', 'THE', 'UNV', 'WGS', 'WST', 'ZOO']
for subject in subjects:

    html = requests.get('https://bulletin.miamioh.edu/courses-instruction/'+subject.lower()+'/', headers=header)

    soup = BeautifulSoup(html.text, 'html.parser')


    for item in soup.find_all('p', 'courseblocktitle'):
        i = i+1
        print(i,item.strong.string)


        txt = str(item.strong.string).split('.', 2)
        for t in txt:
            file.write(t+'\t')
        file.write('\n')



file.close()