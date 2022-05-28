USE BUDT703_Project_0507_03;

DROP TABLE IF EXISTS [TA03.Rate];
DROP TABLE IF EXISTS [TA03.AgencyRanking]; DROP TABLE IF EXISTS [TA03.Donation];
DROP TABLE IF EXISTS [TA03.Work];
DROP TABLE IF EXISTS [TA03.Publish];
DROP TABLE IF EXISTS [TA03.Publication]; DROP TABLE IF EXISTS [TA03.Faculty];
DROP TABLE IF EXISTS [TA03.BusinessSchool];

CREATE TABLE [TA03.BusinessSchool] ( 
	busName VARCHAR(40) NOT NULL, 
	busLocation VARCHAR(40),
	busNumStudents INTEGER,
	busProIntStudents DECIMAL(3,3),
	busProFemStudents DECIMAL(3,3),
	busGrdRate DECIMAL(3,3),
	busEmpRate DECIMAL(3,3),
	busNotableAlum VARCHAR(40),
	busAvgSalary DECIMAL(9,2),
	CONSTRAINT pk_BusinessSchool_busName PRIMARY KEY (busName));
INSERT INTO [TA03.BusinessSchool] VALUES
	('Stanford University', 'Stanford, CA', 848, .430, .440, .950, .910, 'Phil Knight', 156000.00),
	('University of Pennsylvania', 'Philadelphia, PA',1740, .230, .520, .960, .920, 'Sundar Pichai', 150000.00),	
	('Northwestern University', 'Evanston, IL', 1289, .080, .490, .950, .919,'James L. Allen', 142857.00),
	('University of Chicago', 'Chicago, IL', 1193, .30, .42, .960, .928, 'James Mc Kinsey', 147977.00),
	('Massachusetts Institute of Technology', 'Cambridge, MA',825, .097, .440, .956, .959, 'Kofi Annan', 180223.00),
	('Harvard University', 'Cambridge, MA', 1868, .330, .460, .976, .900, 'Mike Bloomberg', 148750.00),	
	('University of California, Berkeley', 'Berkeley, CA', 591, .390, .370, .923,.895, 'Constance Moore', 139423.00),
	('Columbia University', 'New York, NY', 1284, .470, .410, .962, .900, 'Warren Buffett', 150000.00),
	('Yale University', 'New Haven, CT', 722, .400, .430, NULL, .902, 'Oladiwura Oladepo', 170000.00),
	('University of Maryland', 'College Park, MD', 119, .970, .350, .963, .735,'Jeff Knabe', 159772.00);

CREATE TABLE [TA03.Faculty](
	facName VARCHAR(30) NOT NULL,
	facNumAwards INTEGER,
	facNumProjects INTEGER,
	facDomExpert VARCHAR(50),
	facYearsTeach INTEGER,
	facNumberNobel INTEGER,
	CONSTRAINT pk_Faculty_facName PRIMARY KEY (facName));
INSERT INTO [TA03.Faculty] VALUES
	('Ritu Agarwal', 25, 94, 'Information Systems', 24, 0),
	('Rajshree Agarwal', 13, 62, 'Management and Organization', 29, 0),
	('Paul R. Milgrom', 7, 17, 'Economics', 42, 1),
	('William F. Sharpe', 2, 146, 'Finance', 60, 1),
	('Gad Allon', 3, 361, 'Operations, Information and Decisions', 26, 0), 
	('Peter Cappelli', 14, 76, 'Human Resources', 43, 0),
	('Nicola Persico', 2, 43, 'Managerial Economics & Decision Sciences', 20, 0), 
	('Gregory Carpenter', 12, 81, 'Marketing', 44, 0),
	('Richard H. Thaler', 2, 100, 'Behavioral Science and Economics', 50, 1), 
	('Lars Peter Hansen', 10, 126, 'Economics', 43, 1),
	('Sinan Aral', 6, 105, 'Management Science', 8, 0),
	('Jacquelyn R. Gillette', 0, 6, 'Economics, Finance and Accounting', 5, 0), 
	('Lauren H. Cohen', 28, 29, 'Finance', 14, 0),
	('Jill J. Avery', 13, 17, 'Marketing', 8, 0),
	('Vinod K. Aggarwal', 12, 26, 'Business & Public Policy', 41, 0),
	('David A. Aaker', 8, 15, 'Marketing', 51, 0),
	('Ann P. Bartel', 5, 20, 'Economics', 45, 0),
	('Medini R. Singh', 9, 10, 'Decision, Risk and Operations', 11, 0), 
	('Barbara Biasi', 5, 6, 'Economics', 4, 0),
	('Alexander Burnap', 0, 4, 'Marketing', 1, 0);

CREATE TABLE [TA03.Publication](
	pubId VARCHAR(50) NOT NULL,
	pubYear DATE,
	CONSTRAINT pk_Publication_pubId PRIMARY KEY (pubId));
INSERT INTO [TA03.Publication] VALUES 
	('10.2307/3250951', '2000'), ('10.5465/20159599', '2017'), ('10.1257/aer.111.5.1383', '2021'), ('10.2469/faj.v31.n2.60', '2018'), ('10.1287/opre.1060.0337', '2007'), ('10.5465/amr.2011.0302', '2012'), ('10.1056/NEJMoa1704559', '2017'), ('10.1509/jmkg.68.4.76.42721', '2004'), ('10.1257/jep.5.1.193', '1991'), ('10.2307/1912775', '1982'), ('10.1287/mnsc.2020.3650', '2020'), ('10.1111/1475-679X.12307', '2020'), ('10.1126/science.aad2686', '2016'), ('10.1080/17544750.2012.660766', '2012'), ('10.1142/S1013251120400068', '2020'), ('10.1525/cmr.2012.54.2.43', '2012'), ('10.15185/izawol.362', '2017'), ('10.1287/opre.47.4.601', '1999'), ('10.1257/mic.20190113&&from=f', '2021'), ('10.1017/dsj.2016.9', '2016');

CREATE TABLE [TA03.Publish](
	facName VARCHAR(30) NOT NULL,
	pubId VARCHAR(50) NOT NULL,
	CONSTRAINT pk_Publish_facName_pubId PRIMARY KEY (facName, pubId),
	CONSTRAINT fk_Publish_facName FOREIGN KEY (facName) 
		REFERENCES [TA03.Faculty] (facName) 
		ON DELETE NO ACTION ON UPDATE NO ACTION,
	CONSTRAINT fk_Publish_pubId FOREIGN KEY (pubId)
		REFERENCES [TA03.Publication] (pubId)
		ON DELETE NO ACTION ON UPDATE NO ACTION);
INSERT INTO [TA03.Publish] VALUES
	('Ritu Agarwal', '10.2307/3250951'),
	('Rajshree Agarwal', '10.5465/20159599'),
	('Paul R. Milgrom', '10.1257/aer.111.5.1383'), 
	('William F. Sharpe', '10.2469/faj.v31.n2.60'), 
	('Gad Allon', '10.1287/opre.1060.0337'),
	('Peter Cappelli', '10.5465/amr.2011.0302'), 
	('Nicola Persico', '10.1056/NEJMoa1704559'), 
	('Gregory Carpenter', '10.1509/jmkg.68.4.76.42721'), 
	('Richard H. Thaler', '10.1257/jep.5.1.193'),
	('Lars Peter Hansen','10.2307/1912775'),
	('Sinan Aral', '10.1287/mnsc.2020.3650'), 
	('Jacquelyn R. Gillette', '10.1111/1475-679X.12307'), 
	('Lauren H. Cohen', '10.1126/science.aad2686'), 
	('Jill J. Avery', '10.1080/17544750.2012.660766'), 
	('Vinod K. Aggarwal', '10.1142/S1013251120400068'), 
	('David A. Aaker', '10.1525/cmr.2012.54.2.43'), 
	('Ann P. Bartel', '10.15185/izawol.362'),
	('Medini R. Singh', '10.1287/opre.47.4.601'), 
	('Barbara Biasi', '10.1257/mic.20190113&&from=f'), 
	('Alexander Burnap', '10.1017/dsj.2016.9');

CREATE TABLE [TA03.Work](
	facName VARCHAR(30) NOT NULL,
	busName VARCHAR(40) NOT NULL,
	CONSTRAINT pk_Work_facName_busName PRIMARY KEY (facName, busName),
	CONSTRAINT fk_Work_facName FOREIGN KEY (facName) 
		REFERENCES [TA03.Faculty] (facName) 
		ON DELETE CASCADE ON UPDATE CASCADE ,
	CONSTRAINT fk_Work_busName FOREIGN KEY (busName)
		REFERENCES [TA03.BusinessSchool] (busName)
		ON DELETE CASCADE  ON UPDATE CASCADE);
INSERT INTO [TA03.Work] VALUES
	('Ritu Agarwal', 'University of Maryland'),
	('Rajshree Agarwal', 'University of Maryland'),
	('Paul R. Milgrom', 'Stanford University'),
	('William F. Sharpe', 'Stanford University'),
	('Gad Allon', 'University of Pennsylvania'),
	('Peter Cappelli', 'University of Pennsylvania'),
	('Nicola Persico', 'Northwestern University'),
	('Gregory Carpenter', 'Northwestern University'),
	('Richard H. Thaler', 'University of Chicago'),
	('Lars Peter Hansen', 'University of Chicago'),
	('Sinan Aral', 'Massachusetts Institute of Technology'), 
	('Jacquelyn R. Gillette', 'Massachusetts Institute of Technology'), 
	('Lauren H. Cohen', 'Harvard University'),
	('Jill J. Avery', 'Harvard University'),
	('Vinod K. Aggarwal', 'University of California, Berkeley'), 
	('David A. Aaker', 'University of California, Berkeley'),
	('Ann P. Bartel', 'Columbia University'),
	('Medini R. Singh', 'Columbia University'),
	('Barbara Biasi', 'Yale University'),
	('Alexander Burnap', 'Yale University');

CREATE TABLE [TA03.Donation]( 
	busName VARCHAR(40) NOT NULL, 
	donId CHAR(10) NOT NULL, 
	donAmount DECIMAL(10, 2),
	donStartDate DATE,
	donEndDate DATE,
	CONSTRAINT pk_Donation_busName_donId PRIMARY KEY (busName, donId), 
	CONSTRAINT fk_Donation_busName FOREIGN KEY (busName)
		REFERENCES [TA03.BusinessSchool] (busName) 
		ON DELETE CASCADE ON UPDATE CASCADE);
INSERT INTO [TA03.Donation] VALUES
	('Stanford University', '1', 16000000, '09/01/2020', '08/31/2021'), 
	('University of Pennsylvania', '2', 18300000, '07/01/2020', '06/30/2021'), 
	('University of Pennsylvania', '3', 16100000, '07/01/2019', '06/30/2020'), 
	('University of Pennsylvania', '4', 16000000, '07/01/2017', '06/30/2018'), 
	('Northwestern University', '5', 12000000, '09/01/2017', '08/31/2018'), 
	('Northwestern University', '6', 10100000, '09/01/2016', '08/31/2017'), 
	('Northwestern University', '7', 7000000, '09/01/2015', '08/31/2016'), 
	('Northwestern University', '8', 6000000, '09/01/2014', '08/31/2015'), 
	('Northwestern University', '9', 5400000, '09/01/2013', '08/31/2014'), 
	('Northwestern University', '10', 4300000, '09/01/2012', '08/31/2013'), 
	('University of Chicago', '11', 12940000, '07/01/2020', '06/30/2021'), 
	('University of Chicago', '12', 11070000, '07/01/2019', '06/30/2020'), 
	('University of Chicago', '13', 10740000, '07/01/2018', '06/30/2019'), 
	('University of Chicago', '14', 11100000, '07/01/2017', '06/30/2018'), 
	('University of Chicago', '15', 8980000, '07/01/2016', '06/30/2017'), 
	('Massachusetts Institute of Technology', '16', NULL, NULL, NULL), 
	('Harvard University', '17', 56000000, '07/01/2019', '06/30/2020'), 
	('Harvard University', '18', 76000000, '07/01/2018', '06/30/2019'), 
	('Harvard University', '19', 22000000, '07/01/2012', '06/30/2013'), 
	('Harvard University', '20', 16700000, '07/01/2010', '06/30/2011'), 
	('University of California, Berkeley', '21', 45400000, '07/01/2020','06/30/2021'),
    ('University of California, Berkeley', '22', 27000000, '07/01/2019','06/30/2020'),
    ('University of California, Berkeley', '23', 28700000, '07/01/2018','06/30/2019'),
    ('University of California, Berkeley', '24', 40000000, '07/01/2017','06/30/2018'),
    ('University of California, Berkeley', '25', 21500000, '07/01/2016','06/30/2017'),
    ('University of California, Berkeley', '26', 35900000, '07/01/2015','06/30/2016'),
    ('University of California, Berkeley', '27', 35500000, '07/01/2014','06/30/2015'),
    ('University of California, Berkeley', '28', 29900000, '07/01/2013','06/30/2014'),
    ('University of California, Berkeley', '29', 42500000, '07/01/2012','06/30/2013'),
    ('Columbia University', '30', 29870000, '07/01/2019', '06/30/2020'),
	('Yale University', '31', 5200000, '07/01/2020', '06/30/2021'),
    ('University of Maryland', '32', 8451971, '07/01/2019', '06/30/2020');

CREATE TABLE [TA03.AgencyRanking](
	othAgnId VARCHAR(10) NOT NULL,
	othAgnName VARCHAR(20) ,
	othAgnRate INTEGER,
	CONSTRAINT pk_AgencyRanking_othAgnId PRIMARY KEY (othAgnId));
INSERT INTO [TA03.AgencyRanking] VALUES 
	('1','USNews', 1),
    ('2','USNews', 2),
    ('3','USNews', 3),
    ('4','USNews', 4),
    ('5','USNews', 5),
    ('6','USNews', 6),
    ('7','USNews', 7),
    ('8','USNews', 8),
    ('9','USNews', 9),
    ('10','USNews', 44),
    ('11','QS', 3),
    ('12','QS', 4),
    ('13','QS', 6),
    ('14','QS', 9),
    ('15','QS', 2),
    ('16','QS', 1),
    ('17','QS', 5),
    ('18','QS', 7),
    ('19','QS', 8),
    ('20','QS', 41),
    ('21','Bloomberg', 1),
    ('22','Bloomberg', 6),
    ('23','Bloomberg', 10),
    ('24','Bloomberg', 4),
    ('25','Bloomberg', 7),
    ('26','Bloomberg', 3),
    ('27','Bloomberg', 8),
    ('28','Bloomberg', 9),
    ('29','Bloomberg', 14),
    ('30','Bloomberg', 26);

CREATE TABLE [TA03.Rate](
	othAgnId VARCHAR(10) NOT NULL,
	busName VARCHAR(40) NOT NULL,
	othAgnName VARCHAR(20),
	othAgnRate INTEGER,
	CONSTRAINT pk_Rate_othAgnId_busName PRIMARY KEY (othAgnId,busName), 
	CONSTRAINT fk_Rate_othAgnId FOREIGN KEY (othAgnId) 
		REFERENCES[TA03.AgencyRanking](othAgnId)
		ON DELETE CASCADE ON UPDATE CASCADE, 
	CONSTRAINT fk_Rate_busName FOREIGN KEY (busName) 
		REFERENCES[TA03.BusinessSchool](busName)
		ON DELETE CASCADE ON UPDATE CASCADE);
INSERT INTO [TA03.Rate] VALUES
	('1','Stanford University', 'USNews', 1),
	('2','University of Pennsylvania', 'USNews', 2), 
	('3','Northwestern University', 'USNews', 3), 
	('4','University of Chicago', 'USNews', 4), 
	('5','Massachusetts Institute of Technology', 'USNews', 5), 
	('6','Harvard University', 'USNews', 6),
	('7','University of California, Berkeley', 'USNews', 7), 
	('8','Columbia University', 'USNews', 8),
	('9','Yale University', 'USNews', 9),
	('10','University of Maryland', 'USNews', 44), 
	('11','Stanford University', 'QS', 3),
	('12','University of Pennsylvania', 'QS', 4), 
	('13','Northwestern University', 'QS', 6), 
	('14','University of Chicago', 'QS', 9), 
	('15','Massachusetts Institute of Technology', 'QS', 2),
	('16','Harvard University', 'QS', 1),
	('17','University of California, Berkeley', 'QS', 5),
	('18','Columbia University', 'QS', 7),
	('19','Yale University', 'QS', 8),
	('20','University of Maryland', 'QS', 41),
	('21','Stanford University', 'Bloomberg', 1),
	('22','University of Pennsylvania', 'Bloomberg', 6),
	('23','Northwestern University', 'Bloomberg', 10),
	('24','University of Chicago', 'Bloomberg', '4'),
	('25','Massachusetts Institute of Technology', 'Bloomberg', 7),
	('26','Harvard University', 'Bloomberg', 3),
	('27','University of California, Berkeley', 'Bloomberg', 8),
	('28','Columbia University', 'Bloomberg', 9),
	('29','Yale University', 'Bloomberg', 14),
	('30','University of Maryland', 'Bloomberg', 26);
