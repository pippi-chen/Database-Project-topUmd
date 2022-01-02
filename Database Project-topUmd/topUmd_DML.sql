USE BUDT703_Project_0507_03;

--What faculty has taught for the highest number of years, which business school and what is their schools USNews ranking?
SELECT TOP 1 f.facName AS 'Faculty Name', 
	f.facYearsTeach AS 'Years Taught', 
	w.busName AS 'Business School', 
	r.othAgnRate AS 'USNews Ranking' 
FROM [TA03.Faculty] f, [TA03.Work] w, [TA03.Rate] r
WHERE f.facName = w.facName 
	AND w.busName = r.busName 
	AND r.othAgnName = 'USNews'
ORDER BY f.facYearsTeach DESC

--What is the faculty and number of publications, in order of publication amount, for the faculty that have Nobel prizes, and what is their corresponding business school?
SELECT f.facName AS 'Faculty Name', 
	f.facNumProjects AS 'Number of Publications', 
	w.busName AS 'Business School'
FROM [TA03.Faculty] f, [TA03.Work] w
WHERE f.facNumberNobel > 0 
	AND f.facName = w.facName
ORDER BY f.facNumProjects DESC

--What is the relationship between the USNews ranking and the financial support in terms of donations to the school, in order of donations?
SELECT d.busName AS 'Business School', 
	SUM(d.donAmount) AS 'Donation Received', 
	r.othAgnRate AS 'USNews Ranking'
FROM [TA03.Donation] d, [TA03.Rate] r
WHERE r.othAgnName = 'USNews' 
	AND r.busName = d.busName 
	AND d.donAmount IS NOT NULL
GROUP BY d.busName, r.othAgnRate 
ORDER BY SUM(d.donAmount) DESC

--What is the comparison between the USNews Ranking and the average of the agency rankings, in order of USNews Ranking for each business school?
SELECT USNews.othAgnRate AS USNewsRating, avg.averageRating, avg.busName
FROM (
	SELECT AVG(r.othAgnRate) AS averageRating, r.busName 
	FROM [TA03.Rate] r
	GROUP BY r.busName) AS avg, (
		SELECT r.othAgnRate, r.busName
		FROM [TA03.Rate] r
		WHERE r.othAgnName = 'USNews') AS USNews
WHERE avg.busName = USNews.busName                                          
ORDER BY USNews.othAgnRate, avg.averageRating;

--What 5 faculty had the highest number of awards, and what is their corresponding business schools USNews ranking?
SELECT TOP 5 f.facName AS 'Faculty Name', 
	f.facNumAwards AS 'Number of Awards', 
	w.busName AS 'Business School', 
	r.othAgnRate AS 'USNews Ranking' 
FROM [TA03.Faculty] f, [TA03.Work] w, [TA03.Rate] r
WHERE f.facName = w.facName 
	AND w.busName = r.busName 
	AND r.othAgnName = 'USNews'
ORDER BY f.facNumAwards DESC

--What is the relationship between the proportion of female students and the USNews ranking?
SELECT b.busName, r.othAgnName, r.othAgnRate, b.busProFemStudents 
FROM [TA03.Rate] r, [TA03.BusinessSchool] b
WHERE r.othAgnName='USNews'
	AND r.busName=b.busName 
ORDER BY busProFemStudents DESC;

--What is the relationship between the proportion of the international students and the USNews ranking?
SELECT b.busName, r.othAgnName, r.othAgnRate, b.busProIntStudents 
FROM [TA03.Rate] r, [TA03.BusinessSchool] b
WHERE r.othAgnName='USNews'
	AND r.busName = b.busName 
ORDER BY busProIntStudents DESC;

--What is the relationship between employment rate, salary, and USNews Ranking, in order of employment rate and highest salary?
SELECT b.busName, r.othAgnName, r.othAgnRate, b.busEmpRate, b.busAvgSalary
FROM [TA03.Rate] r, [TA03.BusinessSchool] b
WHERE r.othAgnName = 'USNews' 
	AND r.busName = b.busName 
ORDER BY b.busEmpRate DESC;

SELECT TOP 1 b.busName, b.busAvgSalary, r.othAgnName, r.othAgnRate, b.busEmpRate
FROM [TA03.Rate] r, [TA03.BusinessSchool] b
WHERE r.othAgnName='USNews' 
	AND r.busName=b.busName
ORDER BY b.busAvgSalary DESC;
                                      