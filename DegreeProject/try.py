import requests
from bs4 import BeautifulSoup
from Course import Course

file = open('sql.txt', 'w', encoding="utf-8")
header = {
    'User-Agent': 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36'
}
course = {}
subjects = ['AA', 'AAA', 'ACC', 'ACE', 'AER', 'AES', 'AMS', 'APC', 'ARB', 'ARC', 'ART', 'ASO', 'ATH', 'BIO', 'BIS',
            'BLS', 'BOT', 'BSC', 'BTE', 'BUS', 'BWS', 'CAS', 'CCA', 'CEC', 'CHI', 'CHM', 'CIT', 'CJS', 'CLA', 'CLS',
            'CMA', 'CMR', 'CMS', 'COM', 'CPB', 'CPE', 'CPS', 'CRD', 'CRE', 'CSE', 'DSC', 'DST', 'EAS', 'ECE', 'ECO',
            'EDL', 'EDP', 'EDT', 'EGM', 'EGS', 'EHS', 'ENG', 'ENT', 'ENV', 'ESP', 'FAS', 'FIN', 'FRE', 'FST', 'FSW',
            'GEO', 'GER', 'GHS', 'GIC', 'GLG', 'GRK', 'GSC', 'GTY', 'HBW', 'HIN', 'HON', 'HST', 'HUM', 'IDS', 'IES',
            'IMS', 'ISA', 'ITL', 'ITS', 'JPN', 'JRN', 'KNH', 'KOR', 'LAS', 'LAT', 'LIN', 'LR', 'LST', 'LUX', 'MAC',
            'MBI', 'MGT', 'MJF', 'MKT', 'MME', 'MSC', 'MTH', 'MUS', 'NCS', 'NSC', 'NSG', 'ORG', 'PCE', 'PHL', 'PHY',
            'PLW', 'PMD', 'POL', 'POR', 'PSS', 'PSY', 'REL', 'RUS', 'SCA', 'SJS', 'SLM', 'SOC', 'SPA', 'SPN', 'STA',
            'STC', 'THE', 'UNV', 'WGS', 'WST', 'ZOO']
for subject in subjects:

    html = requests.get('https://bulletin.miamioh.edu/courses-instruction/' + subject.lower() + '/', headers=header)

    soup = BeautifulSoup(html.text, 'html.parser')

    for item in soup.find_all('p', 'courseblocktitle'):
        d = str(item.find_next_sibling('p', 'courseblockdesc').text)
        d = d.replace('\'', '\'\'')
        Clist = str(item.strong.string).split('.')
        hour = Clist[2].replace('(', '').replace(')', '').replace('MPC', '').replace('MPT', '').replace('MPF',
                                                                                                        '').replace(' ',
                                                                                                                    '').replace(
            ',', '')
        if subject in ['MTH', 'CSE', 'STA', 'ECO', 'MKT', 'FIN', 'BUS', 'ENG']:
            if '/' in Clist[0]:
                cl = Clist[0].split('/')

                if hour.isdigit():
                    a = Course(cl[0], Clist[1].replace('\'', '\'\''), hour, d)
                    course.update({cl[0]: a})
            else:
                if hour.isdigit() and Clist[0][4:5] not in '567':
                    print(Clist[0])
                    a = Course(Clist[0], Clist[1].replace('\'', '\'\''), hour, d)
                    course.update({Clist[0]: a})
        else:
            if '/' in Clist[0]:
                continue
            else:
                if hour.isdigit() and Clist[0][4:5] not in '34567':
                    print(Clist[0])
                    a = Course(Clist[0], Clist[1].replace('\'', '\'\''), hour, d)
                    course.update({Clist[0]: a})


for c in course:
    file.write(course[c].show())
file.close()
