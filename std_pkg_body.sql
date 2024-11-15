CREATE OR REPLACE PACKAGE BODY student_management_pkg AS

    PROCEDURE add_student(
        student_id IN NUMBER,
        first_name IN VARCHAR2,
        last_name IN VARCHAR2,
        age IN NUMBER,
        course IN VARCHAR2,
        grade IN CHAR,
        enrollment_date IN DATE,
        last_updated IN DATE
    ) IS

    BEGIN

        INSERT INTO students (student_id, first_name, last_name, age, course, grade, enrollment_date, last_updated)
        VALUES (student_id, first_name, last_name, age, course, grade, enrollment_date, last_updated);
        COMMIT;

    END add_student;

    FUNCTION get_student_grade (r_student_id IN NUMBER) RETURN CHAR IS
        v_grade CHAR(1);
    BEGIN
        SELECT grade INTO v_grade from students WHERE student_id = r_student_id AND ROWNUM = 1;

        RETURN v_grade;

    EXCEPTION
        WHEN NO_DATA_FOUND THEN
            RETURN 'N';
        WHEN TOO_MANY_ROWS THEN
            RAISE_APPLICATION_ERROR( -20002,'Duplicate');
            
    END get_student_grade;

END student_management_pkg;
/