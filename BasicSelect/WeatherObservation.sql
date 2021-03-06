/*

Query a list of CITY and STATE from the STATION table.

Input Format

The STATION table is described as follows:

               STATION 
--------------------------------------
        Field   |       Type
--------------------------------------

    ID          |       NUMBER
    CITY        |       VARCHAR2(21)
    STATE       |       VARCHAR2(2)
    LAT_N       |       NUMBER
    LONG_W      |       NUMBER
--------------------------------------

*/

---Query

Query a list of CITY names from STATION with even ID numbers only. You may print the results in any order, but must exclude duplicates from your answer.

SELECT DISTINCT CITY FROM STATION WHERE ID%2 = 0;

---Query

Let N be the number of CITY entries in STATION, and let N' be the number of distinct CITY names in STATION; query the value of N-N'  from STATION. In other words, find the difference between the total number of CITY entries in the table and the number of distinct CITY entries in the table.
select (count(CITY)-COUNT(DISTINCT CITY)) from STATION;

---Query

Query the two cities in STATION with the shortest and longest CITY names, as well as their respective lengths (i.e.: number of characters in the name). If there is more than one smallest or largest city, choose the one that comes first when ordered alphabetically.

Sample Input

Let's say that CITY only has four entries: DEF, ABC, PQRS and WXY

Sample Output

ABC 3
PQRS 4
Explanation

When ordered alphabetically, the CITY names are listed as ABC, DEF, PQRS, and WXY, with the respective lengths  3,3,4 and 3. The longest-named city is obviously PQRS, but there are  options for shortest-named city; we choose ABC, because it comes first alphabetically.


SELECT * FROM (SELECT CITY, LENGTH(CITY) FROM STATION ORDER BY LENGTH(CITY), CITY) WHERE ROWNUM = 1
UNION
SELECT * FROM (SELECT CITY, LENGTH(CITY) FROM STATION ORDER BY LENGTH(CITY) DESC, CITY) WHERE ROWNUM = 1;

---Query

WILDCARD: 
^[x] for START and 
[x]$ for END

Query the list of CITY name STARTING with vowels (i.e., a, e, i, o, or u) from STATION. Your result cannot contain duplicates.

In Oracle:
select distinct city from station where REGEXP_LIKE(City, '^[aeiouAEIOU]') order by city;

In MySQL:
select distinct city from station where city regexp '^[aeiouAEIOU]' order by city

---Query
Query the list of CITY names ending with vowels (a, e, i, o, u) from STATION. Your result cannot contain duplicates.

In MySQL:
SELECT DISTINCT 
    city 
FROM 
    station 
WHERE 
    city 
REGEXP 
    '[aeiouAEIOU]$';


---query

Query the list of CITY names from STATION which have vowels (i.e., a, e, i, o, and u) as both their first and last characters. Your result cannot contain duplicates.

MySql:
SELECT DISTINCT CITY FROM STATION WHERE CITY REGEXP '^[AEIOU][A-Z \s]*[AEIOU]$';
OR
SELECT DISTINCT CITY FROM STATION WHERE UPPER(CITY) REGEXP '^[AEIOU].*[AEIOU]$';

Oracle:

SELECT DISTINCT CITY FROM STATION WHERE CITY REGEXP '^[AEIOU]' AND CITY REGEXP '[AEIOU]$';
OR
SELECT DISTINCT CITY FROM STATION WHERE RIGHT (CITY, 1) IN ('A','E', 'I', 'O', 'U') AND LEFT (CITY,1) in ('A','E', 'I', 'O', 'U');

---query "NOT Condition"

Query the list of CITY names from STATION that do not start with vowels. Your result cannot contain duplicates.

MySql:

select distinct city from station where NOT city regexp '^[aeiouAEIOU]' order by city

---query "NOT Condition"

Query the list of CITY names from STATION that do not end with vowels. Your result cannot contain duplicates.

select distinct city from station where NOT city regexp '[aeiouAEIOU]$' order by city;

---query "NOT Condition"

Query the list of CITY names from STATION that either do not start with vowels or do not end with vowels. Your result cannot contain duplicates.

SELECT DISTINCT CITY FROM STATION WHERE CITY NOT REGEXP '^[AEIOU]' OR CITY NOT REGEXP '[AEIOU]$';

---query "NOT Condition"

Query the list of CITY names from STATION that do not start with vowels and do not end with vowels. Your result cannot contain duplicates.

select distinct city from station where city regexp '^[^aeiou].*[^aeiou]$'

