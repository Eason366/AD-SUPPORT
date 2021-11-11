import requests
from bs4 import BeautifulSoup

result = ''
header = {
    'User-Agent': 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36'
}
html = requests.get("https://bulletin.miamioh.edu/liberal-education/foundation-courses/", headers=header)

soup = BeautifulSoup(html.text, 'html.parser')
for item in soup.find_all('td', 'codecol'):
    try:
        course = item.a.string
        name = item.find_next_sibling('td').string
        hours = item.find_next_sibling('td', 'hourscol').string
        h = item.parent.parent.parent
        Foundation = str(h.find_previous_sibling('h3').string)
        Foundation_list = Foundation.split()
        foundation = Foundation_list[1][:-1]
        if foundation == "II" or foundation == 'III' or foundation == 'IV':
            Foundation = str(h.find_previous_sibling('h4').string)
            Foundation_list = Foundation.split()
            foundation = Foundation_list[0][:-1]
        if "/" in course:
            c = str(course).split('/')
            if len(c[0]) == 3:
                num = c[-1].split()[-1]
                course = c[-1]
                for courseName in c[0:-1]:
                    result += courseName, num + '\t' + name + '\t' + hours + '\t' + foundation + '\n'
                result += course + '\t' + name + '\t' + hours + '\t' + foundation + '\n'
            else:
                for course in c:
                    result += course + '\t' + name + '\t' + hours + '\t' + foundation + '\n'
        else:
            result += course + '\t' + name + '\t' + hours + '\t' + foundation + '\n'

    except:
        continue


file = open('FoundationCourses.txt', 'w', encoding="utf-8")
file.write(result)
file.close()
