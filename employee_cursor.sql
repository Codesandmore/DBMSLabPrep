set serveroutput on;

DECLARE
    CURSOR empcursor IS
        SELECT department, AVG(salary) AS avg_salary FROM employees GROUP BY department; 
    
    dept_name employees.department%TYPE;
    avg_salary employees.salary%TYPE;

BEGIN
 
    OPEN empcursor;

    LOOP
        FETCH empcursor into dept_name,avg_salary;


        EXIT WHEN empcursor%NOTFOUND;

        DBMS_OUTPUT.PUT_LINE('Department: ' || dept_name || ', Average Salary: ' || avg_salary);

        if avg_salary<6000 THEN
            
            UPDATE employees SET salary = salary * 1.1 WHERE department = dept_name;
            DBMS_OUTPUT.PUT_LINE('Average salaries in department ' || dept_name || ' was incremented from ' || avg_salary || ' to ' || avg_salary * 1.1);
        END if;

    END LOOP;

    CLOSE empcursor;

END;
/