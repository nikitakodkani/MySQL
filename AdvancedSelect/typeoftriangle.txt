/*

Write a query identifying the type of each record in the TRIANGLES table using
its three side lengths. Output one of the following statements for each record
in the table:

Cases:

Not A Triangle: The given values of A, B, and C don't form a triangle.
Equilateral: It's a triangle with  sides of equal length.
Isosceles: It's a triangle with  sides of equal length.
Scalene: It's a triangle with  sides of differing lengths.

Sample Input:

-------------------
|  A  |  B  |  C  |
|-----------------
| 20  |  20 | 23  |
| 20  |  21 | 20  |
| 20  |  21 | 22  |
| 13  |  14 | 30  | 
|------------------

Sample Output

Isosceles
Equilateral
Scalene
Not A Triangle

Explanation

Isosceles triangle, because  A = B 
Equilateral triangle, because A = B = C
Scalene triangle, because none are equal
Values in the tuple cannot form a triangle because the combined value of A & B
sides and is not larger than C

---Query "CASE"

Syntax:

CASE value WHEN [compare_value] THEN result 
[WHEN [compare_value] THEN result ...] 
[ELSE result] 
END

*/

Final query:

SELECT CASE             
            WHEN A + B > C AND B + C > A AND A + C > B THEN
                CASE 
                    WHEN A = B AND B = C THEN 'Equilateral'
                    WHEN A = B OR B = C OR A = C THEN 'Isosceles'
                    ELSE 'Scalene'
                END
            ELSE 'Not A Triangle'
        END
FROM TRIANGLES;
