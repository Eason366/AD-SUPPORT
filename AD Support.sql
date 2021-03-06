USE master
GO

/****** Object:  Database AdSupport     ******/
IF DB_ID('AdSupport') IS NOT NULL
	DROP DATABASE AdSupport
GO

CREATE DATABASE AdSupport
GO 

USE AdSupport
GO

/****** Object:  Table Course     ******/
CREATE TABLE Course(
	CourseID int IDENTITY(1,1) NOT NULL,
	[Subject] varchar(10) NOT NULL,
	CourseNumber varchar(10) NOT NULL,
	Title varchar(MAX) NOT NULL,
	CreditHours int NOT NULL,
 CONSTRAINT PK_Course PRIMARY KEY CLUSTERED (
	CourseID ASC
 )
)
GO

/****** Object:  Table Student     ******/
CREATE TABLE Student(
	StudentMiamiID int NOT NULL,
	FirstName varchar(50) NOT NULL,
	LastName varchar(50) NOT NULL,
	Major varchar(50) NOT NULL,
	Minor varchar(50),
	EarnedHours int NOT NULL,
	GPAHours int NOT NULL,
	QualityPoints float(24) NOT NULL,
	AdvisorMiamiID int NOT NULL,
 CONSTRAINT PK_Student PRIMARY KEY CLUSTERED (
	StudentMiamiID ASC
 )
)
GO

/****** Object:  Table Advisor     ******/
CREATE TABLE Advisor(
	AdvisorMiamiID int NOT NULL,
	FirstName varchar(50) NOT NULL,
	LastName varchar(50) NOT NULL,
	[Password] VARBINARY(MAX) NOT NULL,
 CONSTRAINT PK_Advisor PRIMARY KEY CLUSTERED (
	AdvisorMiamiID ASC
 )
)
GO

/****** Object:  Table StudentCourse     ******/
CREATE TABLE StudentCourse(
	CourseID int NOT NULL,
	StudentMiamiID int NOT NULL,
	GradeLetter varchar(5) NOT NULL,
 CONSTRAINT PK_StudentCourse PRIMARY KEY CLUSTERED (
	CourseID ASC,
	StudentMiamiID ASC
 )
)
GO


/****** Object:  View GPA    ******/
CREATE VIEW [dbo].[vwGPA]
	AS 
SELECT S.FirstName, S.LastName,[GPA] = CAST((S.QualityPoints/S.GPAHours) as decimal(8,2)),S.Major, S.Minor
FROM Student S
GO



INSERT Course ([Subject], CourseNumber, Title, CreditHours) VALUES 
('AAA','201','  Intro to Asian/ Asian Amer',3),
('AAA','203','  Global Religions of India',3),
('AAA','207','  Asia and Globalization',3),
('AAA','210','  Psychology Across Cultures',3),
('AAA','211','  Writing with Purpose: Interdisciplinary Inquiry and Communication',3),
('AAA','248','  Asian American Literature',3),
('AAA','249','  Asian & Asian American Cinema',3),
('AAA','269','  Colonial & Postcolonial Literature',3),
('ACC','211','  Accounting for the Non-Business Major',3),
('ACC','221','  Introduction to Financial Accounting',3),
('ACC','222','  Introduction to Managerial Accounting',3),
('ACC','256','  Accountancy Career Exploration and Planning',1),
('ACE','112','  Advanced Communications Strategies: Speaking and Listening for Academic Contexts',5),
('ACE','113','  Reading and Writing in Academic Contexts',4),
('AES','110','  Leadership Laboratory',1),
('AES','111','  Leadership Laboratory',1),
('AES','121','  Heritage and Values of the United States Air Force',1),
('AES','122','  Heritage and Values of the United States Air Force',1),
('AES','210','  Leadership Laboratory',1),
('AES','211','  Leadership Laboratory',1),
('AES','221','  Team and Leadership Fundamentals',1),
('AES','222','  Team and Leadership Fundamentals',1),
('AMS','105','  American Studies Film Series',1),
('AMS','135','  Understanding Jazz, Its History and Context',3),
('AMS','183','  Images of America',3),
('AMS','205','  Introduction to American Cultures',3),
('AMS','206','  Approaches to American Culture',3),
('AMS','207','  America: Global and Intercultural Perspectives',3),
('AMS','211','  Writing with Purpose: Interdisciplinary Inquiry and Communication',3),
('AMS','216','  Introduction to Public History',3),
('AMS','222','  Italian American Culture',3),
('AMS','241','  Religions of the American Peoples',3),
('AMS','246','  Native American Literature',3),
('AMS','248','  Asian American Literature',3),
('AMS','281','  Americans in Berlin: An Interdisciplinary Study-Abroad Workshop',6),
('AMS','285','  Introduction to African American Music',3),
('APC','201','  Introduction to Health and Risk Communication',3),
('APC','239','  Theories of Communication',3),
('ARB','101','  Elementary Arabic I',4),
('ARB','102','  Elementary Arabic II',4),
('ARB','201','  Intermediate Modern Arabic',3),
('ARB','202','  Intermediate Modern Arabic',3),
('ARB','230','  Topics in Arabic Literature in Translation',3),
('ARC','101','  Beginning Design Studio',5),
('ARC','102','  Beginning Design Studio',5),
('ARC','103','  Shop Methods and Materials',1),
('ARC','105','  Introduction to Architecture',3),
('ARC','107','  Global Design',3),
('ARC','113','  Methods of Presentation, Representation and Re-Presentation',2),
('ARC','114','  Methods of Presentation, Representation and Re-Presentation',2),
('ARC','188','  Ideas in Architecture',3),
('ARC','201','  Architecture Studio',5),
('ARC','202','  Architecture Studio',5),
('ARC','203','  Interior Design Studio',5),
('ARC','204','  Interior Design Studio',5),
('ARC','211','  Introduction to Landscape and Urban Design',3),
('ARC','212','  Principles of Environmental Systems',3),
('ARC','213','  Graphic Media III',2),
('ARC','214','  Graphic Media IV',2),
('ARC','221','  History of Architecture I',3),
('ARC','222','  History of Architecture II',3),
('ARC','225','  Design: Behavior, Perception, Aesthetics',3),
('ART','183','  Images of America',3),
('ART','187','  History of Western Art: Prehistoric-Gothic',3),
('ART','188','  History of Western Art: Renaissance - Modern',3),
('ART','189','  History of Western Dress',3),
('ART','194','  Introduction to Art Therapy',3),
('ART','195','  Introduction to Art Education',3),
('ART','215','  3D Digital Sculpting',3),
('ART','218','  3D Shading and Texturing',3),
('ART','221','  Intermediate Drawing 1',3),
('ART','222','  Intermediate Drawing 2',3),
('ART','231','  Painting I',3),
('ART','233','  Global Perspectives on Dress',3),
('ART','241','  Printmaking I',3),
('ART','248','  Design Research Methods Basics',1),
('ART','249','  Letterpress for Designers',1),
('ART','251','  Typography',3),
('ART','252','  Image',3),
('ART','253','  Design Systems',3),
('ART','254','  Communication Design Studio 1',3),
('ART','255','  Introduction to Digital Photography',3),
('ART','256','  Design, Perception & Audience',3),
('ART','257','  Photography',3),
('ART','259','  Art and Digital Tools I',3),
('ART','261','  Ceramics I',3),
('ART','264','  Jewelry Design and Metals I',3),
('ART','271','  Sculpture I',3),
('ART','276','  Introduction to the Art of the Black Diaspora',3),
('ART','283','  Modern America',3),
('ART','285','  Writing and the Visual Arts',3),
('ART','286','  History of Asian Art, China, Korea, and Japan',3),
('ART','295','  Elementary Art Methods',3),
('ART','296','  Secondary Art Methods',3),
('ASO','201','  Introduction to Applied Social Research',3),
('ATH','135','  Film as Ethnography',1),
('ATH','145','  Lost Cities & Ancient Civilizations',3),
('ATH','155','  Introduction to Anthropology',3),
('ATH','185','  Cultural Diversity in the US',3),
('ATH','206','  Introduction to Latin America',3),
('ATH','212','  Introduction to Archaeological Theory and Methods',4),
('ATH','254','  Introduction to Russian and Eurasian Studies',3),
('ATH','255','  Introduction to Biological Anthropology',4),
('ATH','265','  Introduction to Linguistic Anthropology',4),
('BIO','101','  Biotechnology: Coming of Age in the 21st Century',3),
('BIO','102','  Introduction to Research in Biology',1),
('BIO','103','  Introduction to Research in Biology (Lab Rotations)',2),
('BIO','115','  Biological Concepts: Ecology, Evolution, Genetics, and Diversity',4),
('BIO','116','  Biological Concepts: Structure, Function, Cellular, and Molecular Biology',4),
('BIO','121','  Environmental Biology',3),
('BIO','126','  Evolution: Just a theory?',3),
('BIO','128','  Religion, Science, and Origins',3),
('BIO','131','  Plants, Humanity, and Environment',3),
('BIO','147','  Biology Introductory Seminar',1),
('BIO','155','  Field Botany',3),
('BIO','159','  Seminar in Neuroscience',1),
('BIO','161','  Principles of Human Physiology',4),
('BIO','171','  Human Anatomy and Physiology',4),
('BIO','172','  Human Anatomy and Physiology',4),
('BIO','176','  Ecology of North America',3),
('BIO','191','  Plant Biology',4),
('BIO','201','  Human Anatomy',4),
('BIO','203','  Introduction to Cell Biology',3),
('BIO','204','  Evolution of Plant Biodiversity: Genes to Biosphere',4),
('BIO','205','  Dendrology',4),
('BIO','206','  Evolutionary Biology',3),
('BIO','209','  Fundamentals of Ecology',3),
('BIO','241','  Botanical Principles in Landscape Gardening',3),
('BIO','244','  Viticulture and Enology',3),
('BIO','255','  Introduction to Biotechnology',3),
('BIO','256','  Introduction to Programming for the Life Sciences',3),
('BIS','201','  Introduction to Integrative Studies',3),
('BSC','292','  Applied Biology Sophomore Seminar: Planning Your Future in Applied Biology',1),
('BUS','101','  Foundations of Business',2),
('BUS','102','  Foundations of Business Communication',2),
('BUS','104','  Introduction to Computational Thinking for Business',2),
('BUS','106','  Farmer School of Business Success Strategies',1),
('BUS','203','  Business Writing Consulting',1),
('BUS','206','  Exploration for Business Majors',1),
('BUS','241','  Business in the Global Market',1),
('BUS','284','  Professional Communication for Business',3),
('BUS','301','  Basics of Business I',3),
('BUS','302','  Basics of Business II',3),
('BUS','303','  Business Process Integration',3),
('BUS','371','  International Business',3),
('BUS','373','  International Business in Focus',3),
('BWS','101','  Introduction to Strategic Learning Tools in BWS',1),
('BWS','156','  Introduction to Africa',4),
('BWS','181','  Introduction to Civil Rights and Social Movements',1),
('BWS','182','  Human Rights & Social Movements',1),
('BWS','204','  Brazilian Culture Through Popular Music',3),
('BWS','211','  Writing with Purpose: Interdisciplinary Inquiry and Communication',3),
('BWS','221','  African-American History',3),
('BWS','276','  Introduction to the Art of the Black Diaspora',3),
('BWS','279','  African Americans in Sport',3),
('CAS','116','  American Academic Culture Comm',3),
('CAS','131','  Practical English Grammar for English Language Learners',3),
('CAS','133','  Advanced Communication Strategies II: Speaking and Listening for Academic Contexts',3),
('CAS','134','  Critical Reading & Discussion in Academic Contexts for English Language Learners',3),
('CCA','111','  Innovation, Creativity and Design Thinking',3),
('CCA','121','  Introduction to the Integrated Arts and Culture',3),
('CCA','201','  Introduction to Arts Management',3),
('CCA','202','  Introduction to Music Business',3),
('CCA','220','  Arts Management & Arts Entrepreneurship Studio 1',2),
('CCA','221','  Immersion in the Integrated Arts and Culture',3),
('CCA','222','  Museums and Collections: Beyond the Curio Cabinet',3),
('CCA','232','  Museums Today: Content, Practices and Audiences',3),
('CEC','101','  Computing, Engineering & Society',1),
('CEC','102','  Problem Solving and Design',3),
('CEC','150','  CEC Scholars Seminar',0),
('CEC','205','  Agile Launchpad I',3),
('CEC','206','  Agile Launchpad II',3),
('CEC','266','  Metal on Metal: Engineering and Globalization in Heavy Metal Music',3),
('CEC','291','  Personal Leadership I',2),
('CEC','292','  Personal Leadership II',2),
('CHI','101','  Elementary Chinese',4),
('CHI','102','  Elementary Chinese',4),
('CHI','201','  Second Year Chinese',3),
('CHI','202','  Second Year Chinese',3),
('CHI','251','  Traditional Chinese Literature in English Translation',3),
('CHI','252','  Modern Chinese Literature in English Translation',3),
('CHI','253','  Three Kingdoms',3),
('CHI','254','  Modern Chinese Autobiography',3),
('CHI','255','  Drama in China and Japan in Translation',3),
('CHI','257','  Chinese Satire',3),
('CHI','264','  Chinese Cinema and Culture',3),
('CHM','109','  Chemistry Fundamentals',1),
('CHM','111','  Chemistry in Modern Society',3),
('CHM','121','  Introduction to Forensic Chemistry',4),
('CHM','131','  Chemistry of Life Processes',4),
('CHM','141','  College Chemistry',3),
('CHM','142','  College Chemistry',3),
('CHM','144','  College Chemistry Laboratory',2),
('CHM','145','  College Chemistry Laboratory',2),
('CHM','147','  Introductory Seminar-Chemistry/Biochemistry',1),
('CHM','204','  Organic Chemistry I Review',1),
('CHM','231','  Fundamentals of Organic Chemistry',4),
('CHM','241','  Organic Chemistry',3),
('CHM','242','  Organic Chemistry',3),
('CHM','244','  Organic Chemistry Laboratory',2),
('CHM','245','  Organic Chemistry Laboratory',2),
('CHM','251','  Organic Chemistry for Chemistry Majors',3),
('CHM','252','  Organic Chemistry for Chemistry Majors',3),
('CHM','254','  Organic Chemistry Laboratory for Chemistry Majors',2),
('CHM','255','  Organic Chemistry Laboratory for Chemistry Majors',2),
('CIT','101','  Computing Skills',1),
('CIT','154','  Personal Computer Concepts and Applications',3),
('CIT','167','  Information Technology People and Practices',2),
('CIT','168','  Information Technology Tools and Techniques for Organizations',4),
('CIT','201','  Advanced Spreadsheets and Analytics',3),
('CIT','205','  Agile Launchpad I',3),
('CIT','214','  Database Design and Development',3),
('CIT','253','  Contemporary Programming Languages',3),
('CIT','262','  Technology, Ethics, and Global Society',3),
('CIT','263','  Advanced Topics in Visual BASIC',3),
('CIT','268','  Introduction to Human-Computer Interaction',3),
('CIT','273','  Web Application Development',3),
('CIT','276','  IT Systems Design and Lifecycle Management',3),
('CIT','281','  Enterprise Network Infrastructure',3),
('CIT','284','  Enterprise Server Installation and Configuration',3),
('CIT','286','  Designing and Deploying Secure Enterprise Networks',3),
('CJS','101','  Introduction to the Criminal Justice Studies',3),
('CJS','125','  Law and the Courts',3),
('CJS','211','  Policing in America',3),
('CJS','220','  Criminal Justice Field Experience',3),
('CJS','231','  Criminal Procedure',3),
('CJS','276','  Homeland Security and Critical Incident Management',3),
('CJS','281','  Corrections in America',3),
('CJS','282','  Writing in Criminal Justice',3),
('CLA','190','  Community Leadership Dialogues',3),
('CLS','101','  Greek Civilization in its Mediterranean Context',3),
('CLS','102','  Roman Civilization',3),
('CLS','121','  Introduction to Classical Mythology',3),
('CLS','211','  Greek and Roman Epic',3),
('CLS','212','  Greek and Roman Tragedy',3),
('CLS','215','  Greek and Roman Historians',3),
('CLS','216','  Greek and Roman Cities',3),
('CLS','218','  Greek and Roman Erotic Poetry',3),
('CLS','222','  Race and Ethnicity in Antiquity',3),
('CLS','235','  Women in Antiquity',3),
('CLS','254','  Introduction to Russian and Eurasian Studies',3),
('CMA','101','  Introduction to Community Arts',1),
('CMR','101','  Introduction to Accounting I',3),
('CMR','105','  Introduction to Marketing',3),
('CMR','106','  Introduction to Business and the Economy',3),
('CMR','108','  Introduction to Business Law',3),
('CMR','111','  Introduction to Management I',3),
('CMR','112','  Introduction to Human Resources Management',3),
('CMR','117','  Personal Finance, An Introduction',3),
('CMR','125','  Medical Office Simulation',3),
('CMR','151','  Introduction to Hospitality Management',3),
('CMR','181','  Computers and Business',3),
('CMR','207','  Management Planning and Control',3),
('CMR','211','  Economics for Commerce',3),
('CMR','252','  Sanitation & Safety Principles',3),
('CMR','261','  Customer Service & Satisfaction',3),
('CMR','263','  Sales and Promotions',3),
('CMR','266','  Consumer Behavior',3),
('CMR','281','  Business Communication Software',3),
('CMR','282','  Computer-Based Business Analysis',3),
('CMR','284','  Emerging Digital Technologies for Business',3),
('CMR','285','  Business Information Management',3),
('CMR','286','  Digital Commerce',3),
('CMS','101','  The Smartphone and Society',3),
('CPB','102','  Introduction to Chemical and Biomedical Engineering',3),
('CPB','201','  Principles of Paper Science and Engineering',3),
('CPB','202','  Pulp and Paper Physics',3),
('CPB','204','  Mass and Energy Balances I',2),
('CPB','205','  Mass and Energy Balances II',2),
('CPB','219','  Statics and Mechanics of Materials',3),
('CPB','244','  Introduction to Environmental Engineering',3),
('CRE','151','  Introduction to Critical Race and Ethnic Studies',3),
('CSE','102','  Introduction to Computer Science and Software Engineering',3),
('CSE','148','  Business Computing',3),
('CSE','151','  Computers, Computer Science, and Society',3),
('CSE','153','  Introduction to C/C++ Programming',3),
('CSE','163','  Introduction to Computer Concepts and Programming',3),
('CSE','174','  Fundamentals of Programming and Problem Solving',3),
('CSE','201','  Introduction to Software Engineering',3),
('CSE','211','  Software Construction',3),
('CSE','212','  Software Engineering for User Interface and User Experience Design',3),
('CSE','220','  Professional Practice',0),
('CSE','243','  Problem Analysis Using Computer Tools',3),
('CSE','251','  Introduction to Game Programming',3),
('CSE','252','  Web Application Programming',3),
('CSE','256','  Introduction to Programming for the Life Sciences',3),
('CSE','262','  Technology, Ethics, and Global Society',3),
('CSE','271','  Object-Oriented Programming',3),
('CSE','273','  Optimization Modeling',3),
('CSE','274','  Data Abstraction and Data Structures',3),
('CSE','278','  Systems I: Introduction to Systems Programming',3),
('CSE','283','  Data Communication and Networks',3),
('CSE','311','  Software Architecture and Design',3),
('CSE','320','  Professional Practice',0),
('CSE','321','  Software Quality Assurance and Testing',3),
('CSE','322','  Software Requirements',3),
('CSE','372','  Stochastic Modeling',3),
('CSE','374','  Algorithms I',3),
('CSE','381','  Systems 2: OS, Currency, Virtualization, and Security',3),
('CSE','382','  Mobile App Development',3),
('CSE','383','  Web Application Programming',3),
('CSE','385','  Database Systems',3),
('CSE','386','  Foundations of Computer Graphics and Games',3),
('CSE','389','  Game Design and Implementation',3),
('CSE','411','  Introduction to Model-Driven Software Engineering',3),
('CSE','432','  Machine Learning',3),
('CSE','443','  High Performance Computing & Parallel Programming',3),
('CSE','448','  Senior Design Project',2),
('CSE','451','  Web Services and Service Oriented Architectures',3),
('CSE','456','  Bioinformatic Principles',3),
('CSE','464','  Algorithms',3),
('CSE','465','  Comparative Programming Languages',3),
('CSE','466','  Bioinformatics Computing Skills',3),
('CSE','467','  Computer and Network Security',3),
('CSE','471','  Simulation',3),
('CSE','473','  Automata, Formal Languages, and Computability',3),
('CSE','474','  Compiler Design',3),
('CSE','484','  Algorithms II',3),
('CSE','485','  Advanced Database Systems',3),
('CSE','486','  Introduction to Artificial Intelligence',3),
('CSE','488','  Image Processing & Computer Vision',3),
('CSE','489','  Advanced Graphics and Game Engine Design',3),
('DST','102','  Beginning ASL II',4),
('DST','169','  Disability and Literature',3),
('DST','272','  Introduction to Disability Studies',3),
('DST','278','  Women and (Dis)ability: Fictions and Contaminations of Identity',3),
('ECE','102','  Introduction to Electrical and Computer Engineering',3),
('ECE','205','  Electric Circuit Analysis I',4),
('ECE','287','  Digital Systems Design',4),
('ECE','289','  Computer Organization',3),
('ECE','291','  Energy Systems Engineering',3),
('ECO','131','  Economic Perspectives on Inequality in America',3),
('ECO','201','  Principles of Microeconomics',3),
('ECO','202','  Principles of Macroeconomics',3),
('ECO','301','  Money and Banking',3),
('ECO','311','  Examining Economic Data and Models',3),
('ECO','315','  Intermediate Microeconomic Theory',3),
('ECO','317','  Intermediate Macroeconomic Theory',3),
('ECO','321','  American Industries and Issues',3),
('ECO','325','  Economic Analysis of Law',3),
('ECO','331','  Public Sector Economics',3),
('ECO','332','  Health Economics',3),
('ECO','342','  Comparative Economic Systems',3),
('ECO','344','  International Economic Relations',3),
('ECO','347','  Economic Development',3),
('ECO','356','  Poverty and Income Distribution',3),
('ECO','361','  Labor Economics',3),
('ECO','373','  Economic Growth',3),
('ECO','385','  Government and Business',3),
('EDL','100','  Career Development for College Students',2),
('EDL','110','  The University and the Student',1),
('EDL','115','  Miami Tribe Contemporary Issues I',1),
('EDL','151','  The American University',2),
('EDL','195','  Team Building Development - Facilitation & Group Dynamics',2),
('EDL','203','  Introduction to Critical Youth Studies',3),
('EDL','204','  Sociocultural Studies in Education',3),
('EDL','215','  Miami Tribe Contemporary Issues 2',1),
('EDL','216','  Myaamia Ecology & History 1',1),
('EDL','218','  Leadership Identity Development',3),
('EDL','224','  Introduction to Education Policy',3),
('EDL','232','  Introduction to Community-Based Leadership',3),
('EDL','281','  Outdoor Leadership Study Away/Study Abroad',3),
('EDP','101','  Psychology Of The Learner',3),
('EDP','201','  Human Development and Learning in Social and Educational Contexts',3),
('EDP','220','  Field Experience in Special Education',1),
('EDP','256','  Psychology of the Exceptional Learner',3),
('EDP','272','  Introduction to Disability Studies',3),
('EDP','278','  Women and (Dis)ability: Fictions and Contaminations of Identity',3),
('EDP','279','  Technology  + Media Literacy and Learning',3),
('EDT','002','  College Reading II',3),
('EDT','110','  Learning Strategies for College Success',2),
('EDT','181','  Physical Science and Society',4),
('EDT','182','  Earth Science and Society',4),
('EDT','188','  Creativity and Innovation in STEM Education',3),
('EDT','190','  Introduction to Education',3),
('EDT','202','  Global Childhood Education: Diversity, Education & Society',3),
('EDT','205','  Race, Cultural Diversity, and Equity in Education',3),
('EDT','221','  Teaching English Language Learners in PK-12: Culture & Second Language Acquisition',3),
('EDT','225','  Family School and Community Connections',3),
('EDT','246','  Foundations of Language and Literacy',3),
('EDT','251','  Research Skills and Strategies - Library & Internet',2),
('EDT','265','  Mathematics: History and Technology',3),
('EDT','273','  Prekindergarten Integrated Curriculum I',3),
('EDT','274','  Prekindergarten Integrated Curriculum II',3),
('EDT','284','  Writing for Educators',3),
('EDT','288','  Ways of Thinking in STEM (Science, Technology, Engineering, and Mathematics) Education',3),
('EGS','215','  Workplace Writing',3),
('ENG','104','  Writing Studio',1),
('ENG','105','  Writing Studio',1),
('ENG','107','  Reading & Writing in Academic Contexts',4),
('ENG','109','  Composition and Rhetoric for Second-Language Writers',4),
('ENG','111','  Composition and Rhetoric',3),
('ENG','112','  Composition and Literature',3),
('ENG','119','  English for International Graduate Students',3),
('ENG','121','  Literature for ESL Learners',3),
('ENG','122','  Popular Literature',3),
('ENG','123','  Introduction to Poetry',3),
('ENG','124','  Introduction to Fiction',3),
('ENG','125','  Introduction to Drama',3),
('ENG','129','  Books You Need To Read',3),
('ENG','134','  Introduction to Shakespeare',3),
('ENG','163','  Literature and Travel',3),
('ENG','169','  Disability and Literature',3),
('ENG','171','  Humanities and Technology',3),
('ENG','236','  Experimental Film',3),
('ENG','237','  GLBTQ Literature',3),
('ENG','238','  Narrative and Digital Technology',3),
('ENG','246','  Native American Literature',3),
('ENG','248','  Asian American Literature',3),
('ENG','249','  Asian & Asian American Cinema',3),
('ENG','251','  Introduction to European Literature',3),
('ENG','254','  Latino/a Literature and the Americas',3),
('ENG','255','  Love and Death in Nineteenth-Century Russian Literature',3),
('ENG','256','  Empire and Utopia in Russian Literature',3),
('ENG','262','  Children''s Literature',3),
('ENG','263','  Literature and Medicine',3),
('ENG','264','  Literature & Environment',3),
('ENG','267','  Communism and Catastrophe in Modern Russian Literature',3),
('ENG','269','  Colonial & Postcolonial Literature',3),
('ENG','272','  English Literature to 1660',3),
('ENG','273','  English Literature 1660-1900',3),
('ENG','274','  English Literature 1901 to Present',3),
('ENG','275','  American Literature to 1900',3),
('ENG','276','  American Literature 1900 to the Present',3),
('ENG','284','  Professional Communication for Business',3),
('ENG','285','  Professional Communication for Data Analytics',3),
('ENG','293','  Contemporary American Fiction',3),
('ENG','298','  Introduction to Literary and Cultural Studies',3),
('ENG','313','  Technical Writing',3),
('ENG','315','  Business Writing',3),
('ENT','135','  Computer-Aided Drafting',3),
('ENT','137','  Introduction to Engineering Technology',1),
('ENT','151','  Engineering Materials',3),
('ENT','152','  Computer-Aided Manufacturing I',3),
('ENT','192','  Circuit Analysis I',3),
('ENT','193','  Circuit Analysis II',3),
('ENT','196','  Electronics',3),
('ENT','202','  Special Problems',0),
('ENT','235','  Computer-Aided Design',3),
('ENT','252','  Computer-Aided Manufacturing II',3),
('ENT','296','  Programmable Logic Controllers',3),
('ENT','298','  Data Communications',3),
('ESP','101','  Entrepreneurship Foundations',1),
('ESP','103','  Creativity, Innovation and Entrepreneurial Thinking',2),
('ESP','152','  International Entrepreneurial Creativity & Innovation Bootcamp',1),
('ESP','201','  Introduction to Entrepreneurship and Business Models',3),
('ESP','251','  Entrepreneurial Value Creation and Capture',3),
('ESP','252','  Entrepreneurial Mindset: Creativity and Organization',3),
('FAS','101','  Introduction to the Fashion Industry',3),
('FAS','150','  Fashion Sprint Special Topics',1),
('FAS','201','  Apparel Construction Techniques',3),
('FAS','211','  Draping for Fashion Design',3),
('FAS','212','  Flat Pattern Drafting for Fashion Design',3),
('FAS','221','  Textiles for the Fashion Industry',3),
('FAS','241','  The Elements and Principles of Fashion Design, including Color Theory',3),
('FAS','281','  Contemporary Fashion History of 20th-21st Century',3),
('FIN','101','  Personal Finance',3),
('FIN','211','  Financial Capital',3),
('FIN','301','  Introduction to Business Finance',3),
('FIN','302','  Intermediate Financial Management',3),
('FIN','303','  Financial Principles and Introduction to Modeling with Excel',3),
('FIN','320','  Applied Equity Analysis',3),
('FIN','331','  Real Estate Principles',3),
('FRE','101','  Elementary French',4),
('FRE','102','  Elementary French',4),
('FRE','131','  Masterpieces of French Culture in Translation',3),
('FRE','201','  Intermediate French',3),
('FRE','202','  Critical Analysis of French Culture',3),
('FST','127','  Environmental/Justice Films',3),
('FST','135','  Film as Ethnography',1),
('FST','201','  Film History and Analysis',3),
('FST','204','  Brazilian Culture Through Music and Film',3),
('FST','205','  American Film as Communication',3),
('FST','206','  Diversity and Culture in American Film',3),
('FST','236','  Experimental Film',3),
('FST','252','  History at the Movies',3),
('FST','261','  German Film in Global Context',3),
('FST','262','  Italian Cinema',3),
('FST','263','  Soviet and Post-Soviet Russian Cinema',3),
('FST','264','  Chinese Cinema and Culture',3),
('FST','266','  Survey of Japanese Cinema',3),
('FST','282','  Sexualities and Film',3),
('FSW','142','  Exploring Helping Professions',3),
('FSW','201','  Introduction to Social Work and Family Life Education',3),
('FSW','206','  Social Welfare Policies & Programs',4),
('FSW','207','  Serving and Supporting Children, Youth, and Families I',4),
('FSW','208','  Serving and Supporting Children, Youth, and Families II',5),
('FSW','294','  Field Placement - Preschool Setting',3),
('FSW','494','  Internship with Families and Children',3),
('GEO','101','  Global Forces, Local Diversity',3),
('GEO','111','  World Regional Geography: Patterns and Issues',3),
('GEO','121','  Earth''s Physical Environment',4),
('GEO','159','  Creating Global Peace',3),
('GEO','201','  Geography of Urban Diversity',3),
('GEO','205','  Population and Migration',3),
('GEO','208','  The Rise of Industrialism in East Asia',3),
('GEO','211','  Global Sustainable Futures',3),
('GEO','221','  Regional Physical Environments',3),
('GEO','241','  Map Interpretation',3),
('GEO','242','  Mapping a Changing World',3),
('GEO','271','  Human Dimensions of Natural Resource Conservation',3),
('GEO','276','  Geography of the Global Economy',3),
('GER','101','  Beginning German',4),
('GER','102','  Beginning German',4),
('GER','111','  Review of Basic German',3),
('GER','151','  The German-American Experience',3),
('GER','201','  Second Year German',3),
('GER','202','  Second Year German',3),
('GER','219','  Introduction to Linguistics',3),
('GER','231','  Folk and Literary Fairy Tales',3),
('GER','232','  The Holocaust in German Literature, History, and Film',3),
('GER','252','  The German-Jewish Experience',3),
('GER','261','  German Film in Global Context',3),
('GER','272','  Cinemas and Cultures of Central and Eastern Europe',3),
('GER','281','  Americans in Berlin: An Interdisciplinary Study-Abroad Workshop',6),
('GHS','101','  Introduction to Global Health',3),
('GIC','101','  Global and Intercultural Studies',3),
('GIC','228','  Cuba In Transition',6),
('GIC','286','  Data, Ethics, and Society',3),
('GLG','111','  The Dynamic Earth',3),
('GLG','121','  Environmental Geology',3),
('GLG','147','  Introductory Seminar - Geology & Environmental Earth Science',1),
('GLG','204','  Survival on an Evolving Planet',4),
('GLG','211','  Chemistry of Earth Systems',3),
('GLG','244','  Oceanography',3),
('GLG','261','  Geohazards and the Solid Earth',3),
('GRK','101','  Beginning Greek',4),
('GRK','102','  Beginning Greek',4),
('GRK','201','  Homer',3),
('GRK','202','  Plato',3),
('GTY','154','  Big Ideas in Aging',3),
('GTY','244','  Pre-Internship in Gerontology',2),
('GTY','260','  Global Aging',3),
('HST','111','  Survey of American History',3),
('HST','112','  Survey of American History',3),
('HST','147','  Introductory Seminar in History',1),
('HST','189','  History of Miami University',3),
('HST','197','  World History to 1500',3),
('HST','198','  World History Since 1500',3),
('HST','206','  Introduction to Historical Inquiry',3),
('HST','212','  United States History since 1945',3),
('HST','216','  Introduction to Public History',3),
('HST','217','  Modern Latin American History',3),
('HST','221','  African-American History',3),
('HST','236','  Medicine and Disease in Modern Society',3),
('HST','238','  Food in History',3),
('HST','241','  Introduction to Islamic History',3),
('HST','243','  History of the Atlantic Slave Trade, 1400s to 1800s',3),
('HST','245','  Making of Modern Europe, 1450-1750',3),
('HST','246','  Survey of Medieval History',3),
('HST','250','  History and Popular Culture',3),
('HST','252','  History at the Movies',3),
('HST','254','  Introduction to Russian and Eurasian Studies',3),
('HST','259','  Introduction to the Miami Tribe of Oklahoma',3),
('HST','260','  Latin America in the United States',3),
('HST','275','  20th Century European Diplomacy',3),
('HST','286','  Data, Ethics, and Society',3),
('HST','296','  World History Since 1945',3),
('IDS','151','  Diversity Seminar',1),
('IDS','154','  Introduction to Study Abroad',2),
('IDS','156','  Study Abroad Reentry Seminar',1),
('IDS','159','  Strength Through Cultural Diversity',3),
('IDS','206','  Diversity and Culture in American Film',3),
('IDS','259','  Introduction to the Miami Tribe of Oklahoma',3),
('IES','127','  Environmental/Justice Films',3),
('IES','175','  First Year Seminar on the Environment and Sustainability',1),
('IES','211','  Energy and Policy',3),
('IES','264','  Literature & Environment',3),
('IES','274','  Introduction to Environment and Sustainability',3),
('IES','275','  Principles of Environmental Science',3),
('IES','278','  Introduction to Food Systems',3),
('IMS','101','  Introduction to Emerging Technology in Business and Design',1),
('IMS','105','  Digital Literacy',1),
('IMS','109','  Digital Ethics',1),
('IMS','111','  Introduction to Game Careers',1),
('IMS','171','  Humanities and Technology',3),
('IMS','201','  Information Studies and Digital Citizenship',3),
('IMS','203','  Applied Digital Humanities',3),
('IMS','211','  Introduction to Game Studies',3),
('IMS','212','  Introduction to Game Design',3),
('IMS','213','  Introduction to Game Development',3),
('IMS','215','  3D Digital Sculpting',3),
('IMS','218','  3D Shading and Texturing',3),
('IMS','221','  Music Technologies',3),
('IMS','222','  Introduction to Interaction Design and Development',3),
('IMS','224','  Digital Writing and Rhetoric: Composing with Words, Images and Sounds',3),
('IMS','225','  Games and Learning',3),
('IMS','238','  Narrative and Digital Technology',3),
('IMS','253','  Building and Designing Interactive Devices',3),
('IMS','254','  Design Thinking & Design Principles Applied',3),
('IMS','259','  Art and Digital Tools I',3),
('IMS','261','  Information and Data Visualization',3),
('ISA','125','  Introduction to Business Statistics',3),
('ISA','203','  Supplementary Business Statistics',1),
('ISA','211','  Information Technology and Data Driven Decision Making in Business',3),
('ISA','225','  Principles of Business Analytics',3),
('ISA','235','  Information Technology and the Intelligent Enterprise',3),
('ISA','241','  Database for Analytics',1),
('ISA','242','  Programming for Analytics',1),
('ISA','243','  Database and Programming for Analytics',3),
('ISA','245','  Database Systems and Data Warehousing',3),
('ISA','250','  Basic Math for Analytics',3),
('ISA','281','  Concepts in Business Programming',3),
('ISA','291','  Applied Regression Analysis in Business',3),
('ITL','101','  Beginner''s Course',4),
('ITL','102','  Beginner''s Course',4),
('ITL','201','  Second Year Italian',3),
('ITL','202','  Second Year Italian',3),
('ITL','221','  Italy, Matrix of Civilization',3),
('ITL','222','  Italian American Culture',3),
('ITL','262','  Italian Cinema',3),
('ITS','201','  Introduction to International Studies',3),
('ITS','202','  Problem Solving in International Studies',3),
('ITS','208','  The Rise of Industrialism in East Asia',3),
('JPN','101','  First Year Japanese',4),
('JPN','102','  First Year Japanese',4),
('JPN','201','  Second Year Japanese',3),
('JPN','202','  Second Year Japanese',3),
('JPN','231','  Japanese Tales of the Supernatural in English Translation',3),
('JPN','255','  Drama in China and Japan in English Translation',3),
('JPN','266','  Survey of Japanese Cinema',3),
('JRN','101','  Introduction to Journalism',3),
('JRN','102','  Precision Language for News Writing',3),
('JRN','201','  Reporting and News Writing I',3),
('JRN','202','  Reporting and News Writing II',3),
('KNH','101','  Personal Nutrition: a survey course',2),
('KNH','102','  Fundamentals of Nutrition',3),
('KNH','103','  Introduction to the Profession of Dietetics',2),
('KNH','104','  Introduction to Food Science and Meal Management',3),
('KNH','116','  Personal Wellness',2),
('KNH','125','  Introduction to Public Health',3),
('KNH','182','  Introduction to Athletic Training',2),
('KNH','183','  Foundations of Athletic Training',3),
('KNH','184','  Motor Skill Learning and Performance',3),
('KNH','188','  Physical Activity and Health',3),
('KNH','194','  Standard First Aid and CPR',2),
('KNH','203','  Nutrition in Disease Prevention Management',3),
('KNH','205','  Understanding Drugs for the Health Promotion Professional',3),
('KNH','206','  AIDS: Etiology, Prevalence, and Prevention',3),
('KNH','207','  Serving and Supporting Children, Youth, and Families I',4),
('KNH','208','  Serving and Supporting Children, Youth, and Families II',5),
('KNH','209','  Medical Terminology for Health Professionals',3),
('KNH','213','  Global and Community Nutrition',3),
('KNH','214','  Global Well-Being',3),
('KNH','218','  Applied Health Behavior Change',3),
('KNH','221','  Social Marketing in Public Health',3),
('KNH','242','  Personal Health',3),
('KNH','243','  Women''s Health Care: Problems and Practices',3),
('KNH','244','  Functional Anatomy',3),
('KNH','245','  Issues of Health & Wellness for the Young Child',3),
('KNH','262','  Public Health Education',3),
('KNH','288','  Therapeutic Modalities',3),
('KNH','289','  Therapeutic Exercise',3),
('KNH','293','  Fitness and Conditioning',3),
('KNH','295','  Research and Evaluation Methods',3),
('KOR','101','  Beginning Korean I',4),
('KOR','102','  Beginning Korean 2',4),
('KOR','201','  Intermediate Korean 1',3),
('KOR','202','  Intermediate Korean 2',3),
('LAS','204','  Brazilian Culture Through Popular Music',3),
('LAS','208','  Introduction to Latin America',3),
('LAS','211','  Writing with Purpose: Interdisciplinary Inquiry and Communication',3),
('LAS','217','  Modern Latin American History',3),
('LAS','243','  History of the Atlantic Slave Trade, 1400s to 1800s',3),
('LAS','254','  Latino/a Literature and the Americas',3),
('LAS','260','  Latin America in the United States',3),
('LAT','101','  Beginning Latin',4),
('LAT','102','  Beginning Latin',4),
('LAT','111','  Review Latin',4),
('LAT','201','  Intermediate Latin',3),
('LAT','202','  Representative Latin Authors',3),
('LUX','101','  Intercultural Perspectives in Action',3),
('LUX','201','  Self-determination and regionalism in Europe',3),
('MAC','211','  Intermediate Video Production',4),
('MAC','212','  Media, Representation, and Society',3),
('MAC','213','  Writing for Film and TV',3),
('MAC','258','  Copywriting for Digital Media',3),
('MBI','111','  Microorganisms and Human Disease',3),
('MBI','115','  Biological Concepts: Ecology, Evolution, Genetics, and Diversity',4),
('MBI','116','  Biological Concepts: Structure, Function, Cellular and Molecular Biology',4),
('MBI','121','  The Microbial World',3),
('MBI','123','  Experimenting with Microbes',1),
('MBI','131','  Community Health Perspectives',3),
('MBI','143','  Parasitology and Mycology Labs',1),
('MBI','147','  Microbiology Introductory Seminar',1),
('MBI','161','  Elementary Medical Microbiology',4),
('MBI','201','  General Microbiology',4),
('MBI','223','  Bacteriophage Biology',1),
('MBI','224','  Bacteriophage Genomics',1),
('MBI','256','  Introduction to Programming for the Life Sciences',3),
('MGT','102','  CBL Buck Leadership Lab I: Individual Leadership Development',1),
('MGT','103','  CBL Buck Leadership Lab II: Team Leadership Development',1),
('MGT','111','  Introduction to Business',3),
('MGT','211','  Introduction to Management for Non-business Majors',3),
('MGT','291','  Introduction to Management & Leadership',3),
('MJF','105','  Introduction to Media and Culture',3),
('MJF','146','  Foundations of Production',3),
('MJF','205','  Introduction to Comm & Tech',3),
('MKT','211','  Business Concepts in Customer Engagement',3),
('MKT','291','  Principles of Marketing',3),
('MKT','292','  Careers In Marketing',1),
('MKT','315','  Professional Selling',3),
('MKT','325','  Developing Customer Insights',3),
('MKT','335','  Analytical Research and Reasoning for Marketers',3),
('MKT','345','  Building and Managing Strong Brands',3),
('MKT','395','  Strategic Thinking and Decision-Making in Marketing',3),
('MKT','404','  Culturally Intelligent [CQ] Marketing',3),
('MKT','412','  Sustainable Marketing Management',3),
('MKT','415','  Marketing to Organizations',3),
('MKT','419','  Digital Branding',3),
('MKT','425','  Global Marketing',3),
('MKT','461','  Principles of Retailing',3),
('MKT','495','  Strategy Works',4),
('MME','102','  Introduction to Mechanical and Manufacturing Engineering',3),
('MME','201','  Modeling and Design in Engineering',2),
('MME','202','  Numerical Methods in Engineering',3),
('MME','211','  Static Modeling of Mechanical Systems',3),
('MME','213','  Computational Methods in Engineering',3),
('MME','223','  Engineering Materials',3),
('MME','231','  Manufacturing Processes',3),
('MSC','121','  Foundations of Officership',3),
('MSC','122','  Introduction to Tactical Leadership',1),
('MSC','221','  Individual Leadership',3),
('MSC','222','  Individual Leadership Part II',3),
('MTH','115','  Mathematics for Teachers of Grades P-6',4),
('MTH','116','  Mathematics for Elementary Teachers',4),
('MTH','119','  Quantitative Reasoning',4),
('MTH','104','  Precalculus',5),
('MTH','151','  Calculus I',5),
('MTH','217','  Mathematics for Middle Childhood Teachers: Structure of Arithmetic and Algebra',4),
('MTH','218','  Geometry for Middle Childhood Teachers',4),
('MTH','222','  Introduction to Linear Algebra',3),
('MTH','231','  Elements of Discrete Mathematics',3),
('MTH','245','  Differential Equations for Engineers',3),
('MTH','246','  Linear Algebra and Differential Equations for Engineers',4),
('MTH','251','  Calculus II',4),
('MTH','252','  Calculus III',4),
('MTH','331','  Proof: Introduction to Higher Mathematics',3),
('MTH','347','  Differential Equations',3),
('MTH','407','  Mathematical Structures Through Inquiry',3),
('MTH','408','  Mathematical Problem Solving with Technology',3),
('MTH','409','  Secondary Mathematics from an Advanced Perspective',3),
('MTH','411','  Foundations of Geometry',3),
('MTH','421','  Introduction to Abstract Algebra',4),
('MTH','425','  Number Theory',3),
('MTH','432','  Optimization',3),
('MTH','435','  Mathematical Modeling Seminar',3),
('MTH','437','  Game Theory and Related Topics',3),
('MTH','438','  Theory and Applications of Graphs',3),
('MTH','439','  Combinatorics',3),
('MTH','441','  Real Analysis',3),
('MTH','447','  Topics in Mathematical Finance',3),
('MTH','451','  Introduction to Complex Variables',4),
('MTH','453','  Numerical Analysis',3),
('MTH','455','  Introduction to Partial Differential Equations',3),
('MTH','482','  Great Theorems of Mathematics',3),
('MTH','483','  Introduction to Mathematical Logic',3),
('MTH','486','  Introduction to Set Theory',3),
('MTH','491','  Introduction to Topology',3),
('MTH','495','  Introduction to Applied Nonlinear Dynamics',3),
('MUS','101','  Theory of Music I',3),
('MUS','102','  Theory of Music II',3),
('MUS','110','  Vocal Accompanying',1),
('MUS','111','  Lab Band',0),
('MUS','112','  Lab Choir',0),
('MUS','115','  Beginning Piano for Non-Majors',2),
('MUS','119','  Introduction to Music Theory',2),
('MUS','120','  Instrumental Accompanying',1),
('MUS','135','  Understanding Jazz, Its History and Context',3),
('MUS','139','  Chamber Music Experience',0),
('MUS','140','  Recital Requirement',0),
('MUS','142','  Applied Music',2),
('MUS','151','  Theory of Music: Aural Skills I',1),
('MUS','152','  Theory of Music: Aural Skills II',1),
('MUS','160','  Functional Piano I',1),
('MUS','161','  Functional Piano II',1),
('MUS','175','  Introduction to Music Education',3),
('MUS','182','  Discovering Italian Opera',3),
('MUS','184','  Opera: Passport to the Liberal Arts',3),
('MUS','185','  The Diverse Worlds of Music',3),
('MUS','186','  Global Popular Music',3),
('MUS','189','  Great Ideas in Western Music',3),
('MUS','201','  Theory of Music III',3),
('MUS','202','  Theory of Music IV',3),
('MUS','204','  Brazilian Culture Through Music and Film',3),
('MUS','206','  Tracking Sounds: A History of Film Music',3),
('MUS','211','  History of Western Music',3),
('MUS','212','  History of Western Music',3),
('MUS','275','  Sophomore Practicum in Music Education',1),
('MUS','285','  Introduction to African American Music',3),
('MUS','287','  Enter the Diva: Women in Music',3),
('NCS','201','  Theories of Civic Leadership and Democracy',3),
('NCS','202','  Introduction to Nonprofits and NGOs',3),
('NSC','101','  Introduction to Naval Science',2),
('NSC','202','  Sea Power and Maritime Affairs Seminar',3),
('NSC','211','  Leadership and Management',3),
('NSG','251','  Therapeutic Communication in Nursing',3),
('NSG','262','  Fundamentals of Professional Nursing Practice',3),
('NSG','263','  Community Health Nursing',3),
('NSG','265','  Fundamentals of Professional Nursing Practice--Clinical',1),
('PHL','103','  Society and the Individual',3),
('PHL','104','  Purpose or Chance in the Universe',3),
('PHL','105','  Theories of Human Nature',3),
('PHL','131','  Introduction to Ethics',3),
('PHL','205','  Science and Culture',3),
('PHL','241','  Philosophy of Art',3),
('PHL','245','  Writing Philosophy',3),
('PHL','263','  Informal Logic',3),
('PHL','265','  Confronting Death',3),
('PHL','273','  Formal Logic',4),
('PHL','286','  Data, Ethics, and Society',3),
('PHY','101','  Physics and Society',3),
('PHY','103','  Concepts in Physics Laboratory',1),
('PHY','111','  Astronomy and Space Physics',3),
('PHY','118','  Introduction to Atmospheric Science',3),
('PHY','121','  Energy and Environment',3),
('PHY','131','  Physics for Music',3),
('PHY','141','  Physics in Sports',3),
('PHY','161','  Physics for the Life Sciences with Laboratory I',4),
('PHY','162','  Physics for the Life Sciences with Laboratory II',4),
('PHY','185','  Experiencing The Physical World',1),
('PHY','191','  General Physics with Laboratory I',5),
('PHY','192','  General Physics with Laboratory II',5),
('PHY','211','  Observational Foundations of Astronomy',3),
('PHY','215','  Physics by Inquiry',3),
('PHY','286','  Introduction to Computational Physics',3),
('PHY','292','  Electronic Instrumentation',2),
('PHY','293','  Contemporary Physics Laboratory',2),
('PHY','294','  Laboratory in Electronic Instrumentation',2),
('PLW','101','  Exploring Careers in Law I',1),
('PLW','201','  Exploring Careers in Law II',1),
('PMD','101','  Explorations in Healthcare Careers',1),
('POL','142','  American Politics and Diversity',3),
('POL','201','  Political Thinking',3),
('POL','221','  Comparative Politics',3),
('POL','241','  American Political System',3),
('POL','254','  Introduction to Russian and Eurasian Studies',3),
('POL','261','  Public Administration',3),
('POL','268','  State and Local Government and Politics',3),
('POL','271','  World Politics',3),
('POR','111','  Accelerated Introduction to Portuguese',4),
('POR','204','  Brazilian Culture Through Music and Film',3),
('POR','211','  Intermediate Portuguese',4),
('PSS','211','  College and Career Development in Psychological Science',3),
('PSY','111','  Introduction to Psychology',3),
('PSY','112','  Foundational Experiences in Psychology',1),
('PSY','159','  Seminar in Neuroscience',1),
('PSY','210','  Psychology Across Cultures',3),
('PSY','211','  Psychological Perspectives on Leadership and Pedagogy in the College Classroom',2),
('PSY','212','  Practicum in Leadership and Pedagogy',3),
('PSY','221','  Social Psychology',3),
('PSY','231','  Developmental Psychology',3),
('PSY','241','  Personality',3),
('PSY','242','  Abnormal Psychology',3),
('PSY','251','  Introduction to Biopsychology',3),
('PSY','271','  Survey of Perception, Action, and Cognition',3),
('PSY','293','  Introduction to Psychological Statistics',4),
('PSY','294','  Writing and Research Methods in Psychology',4),
('REL','101','  Introduction to the Study of Religion',3),
('REL','128','  Religion, Science, and Origins',3),
('REL','133','  Imagining Russia',3),
('REL','201','  Methods for the Study of Religion',3),
('REL','203','  Global Religions of India',3),
('REL','223','  Introduction to Buddhism',3),
('REL','226','  Introduction to Islam',3),
('REL','241','  Religions of the American Peoples',3),
('REL','254','  Introduction to Russian and Eurasian Studies',3),
('REL','275','  Introduction to the Critical Study of Biblical Literature',3),
('REL','286','  Global Jewish Civilization',3),
('RUS','101','  Beginner''s Course',4),
('RUS','102','  Beginner''s Course',4),
('RUS','137','  Russian Folklore',3),
('RUS','201','  Intermediate Russian',3),
('RUS','202','  Intermediate Russian',3),
('RUS','250','  Topics in Russian Literature in English Translation',3),
('RUS','254','  Introduction to Russian and Eurasian Studies',3),
('RUS','255','  Love and Death in Nineteenth-Century Russian Literature',3),
('RUS','256','  Empire and Utopia in Russian Literature',3),
('RUS','257','  Communism and Catastrophe in Modern Russian Literature',3),
('RUS','263','  Soviet & Post-Soviet Russian Cinema',3),
('SJS','101','  Elements of Social Justice',1),
('SJS','159','  Creating Global Peace',3),
('SJS','165','  Introduction to Social Justice Studies',3),
('SJS','215','  EMPOWER I: Educational and Economic Justice and Service-Learning',3),
('SJS','216','  EMPOWER II: The Intersections of Race, Class, and Education',3),
('SJS','265','  Critical Inquiry: Penny Lecture Series',2),
('SLM','110','  Dance',2),
('SLM','112','  Transition for College Students',1),
('SLM','150','  Outdoor Pursuit Activities',2),
('SLM','195','  Stress Management and Performance Psychology in Sport',2),
('SLM','212','  Introduction to Sport Management',3),
('SLM','225','  Ethics in Sport',3),
('SLM','272','  Contemporary Perspectives on Leadership in Sport Contexts',3),
('SLM','273','  Sport Communication & Media',3),
('SLM','274','  Critical Perspectives on the Body',3),
('SLM','275','  Introduction to Sport Analytics',3),
('SLM','276','  Current Issues in Leisure and Sport',3),
('SLM','279','  African Americans in Sport',3),
('SLM','294','  Games and Sport',3),
('SOC','127','  Environmental/Justice Films',3),
('SOC','151','  Social Relations',4),
('SOC','153','  Sociology in a Global Context',3),
('SOC','165','  Introduction to Social Justice Studies',3),
('SOC','201','  Social Problems',3),
('SOC','202','  Social Deviance',3),
('SOC','203','  Sociology of Gender',3),
('SOC','208','  The Rise of Industrialism in East Asia',3),
('SOC','221','  Sexualities',3),
('SOC','225','  Work and Occupational Justice',3),
('SOC','257','  Population',3),
('SOC','258','  Self and Society',3),
('SOC','262','  Research Methods',3),
('SOC','265','  Penny Lecture Series',2),
('SOC','272','  Introduction to Disability Studies',3),
('SOC','279','  African Americans in Sport',3),
('SPA','101','  Beginning ASL I',4),
('SPA','102','  Beginning ASL II',4),
('SPA','127','  Introduction to Communication Disorders',3),
('SPA','201','  Intermediate ASL I',3),
('SPA','202','  Intermediate American Sign Language II',3),
('SPA','222','  Anatomy and Physiology Speech Production',3),
('SPA','223','  Theories of Language Development',3),
('SPA','225','  Foundations of Neurology',3),
('SPA','293','  Sophomore Seminar in Speech Pathology and Audiology',1),
('SPN','101','  Beginner''s Course',4),
('SPN','102','  Beginner''s Course',4),
('SPN','111','  Intensive Basic Spanish',4),
('SPN','201','  Second Year Spanish',3),
('SPN','202','  Second Year Spanish',3),
('SPN','203','  Spanish for Health Care Professions',3),
('SPN','211','  Intensive Intermediate Spanish',3),
('SPN','241','  Intermediate Conversational Spanish',2),
('SPN','242','  Intermediate Conversational Spanish',2),
('STA','125','  Introduction to Business Statistics',3),
('STA','147','  First Year Seminar in Mathematics and Statistics',1),
('STA','250','  Basic Math for Analytics',3),
('STA','261','  Statistics',4),
('STA','271','  Introduction to Actuarial Science',1),
('STA','301','  Applied Statistics',3),
('STA','308','  Introduction to Programming and Scripting for Data Analytics',3),
('STA','309','  Building, Managing and Exploring Data Sets in Analytics',3),
('STA','333','  Nonparametric Statistics',3),
('STA','363','  Introduction to Statistical Modeling',3),
('STA','365','  Statistical Monitoring and Design of Experiments',3),
('STA','401','  Probability',3),
('STA','402','  Statistical Programming',3),
('STA','404','  Advanced Data Visualization',3),
('STA','427','  Introduction to Bayesian Statistics',3),
('STA','432','  Survey Sampling in Business',3),
('STA','462','  Inferential Statistics',3),
('STA','463','  Regression Analysis',4),
('STA','466','  Experimental Design Methods',4),
('STA','467','  Statistical Learning',3),
('STA','471','  Actuarial Exam Preparation Seminar: Probability',1),
('STA','475','  Data Analysis Practicum',3),
('STA','483','  Analysis of Forecasting Systems',3),
('STC','135','  Principles of Public Speaking',3),
('STC','136','  Introduction to Interpersonal Communication',3),
('STC','205','  American Film as Communication',3),
('STC','231','  Small Group Communication',3),
('STC','259','  Foundations of Campaign Design',3),
('STC','262','  Research Methods',3),
('STC','285','  Professional Communication for Data Analytics',3),
('THE','101','  Introduction to Theatre: Drama and Analysis',3),
('THE','107','  The Theatre Major: an Introduction to Theatre Resources and Skills',1),
('THE','123','  Acting for the Non-Major: Text and Performance',3),
('THE','131','  Principles of Acting',3),
('THE','142','  Theatre Organization and Communication',1),
('THE','151','  Stage Makeup',1),
('THE','191','  Experiencing Theatre',3),
('THE','226','  Acting Studio:Foundations',4),
('THE','227','  Acting Studio: Integrating Text',4),
('THE','239','  Alexander Technique',1),
('THE','251','  Visual Communication for the Theatre',3),
('THE','253','  Costume Fundamentals',3),
('THE','257','  Stagecraft and Theatre Technologies',3),
('THE','258','  Scene Painting Fundamentals',3),
('THE','261','  Intermediate Ballet',2),
('THE','262','  Intermediate Modern Dance',2),
('THE','263','  Intermediate Jazz Dance',2),
('THE','291','  World Stages',3),
('THE','292','  World Stages',3),
('UNV','101','  I Am Miami',1),
('WGS','201','  Introduction to Women''s Studies',3),
('WGS','202','  Introduction to GLBT Studies',3),
('WGS','203','  Sociology of Gender',3),
('WGS','204','  Gender, Science, & Technology',3),
('WGS','211','  Writing with Purpose: Interdisciplinary Inquiry and Communication',3),
('WGS','221','  Sexualities',3),
('WGS','232','  Women Writers',3),
('WGS','235','  Women in Antiquity',3),
('WGS','237','  GLBTQ Literature',3),
('WGS','243','  Women''s Health Care: Problems and Practices',3),
('WGS','278','  Women and (Dis)ability: Fictions and Contaminations of Identity',3),
('WGS','287','  Enter the Diva: Women in Music',3),
('WST','110','  Introduction to Contemporary Topics',1),
('WST','123','  Biology and Society',3),
('WST','201','  Self and Place',3),
('WST','231','  Interdisciplinary Inquiry',3),
('WST','251','  Individualized Studies Seminar',1)
GO


INSERT Student (StudentMiamiID, FirstName, LastName, Major, Minor, EarnedHours, GPAHours, QualityPoints, AdvisorMiamiID) VALUES 
(11650389,'Charles ','Zhou','Mathematics and Statistics','Computer Science',0,0,0,10086),
(11453297,'Wayne','Huang','Mathematics and Statistics','Computer Science',0,0,0,10086),
(11527429,'Chris','Jiao','Computer Science','Mathematics',0,0,0,10149),
(11874226,'Eason','Wang','Mathematics and Statistics','Computer Science',0,0,0,11946)
GO

INSERT Student (StudentMiamiID, FirstName, LastName, Major, EarnedHours, GPAHours, QualityPoints, AdvisorMiamiID) VALUES 
(11659184,'Kevin','Chen','Computer Science',0,0,0,10010),
(11745625,'Tony','Li','Computer Science',0,0,0,10010),
(11826954,'Ted','Tian','Business Economics',0,0,0,11729),
(11953254,'Travis','Cao','Marketing',0,0,0,11729),
(11236578,'Jack','Zhang','Business Economics',0,0,0,11729),
(11532478,'Kris','Wu','Computer Science',0,0,0,10149),
(11478231,'Louls','Koo','Statistics',0,0,0,16357),
(11589341,'Laura','Li','Data Science and Statistics',0,0,0,16357)
GO


INSERT Advisor (AdvisorMiamiID, FirstName, LastName, [Password]) VALUES 
(10086,'Tao','Jiang',COMPRESS('JiangTao')),
(10010,'Norm','Krumpe',COMPRESS('NormKrumpe')),
(11729,'Isabelle','Eaton',COMPRESS('IsabelleEaton')),
(10149,'Norm','Krumpe',COMPRESS('NormKrumpe')),
(16357,'Thomas','Fisher',COMPRESS('ThomasFisher')),
(11946,'Louis','DeBiasio',COMPRESS('LouisDeBiasio'))
GO



CREATE TRIGGER Student_TRIGGER ON StudentCourse
	AFTER INSERT
AS BEGIN
	
	DECLARE @StudentID INT = (SELECT StudentMiamiID FROM inserted)

	DECLARE @NOWEarnedHours INT = (SELECT EarnedHours 
							FROM Student S
								JOIN inserted I ON I.StudentMiamiID = S.StudentMiamiID)

	DECLARE @NOWGPAHours INT = (SELECT GPAHours 
							FROM Student S
								JOIN inserted I ON I.StudentMiamiID = S.StudentMiamiID)
	DECLARE @INSERTHours INT = (SELECT CreditHours
							FROM Course C
								JOIN inserted I ON I.CourseID = C.CourseID)

	DECLARE @GradeLetter VARCHAR(5) = (SELECT GradeLetter
							FROM Course C
								JOIN inserted I ON I.CourseID = C.CourseID)

	DECLARE @QualityPoints float(24) = (SELECT QualityPoints
							FROM Student S
								JOIN inserted I ON I.StudentMiamiID = S.StudentMiamiID)

	UPDATE Student	SET EarnedHours = @NOWEarnedHours+@INSERTHours
					WHERE StudentMiamiID = @StudentID

	UPDATE Student	SET GPAHours = CASE 
									WHEN @GradeLetter = 'A+' THEN @NOWGPAHours+@INSERTHours
									WHEN @GradeLetter = 'A' THEN  @NOWGPAHours+@INSERTHours
									WHEN @GradeLetter = 'A-' THEN @NOWGPAHours+@INSERTHours
									WHEN @GradeLetter = 'B+' THEN @NOWGPAHours+@INSERTHours
									WHEN @GradeLetter = 'B' THEN  @NOWGPAHours+@INSERTHours
									WHEN @GradeLetter = 'B-' THEN @NOWGPAHours+@INSERTHours
									WHEN @GradeLetter = 'C+' THEN @NOWGPAHours+@INSERTHours
									WHEN @GradeLetter = 'C' THEN  @NOWGPAHours+@INSERTHours
									WHEN @GradeLetter = 'C-' THEN @NOWGPAHours+@INSERTHours
									WHEN @GradeLetter = 'D+' THEN @NOWGPAHours+@INSERTHours
									WHEN @GradeLetter = 'D' THEN  @NOWGPAHours+@INSERTHours
									WHEN @GradeLetter = 'D-' THEN @NOWGPAHours+@INSERTHours
									WHEN @GradeLetter = 'F' THEN  @NOWGPAHours+@INSERTHours
									ELSE @NOWGPAHours
									END
					WHERE StudentMiamiID = @StudentID

	UPDATE Student	SET QualityPoints = CASE 
									WHEN @GradeLetter = 'A+' THEN @QualityPoints+@INSERTHours*4.0
									WHEN @GradeLetter = 'A' THEN @QualityPoints+@INSERTHours*4.0
									WHEN @GradeLetter = 'A-' THEN @QualityPoints+@INSERTHours*3.7
									WHEN @GradeLetter = 'B+' THEN @QualityPoints+@INSERTHours*3.3
									WHEN @GradeLetter = 'B' THEN @QualityPoints+@INSERTHours*3.0
									WHEN @GradeLetter = 'B-' THEN @QualityPoints+@INSERTHours*2.7
									WHEN @GradeLetter = 'C+' THEN @QualityPoints+@INSERTHours*2.3
									WHEN @GradeLetter = 'C' THEN @QualityPoints+@INSERTHours*2.0
									WHEN @GradeLetter = 'C-' THEN @QualityPoints+@INSERTHours*1.7
									WHEN @GradeLetter = 'D+' THEN @QualityPoints+@INSERTHours*1.3
									WHEN @GradeLetter = 'D' THEN @QualityPoints+@INSERTHours*1.0
									WHEN @GradeLetter = 'D-' THEN @QualityPoints+@INSERTHours*0.7
									WHEN @GradeLetter = 'F' THEN @QualityPoints
									ELSE @QualityPoints
									END
					WHERE StudentMiamiID = @StudentID

	DECLARE @Points float(24) = (SELECT QualityPoints
							FROM Student S
								JOIN inserted I ON I.StudentMiamiID = S.StudentMiamiID)

	DECLARE @GPAHours INT = (SELECT GPAHours 
							FROM Student S
								JOIN inserted I ON I.StudentMiamiID = S.StudentMiamiID)



END
GO

INSERT StudentCourse VALUES (13, 11874226, 'B+')	
INSERT StudentCourse VALUES (14, 11874226, 'A-')	
INSERT StudentCourse VALUES (26, 11874226, 'A')		
INSERT StudentCourse VALUES (732, 11874226, 'B')	
INSERT StudentCourse VALUES (188, 11874226, 'B+')	
INSERT StudentCourse VALUES (278, 11874226, 'A-')	
INSERT StudentCourse VALUES (390, 11874226, 'A')	
INSERT StudentCourse VALUES (74, 11874226, 'A')		
INSERT StudentCourse VALUES (273, 11874226, 'A')	
INSERT StudentCourse VALUES (288, 11874226, 'A')	
INSERT StudentCourse VALUES (391, 11874226, 'A-')	
INSERT StudentCourse VALUES (939, 11874226, 'A')
INSERT StudentCourse VALUES (290, 11874226, 'A')
INSERT StudentCourse VALUES (350, 11874226, 'A')
INSERT StudentCourse VALUES (737, 11874226, 'B')
INSERT StudentCourse VALUES (738, 11874226, 'B+')
INSERT StudentCourse VALUES (943, 11874226, 'X')
INSERT StudentCourse VALUES (945, 11874226, 'A')
INSERT StudentCourse VALUES (334, 11874226, 'A')
INSERT StudentCourse VALUES (369, 11874226, 'A')
INSERT StudentCourse VALUES (739, 11874226, 'X')
INSERT StudentCourse VALUES (744, 11874226, 'X')
INSERT StudentCourse VALUES (951, 11874226, 'B')

INSERT StudentCourse VALUES (65,11589341,'TR')
INSERT StudentCourse VALUES (812,11589341,'TR')
INSERT StudentCourse VALUES (13,11589341,'A+')
INSERT StudentCourse VALUES (14,11589341,'A-')
INSERT StudentCourse VALUES (99,11589341,'A-')
INSERT StudentCourse VALUES (729,11589341,'A+')
INSERT StudentCourse VALUES (278,11589341,'C+')
INSERT StudentCourse VALUES (390,11589341,'B+')
INSERT StudentCourse VALUES (736,11589341,'C')
INSERT StudentCourse VALUES (939,11589341,'B+')
INSERT StudentCourse VALUES (400,11589341,'X')
INSERT StudentCourse VALUES (732,11589341,'B+')
INSERT StudentCourse VALUES (737,11589341,'X')
INSERT StudentCourse VALUES (943,11589341,'X')
INSERT StudentCourse VALUES (945,11589341,'B+')
INSERT StudentCourse VALUES (188,11589341,'X')
INSERT StudentCourse VALUES (252,11589341,'A')
INSERT StudentCourse VALUES (276,11589341,'A+')
INSERT StudentCourse VALUES (538,11589341,'A+')
INSERT StudentCourse VALUES (539,11589341,'A-')

INSERT StudentCourse VALUES (966,11650389,'A')
INSERT StudentCourse VALUES (951,11650389,'A-')
INSERT StudentCourse VALUES (812,11650389,'A')
INSERT StudentCourse VALUES (782,11650389,'A-')
INSERT StudentCourse VALUES (739,11650389,'B')
INSERT StudentCourse VALUES (738,11650389,'B+')
INSERT StudentCourse VALUES (736,11650389,'A-')
INSERT StudentCourse VALUES (732,11650389,'A-')
INSERT StudentCourse VALUES (729,11650389,'A+')
INSERT StudentCourse VALUES (562,11650389,'A+')
INSERT StudentCourse VALUES (391,11650389,'A')
INSERT StudentCourse VALUES (369,11650389,'A-')
INSERT StudentCourse VALUES (350,11650389,'B+')
INSERT StudentCourse VALUES (333,11650389,'B')
INSERT StudentCourse VALUES (278,11650389,'B-')
INSERT StudentCourse VALUES (273,11650389,'C-')
INSERT StudentCourse VALUES (74,11650389,'C+')
INSERT StudentCourse VALUES (26,11650389,'B')

INSERT StudentCourse VALUES (3,11659184,'A')
INSERT StudentCourse VALUES (13,11659184,'A-')
INSERT StudentCourse VALUES (14,11659184,'B+')
INSERT StudentCourse VALUES (26,11659184,'A-')
INSERT StudentCourse VALUES (193,11659184,'B+')
INSERT StudentCourse VALUES (191,11659184,'A')
INSERT StudentCourse VALUES (273,11659184,'B+')
INSERT StudentCourse VALUES (278,11659184,'A')
INSERT StudentCourse VALUES (287,11659184,'B')
INSERT StudentCourse VALUES (288,11659184,'A')
INSERT StudentCourse VALUES (290,11659184,'X')
INSERT StudentCourse VALUES (291,11659184,'C')
INSERT StudentCourse VALUES (356,11659184,'A-')
INSERT StudentCourse VALUES (389,11659184,'B')
INSERT StudentCourse VALUES (391,11659184,'A-')
INSERT StudentCourse VALUES (429,11659184,'A-')
INSERT StudentCourse VALUES (579,11659184,'A')
INSERT StudentCourse VALUES (728,11659184,'A')
INSERT StudentCourse VALUES (729,11659184,'B-')
INSERT StudentCourse VALUES (812,11659184,'A-')
INSERT StudentCourse VALUES (937,11659184,'X')
INSERT StudentCourse VALUES (957,11659184,'A-')
INSERT StudentCourse VALUES (964,11659184,'B')
INSERT StudentCourse VALUES (279,11659184,'A-')
INSERT StudentCourse VALUES (302,11659184,'C')
INSERT StudentCourse VALUES (678,11659184,'A')
INSERT StudentCourse VALUES (736,11659184,'B+')
INSERT StudentCourse VALUES (822,11659184,'A')

INSERT StudentCourse VALUES (10,11826954,'A+')
INSERT StudentCourse VALUES (65,11826954,'A')
INSERT StudentCourse VALUES (135,11826954,'A-')
INSERT StudentCourse VALUES (136,11826954,'B+')
INSERT StudentCourse VALUES (137,11826954,'A')
INSERT StudentCourse VALUES (141,11826954,'C')
INSERT StudentCourse VALUES (274,11826954,'A+')
INSERT StudentCourse VALUES (278,11826954,'A')
INSERT StudentCourse VALUES (338,11826954,'A')
INSERT StudentCourse VALUES (353,11826954,'A+')
INSERT StudentCourse VALUES (372,11826954,'A-')
INSERT StudentCourse VALUES (390,11826954,'B')
INSERT StudentCourse VALUES (391,11826954,'B')
INSERT StudentCourse VALUES (444,11826954,'B+')
INSERT StudentCourse VALUES (494,11826954,'B-')
INSERT StudentCourse VALUES (612,11826954,'A-')
INSERT StudentCourse VALUES (695,11826954,'B')
INSERT StudentCourse VALUES (700,11826954,'B+')
INSERT StudentCourse VALUES (736,11826954,'B')
INSERT StudentCourse VALUES (934,11826954,'A')
INSERT StudentCourse VALUES (285,11826954,'A')
INSERT StudentCourse VALUES (337,11826954,'A-')
INSERT StudentCourse VALUES (342,11826954,'C')
INSERT StudentCourse VALUES (459,11826954,'B+')
INSERT StudentCourse VALUES (678,11826954,'A')

INSERT StudentCourse VALUES (1,11953254,'A')
INSERT StudentCourse VALUES (3,11953254,'A')
INSERT StudentCourse VALUES (10,11953254,'A-')
INSERT StudentCourse VALUES (48,11953254,'A-')
INSERT StudentCourse VALUES (135,11953254,'C-')
INSERT StudentCourse VALUES (136,11953254,'A')
INSERT StudentCourse VALUES (137,11953254,'B+')
INSERT StudentCourse VALUES (141,11953254,'B')
INSERT StudentCourse VALUES (274,11953254,'A')
INSERT StudentCourse VALUES (278,11953254,'A-')
INSERT StudentCourse VALUES (333,11953254,'B+')
INSERT StudentCourse VALUES (334,11953254,'A-')
INSERT StudentCourse VALUES (444,11953254,'B+')
INSERT StudentCourse VALUES (597,11953254,'A-')
INSERT StudentCourse VALUES (612,11953254,'A-')
INSERT StudentCourse VALUES (700,11953254,'B+')
INSERT StudentCourse VALUES (703,11953254,'A-')
INSERT StudentCourse VALUES (729,11953254,'C-')
INSERT StudentCourse VALUES (812,11953254,'A')
INSERT StudentCourse VALUES (934,11953254,'A-')
INSERT StudentCourse VALUES (285,11953254,'A')
INSERT StudentCourse VALUES (459,11953254,'C-')
INSERT StudentCourse VALUES (678,11953254,'B')
INSERT StudentCourse VALUES (704,11953254,'C')

INSERT StudentCourse VALUES (13,11453297,'A')
INSERT StudentCourse VALUES (14,11453297,'A')
INSERT StudentCourse VALUES (26,11453297,'B')
INSERT StudentCourse VALUES (273,11453297,'B+')
INSERT StudentCourse VALUES (288,11453297,'A-')
INSERT StudentCourse VALUES (333,11453297,'A')
INSERT StudentCourse VALUES (350,11453297,'B-')
INSERT StudentCourse VALUES (365,11453297,'A')
INSERT StudentCourse VALUES (391,11453297,'B-')
INSERT StudentCourse VALUES (729,11453297,'C')
INSERT StudentCourse VALUES (732,11453297,'A-')
INSERT StudentCourse VALUES (737,11453297,'A')
INSERT StudentCourse VALUES (738,11453297,'A')
INSERT StudentCourse VALUES (739,11453297,'A')
INSERT StudentCourse VALUES (744,11453297,'C')
INSERT StudentCourse VALUES (816,11453297,'A')
INSERT StudentCourse VALUES (285,11453297,'B')
INSERT StudentCourse VALUES (290,11453297,'A')
INSERT StudentCourse VALUES (489,11453297,'B')
INSERT StudentCourse VALUES (751,11453297,'A')
INSERT StudentCourse VALUES (950,11453297,'B-')

INSERT StudentCourse VALUES (278,11745625,'A')
INSERT StudentCourse VALUES (729,11745625,'B')
INSERT StudentCourse VALUES (391,11745625,'B')

INSERT StudentCourse VALUES (278,11532478,'A')
INSERT StudentCourse VALUES (729,11532478,'X')
INSERT StudentCourse VALUES (391,11532478,'A-')
INSERT StudentCourse VALUES (273,11532478,'B+')
INSERT StudentCourse VALUES (288,11532478,'A')
INSERT StudentCourse VALUES (290,11532478,'A')
INSERT StudentCourse VALUES (736,11532478,'A-')
INSERT StudentCourse VALUES (732,11532478,'B-')


INSERT StudentCourse VALUES (333,11478231,'A-')
INSERT StudentCourse VALUES (369,11478231,'B-')
INSERT StudentCourse VALUES (391,11478231,'B')
INSERT StudentCourse VALUES (729,11478231,'B')
INSERT StudentCourse VALUES (732,11478231,'A-')
INSERT StudentCourse VALUES (736,11478231,'B-')
INSERT StudentCourse VALUES (737,11478231,'B-')
INSERT StudentCourse VALUES (738,11478231,'B+')
INSERT StudentCourse VALUES (739,11478231,'B-')
INSERT StudentCourse VALUES (744,11478231,'B')

INSERT StudentCourse VALUES (10,11236578,'A-')
INSERT StudentCourse VALUES (65,11236578,'D')
INSERT StudentCourse VALUES (135,11236578,'B')
INSERT StudentCourse VALUES (136,11236578,'A+')
INSERT StudentCourse VALUES (137,11236578,'B')
INSERT StudentCourse VALUES (278,11236578,'C')
INSERT StudentCourse VALUES (338,11236578,'A-')
INSERT StudentCourse VALUES (353,11236578,'A-')
INSERT StudentCourse VALUES (372,11236578,'C')
INSERT StudentCourse VALUES (390,11236578,'A')
INSERT StudentCourse VALUES (391,11236578,'B-')
INSERT StudentCourse VALUES (444,11236578,'D')

INSERT StudentCourse VALUES (278,11527429,'A')
INSERT StudentCourse VALUES (729,11527429,'AP')
INSERT StudentCourse VALUES (391,11527429,'A-')
INSERT StudentCourse VALUES (273,11527429,'A+')
INSERT StudentCourse VALUES (288,11527429,'A')
INSERT StudentCourse VALUES (290,11527429,'A')
INSERT StudentCourse VALUES (736,11527429,'A-')
INSERT StudentCourse VALUES (732,11527429,'A-')
INSERT StudentCourse VALUES (279,11527429,'A')
INSERT StudentCourse VALUES (738,11527429,'A-')
INSERT StudentCourse VALUES (739,11527429,'A-')
INSERT StudentCourse VALUES (333,11527429,'A')
GO

/****** Object:  PROCEDURE spChangeMajor ******/
CREATE PROCEDURE spChangeMajor
	@StudentID				INT,
	@NewMajor				varchar(50)	
AS BEGIN
	UPDATE Student SET Major = @NewMajor WHERE @StudentID = Student.StudentMiamiID
END
GO

/****** Object:  PROCEDURE spChangeDropMinor ******/
CREATE PROCEDURE spChangeDropMinor
	@StudentID				INT,
	@NewMinor 				varchar(50)		= NULL,
	@isDrop 				BIT				= 1
AS BEGIN
	IF @isDrop = 1 BEGIN
		UPDATE Student SET Minor = NULL WHERE @StudentID = Student.StudentMiamiID
	END ELSE BEGIN
		UPDATE Student SET Major = @NewMinor WHERE @StudentID = Student.StudentMiamiID
	END

END
GO


/****** Object:  Function  fnStudentClassification ******/
CREATE FUNCTION dbo.fnStudentClassification(@StudentID INT) RETURNS VARCHAR(50)
AS BEGIN
	DECLARE @HOURS INT = (SELECT EarnedHours FROM Student WHERE StudentMiamiID = @StudentID)
	DECLARE @YEAR VARCHAR(50) = CASE
									WHEN @HOURS < 30					THEN 'Freshman'
									WHEN @HOURS >= 30 AND @HOURS  < 64	THEN 'Sophomores'
									WHEN @HOURS >= 64 AND @HOURS  < 96	THEN 'Juniors'
									WHEN @HOURS >= 96					THEN 'Jeniors'
								END

	RETURN @YEAR
END
GO



/****** Object:  Function  fnAllStudentCourse ******/
CREATE FUNCTION dbo.fnAllStudentCourse(@StudentID INT) RETURNS TABLE
AS 

	RETURN 	(SELECT	[Course] = C.Subject+' '+C.CourseNumber,
					C.Title, 
					C.CreditHours, 
					SC.GradeLetter
			FROM Course C
				JOIN StudentCourse SC ON SC.CourseID = C.CourseID
				JOIN Student S ON S.StudentMiamiID = SC.StudentMiamiID
			WHERE S.StudentMiamiID = @StudentID)

GO

/****** Object:  Index IX_Student_FirstName ******/
CREATE NONCLUSTERED INDEX IX_Student_FirstName ON Student(
	FirstName ASC
)
GO


/****** Object:  Index IX_Advisor_FirstName ******/
CREATE NONCLUSTERED INDEX IX_Advisor_FirstName ON Advisor(
	FirstName ASC
)
GO


/****** Object:  Index IX_StudentCourse_Subject ******/
CREATE NONCLUSTERED INDEX IX_StudentCourse_Subject ON Course(
	[Subject] ASC
)
GO


ALTER TABLE StudentCourse 
WITH NOCHECK 
ADD CONSTRAINT FK_StudentCourse_Student
FOREIGN KEY(StudentMiamiID)
REFERENCES Student (StudentMiamiID)
GO

ALTER TABLE StudentCourse
CHECK CONSTRAINT FK_StudentCourse_Student
GO

ALTER TABLE StudentCourse 
WITH NOCHECK 
ADD CONSTRAINT FK_StudentCourse_Course
FOREIGN KEY(CourseID)
REFERENCES Course (CourseID)
GO

ALTER TABLE StudentCourse
CHECK CONSTRAINT FK_StudentCourse_Course
GO

ALTER TABLE Student 
WITH NOCHECK 
ADD CONSTRAINT FK_Student_Advisor
FOREIGN KEY(AdvisorMiamiID)
REFERENCES Advisor (AdvisorMiamiID)
GO

ALTER TABLE Student
CHECK CONSTRAINT FK_Student_Advisor
GO

ALTER DATABASE AdSupport SET  READ_WRITE 
GO