/*

Input Format

The CITY table is described as follows: 

		CITY
--------------------------------------
	Field	|	Type
--------------------------------------

    ID		|	NUMBER
    NAME	|	VARCHAR2(17)
    COUNTRYCODE |	VARCHAR2(3)
    DISTRICT    |	VARCHAR2(20)
    POPULATION  |
--------------------------------------

SELECT * FROM CITY;

6 Rotterdam NLD Zuid-Holland 593321 
3878 Scottsdale USA Arizona 202705 
3965 Corona USA California 124966 
3973 Concord USA California 121780 
3977 Cedar Rapids USA Iowa 120758 
3982 Coral Springs USA Florida 117549 
4054 Fairfield USA California 92256 
4058 Boulder USA Colorado 91238 
4061 Fall River USA Massachusetts 90555 

*/


---Query:

Query all columns for all American cities in CITY with populations larger than 100000. The CountryCode for America is USA.

SELECT * FROM CITY
WHERE POPULATION>100000 && COUNTRYCODE="USA";


TestCase Result:

3878 Scottsdale USA Arizona 202705 
3965 Corona USA California 124966 
3973 Concord USA California 121780 
3977 Cedar Rapids USA Iowa 120758 
3982 Coral Springs USA Florida 117549

---Query:

Query the names of all American cities in CITY with populations larger than 120000. The CountryCode for America is USA.

SELECT NAME FROM CITY
WHERE POPULATION>120000 && COUNTRYCODE="USA";

TestCase Result:

Scottsdale 
Corona 
Concord 
Cedar Rapids 

---Query:

Query all columns for a city in CITY with the ID 1661.

SELECT * FROM CITY
WHERE ID=1661;

TestCase Results:

1661 Sayama JPN Saitama 162472

