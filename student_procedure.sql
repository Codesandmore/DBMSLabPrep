set serveroutput on;

ACCEPT p_student_id NUMBER PROMPT 'Enter student id: '
ACCEPT p_new_grade CHAR PROMPT 'Enter new grade(A/B/C/D): '

DECLARE
    
    PROCEDURE update_grade (p_student_id IN NUMBER, p_new_grade IN CHAR) IS
    BEGIN
        UPDATE students set grade = p_new_grade WHERE student_id = p_student_id;
        COMMIT;
        DBMS_OUTPUT.PUT_LINE('Grade changed for student_id ' || p_student_id || ' to ' || p_new_grade);
    END;  

BEGIN
 
    update_grade(&p_student_id,'&p_new_grade');

END;
/