from Course import Course
import re

courses = []


def scannerCourse():
    file = open("allCourse.txt", encoding="utf-8")
    line = file.readline()
    while line:
        txt = line.split('\t')
        if '/' in txt[0]:
            ids = txt[0].split('/')
            for courseID in ids:
                p1 = re.compile(r'[(](.*?)[)]', re.S)
                course = Course(courseID, txt[1])
                if is_number(re.findall(p1, txt[2])[0]):
                    course.setHours(int(re.findall(p1, txt[2])[0]))
                courses.append(course)
        else:
            p1 = re.compile(r'[(](.*?)[)]', re.S)
            course = Course(txt[0], txt[1])
            if is_number(re.findall(p1, txt[2])[0]):
                course.setHours(int(re.findall(p1, txt[2])[0]))
            courses.append(course)
        line = file.readline()
    file.close()


def is_number(s):
    try:
        int(s)
        return True
    except ValueError:
        return False


def scannerFI():
    file = open("FoundationCourses.txt", encoding="utf-8")
    line = file.readline()
    while line:
        txt = line.split('\t')
        for c in courses:
            if txt[0] == c.id:
                c.setMP(txt[3])
                break
        line = file.readline()
    file.close()


if __name__ == '__main__':
    scannerCourse()
    scannerFI()

    for c in courses:
        print(c.id, c.name, c.hours, c.MP,sep="\t")
