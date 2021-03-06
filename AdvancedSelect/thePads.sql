/*

Generate the following two result sets:

Query an alphabetically ordered list of all names in OCCUPATIONS, immediately
followed by the first letter of each profession as a parenthetical
(i.e.: enclosed in parentheses). 
For example: AnActorName(A), ADoctorName(D), AProfessorName(P), and ASingerName(S).
Query the number of ocurrences of each occupation in OCCUPATIONS.
Sort the occurrences in ascending order, and output them in the following format: 

There are total [occupation_count] [occupation]s.

*/

SELECT concat(Name,'(',left(Occupation,1),')') as New FROM Occupations ORDER BY New;
SELECT concat('There are total ',count(Occupation),' ',lower(Occupation),'s.') as New FROM Occupations GROUP BY Occupation ORDER BY count(Occupation),Occupation;
