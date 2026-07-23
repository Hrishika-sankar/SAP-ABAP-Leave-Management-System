*&---------------------------------------------------------------------*
*& Report ZEMP_DISPLAY_HRI
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT ZEMP_DISPLAY_HRI.



DATA: lt_emp TYPE TABLE OF zemp_master_hri,
      ls_emp TYPE zemp_master_hri.

SELECT *
  FROM zemp_master_hri
  INTO TABLE lt_emp.

WRITE: / 'EMPLOYEE LIST'.
ULINE.

LOOP AT lt_emp INTO ls_emp.

  WRITE: /
           ls_emp-emp_id,
           ls_emp-emp_name,
           ls_emp-department.

ENDLOOP.