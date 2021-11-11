class Course(object):

    def __init__(self, id, name, hours, description):
        self.id = id
        self.name = name
        self.hours = hours
        self.description = description

    def show(self):

        x = self.id.split(' ')
        if x[1].isdigit():
            return '(\''+x[0]+'\',\''+x[1]+'\',\''+self.name+'\','+self.hours+'),'+'\n'
        else:
            return ''