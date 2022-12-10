CONNECT scott/tiger;

SET SERVEROUTPUT ON

SPOOL /tmp/oracle/projectPart1_spool.txt

SELECT to_char(sysdate, 'DD Month YYYY Year Day HH:MI:SS Am')
FROM   dual;

/*  Question 1:
    Create a procedure that accept a number to display the triple of its value
    to the screen as follow:
    The triple of ... is ...
    Ex:
    Exec L1q1 (2)
    The triple of 2 is 6.
    Exec L1q1 (3)
    The triple of 3 is 9. */
CREATE OR REPLACE PROCEDURE L1q1 (input IN NUMBER) AS
    num NUMBER;
    output NUMBER;
BEGIN
    num := input;
    output := num * 3;
    DBMS_OUTPUT.PUT_LINE('The triple of ' || num || ' is ' || output);
END;
/

exec L1q1 (2)
exec L1q1 (3)

/*  Question 2:
    Create a procedure that accepts a number which represent the temperature
    in Celsius. The procedure will convert the temperature into
    Fahrenheit using the following formula:
    Tf = (9/5) * Tc + 32
    Then display the following:
    ... degree in C is equivalent to ... in F
    Test your procedure for 3 different temperature. */
CREATE OR REPLACE PROCEDURE L1q2 (input IN NUMBER) AS
    Tc NUMBER;
    Tf NUMBER;
BEGIN
    Tc := input;
    Tf := (9/5) * Tc + 32;
    DBMS_OUTPUT.PUT_LINE(Tc || ' degree in C is equivalent to ' || Tf || ' in F');
END;
/

exec L1q2 (0)
exec L1q2 (36.6)
exec L1q2 (100)


/*  Question 3:
    Create a procedure that accept a number which represent the temperature
    in Fahrenheit. The procedure will convert the temperature into
    Celsius using the following formula:
    Tc = (5/9) * (Tf - 32)
    Then display the following:
    ... degree in F is equivalent to ... in C
    Test run your procedure for 3 different temperatures.
    Use the procedure of question 2 to check for the accuracy of your procedure. */
CREATE OR REPLACE PROCEDURE L1q3 (input IN NUMBER) AS
    Tf NUMBER;
    Tc NUMBER;
BEGIN
    Tf := input;
    Tc := (5/9) * (Tf - 32);
    DBMS_OUTPUT.PUT_LINE(Tf || ' degree in F is equivalent to ' || Tc || ' in C');
END;
/

exec L1q3 (32)
exec L1q3 (97.88)
exec L1q3 (212)


/*  Question 4:
    Create a procedure that accepts a number used to calculate the
    5% GST, 9.98 % QST, the total of the 2 tax, the grand total, and to
    display EVERY THING to the screen as follow:
    For the price of $...
    You will have to pay $... GST
    $ ... QST for a total of $...
    The GRAND TOTAL is $ ...
    Ex:
    SQL> Exec L1q4 (100)
    For the price of $100
    You will have to pay $5 GST
    $ 9.98 QST for a total of $14.98
    The GRAND TOTAL is $ $114.98 */
CREATE OR REPLACE PROCEDURE L1q4 (input IN NUMBER) AS
    amount NUMBER;
    GST NUMBER;
    QST NUMBER;
    taxTotal NUMBER;
    grandTotal NUMBER;
BEGIN
    amount := input;
    GST := amount * 0.05;
    QST := amount * 0.0998;
    taxTotal := GST + QST;
    grandTotal := amount + taxTotal;
    DBMS_OUTPUT.PUT_LINE('For the price of $' || amount || chr(10) ||
                        'You will have to pay $' || GST || ' GST');
    DBMS_OUTPUT.PUT_LINE('$' || QST || ' QST for a total of $' || taxTotal || chr(10) ||
                        'The GRAND TOTAL is $' || grandTotal);
END;
/

exec L1q4 (100)


/*  Question 5:
    Create a procedure that accepts 2 numbers represented the width and
    height of a rectangular shape. The procedure will calculate the
    area and the perimeter using the following formula:
    Area = Width X Height
    Perimeter = (Width + Height) X 2
    display EVERY THING to the screen as follow:
    The area of a ... by ... is .... It's parameter is ...
    Ex:
    SQL> Exec L1q5 (2,3)
    The area of a 2 by 3 rectangle is 6 It's parameter is 10. */
CREATE OR REPLACE PROCEDURE L1q5 (inputNum1 IN NUMBER, inputNum2 IN NUMBER) AS
    width NUMBER;
    height NUMBER;
    area NUMBER;
    perimeter NUMBER;
BEGIN
    width := inputNum1;
    height := inputNum2;
    area := width * height;
    perimeter := (width + height) * 2;
    DBMS_OUTPUT.PUT_LINE('The Area of a ' || width || ' by ' || height || ' is ' || area || ', ' || chr(10) ||
                        'The Perimeter is ' || perimeter);
END;
/

exec L1q5 (2, 3)


/*  Question 6:
    Use the formula of question 2, create a function that accepts the temperature 
    in Celsius to convert it into temperature in Fahrenheit. 
    Test your function at least 3 times with 3 different temperature. */
CREATE OR REPLACE FUNCTION convert_celcius_to_fahrenheit(input IN NUMBER)
RETURN NUMBER AS
    celcius NUMBER;
    fahrenheit NUMBER;
BEGIN
    celcius := input;
    fahrenheit := (9/5) * celcius + 32;
    RETURN fahrenheit;
END;
/

SELECT
    convert_celcius_to_fahrenheit (0)
FROM
    dual;

SELECT
    convert_celcius_to_fahrenheit (36.6)
FROM
    dual;

SELECT
    convert_celcius_to_fahrenheit (100)
FROM
    dual;


/*  Question 7:
    Use the formula of question 3, create a function that accepts the temperature 
    in Fahrenheit to convert it into temperature in Celsius. 
    Test your function at least 3 times with 3 different temperatures. */
CREATE OR REPLACE FUNCTION convert_fahrenheit_to_celcius(input IN NUMBER)
RETURN NUMBER AS
    fahrenheit NUMBER;
    celcius NUMBER;
BEGIN
    fahrenheit := input;
    celcius := (5/9) * (fahrenheit - 32);
    RETURN celcius;
END;
/

SELECT
    convert_fahrenheit_to_celcius (32)
FROM
    dual;

SELECT
    convert_fahrenheit_to_celcius (97.88)
FROM
    dual;

SELECT
    convert_fahrenheit_to_celcius (212)
FROM
    dual;

SPOOL OFF;