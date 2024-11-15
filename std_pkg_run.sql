set serveroutput on;

DECLARE

    v_student_id NUMBER;
    v_first_name VARCHAR2(50);
    v_last_name VARCHAR2(50);
    v_age NUMBER;
    v_course VARCHAR2(50);
    v_grade CHAR(1);
    v_enrollment_date DATE;
    v_last_updated DATE;

BEGIN

     DBMS_OUTPUT.PUT_LINE('Enter Student ID:');
     v_student_id := &student_id;

    DBMS_OUTPUT.PUT_LINE('Enter First Name:');
    v_first_name := '&first_name';  
    
    DBMS_OUTPUT.PUT_LINE('Enter Last Name:');
    v_last_name := '&last_name';  
    
    DBMS_OUTPUT.PUT_LINE('Enter Age:');
    v_age := &age;  
    
    DBMS_OUTPUT.PUT_LINE('Enter Course:');
    v_course := '&course'; 
    
    DBMS_OUTPUT.PUT_LINE('Enter Grade (A, B, C, etc.):');
    v_grade := '&grade';  
    
    DBMS_OUTPUT.PUT_LINE('Enter Enrollment Date (e.g., 01-SEP-2023):');
    v_enrollment_date := TO_DATE('&enrollment_date','DD-MON-YYYY');

    v_last_updated := SYSDATE;

    student_management_pkg.add_student(
        v_student_id, 
        v_first_name, 
        v_last_name, 
        v_age, 
        v_course, 
        v_grade, 
        v_enrollment_date, 
        v_last_updated
    );

    DBMS_OUTPUT.PUT_LINE('Student added successfully!');

END;
/

DECLARE

    v_student_id NUMBER;
    v_grade CHAR(1);

BEGIN

    DBMS_OUTPUT.PUT_LINE('Enter Student ID to fetch the grade:');
    v_student_id := &student_id; 

    v_grade := student_management_pkg.get_student_grade(v_student_id);

    DBMS_OUTPUT.PUT_LINE('Student grade: ' || v_grade);

END;
/ 