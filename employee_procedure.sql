CREATE OR REPLACE PROCEDURE print_salary(p_employee_id IN NUMBER) AS
   v_salary employees.salary%TYPE;
   v_emp_name employees.name%TYPE;
   CURSOR emp_cursor IS
      SELECT name, salary
      FROM employees
      WHERE employee_id = p_employee_id;
BEGIN
   OPEN emp_cursor;
   FETCH emp_cursor INTO v_emp_name, v_salary;

   IF emp_cursor%FOUND THEN
      DBMS_OUTPUT.PUT_LINE('Employee Name: ' || v_emp_name);
      DBMS_OUTPUT.PUT_LINE('Employee Salary: ' || v_salary);
   ELSE
      DBMS_OUTPUT.PUT_LINE('Employee not found with employee_id: ' || p_employee_id);
   END IF;

   CLOSE emp_cursor;
END print_salary;
/

DECLARE
   v_employee_id NUMBER;
BEGIN
    v_employee_id := &employee_id;
    print_salary(v_employee_id);
END;
/
