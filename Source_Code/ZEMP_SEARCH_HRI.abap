*&---------------------------------------------------------------------*
*& Report ZEMP_SEARCH_HRI
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT ZEMP_SEARCH_HRI.


PARAMETERS p_empid TYPE zemp_id_leav..

DATA ls_emp TYPE zemp_master_hri.

SELECT SINGLE *
  FROM zemp_master_hri
  INTO ls_emp
  WHERE emp_id = p_empid.

IF sy-subrc = 0.

  WRITE: / 'Employee Found'.
  ULINE.

  WRITE: / 'Employee ID :', ls_emp-emp_id.
  WRITE: / 'Name        :', ls_emp-emp_name.
  WRITE: / 'Department  :', ls_emp-department.

ELSE.

  WRITE: / 'Employee Not Found'.

ENDIF.
