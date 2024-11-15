CREATE OR REPLACE PACKAGE student_management_pkg AS
    PROCEDURE add_student(
        student_id IN NUMBER,
        first_name IN VARCHAR2,
        last_name IN VARCHAR2,
        age IN NUMBER,
        course IN VARCHAR2,
        grade IN CHAR,
        enrollment_date IN DATE,
        last_updated IN DATE
    );

    FUNCTION get_student_grade(
        r_student_id IN NUMBER
    ) RETURN CHAR;

END student_management_pkg;
/