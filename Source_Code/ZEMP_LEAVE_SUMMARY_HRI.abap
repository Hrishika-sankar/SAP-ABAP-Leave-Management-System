*&---------------------------------------------------------------------*
*& Report ZEMP_LEAVE_SUMMARY_HRI
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT ZEMP_LEAVE_SUMMARY_HRI.



PARAMETERS p_empid TYPE zemp_master_hri-emp_id.

DATA ls_bal TYPE zemp_leavebal_hr.

SELECT SINGLE *
  FROM zemp_leavebal_hr
  INTO ls_bal
  WHERE emp_id = p_empid.

IF sy-subrc <> 0.

  WRITE: / 'Employee Leave Record Not Found'.

ELSE.

  WRITE: / 'Employee ID :', ls_bal-emp_id.

  SKIP.
  WRITE: / 'ANNUAL LEAVE'.
  ULINE.

  WRITE: / 'Total   :', ls_bal-annual_total.
  WRITE: / 'Used    :', ls_bal-annual_used.
  WRITE: / 'Balance :', ls_bal-annual_bal.

  SKIP.
  WRITE: / 'SICK LEAVE'.
  ULINE.

  WRITE: / 'Total   :', ls_bal-sick_total.
  WRITE: / 'Used    :', ls_bal-sick_used.
  WRITE: / 'Balance :', ls_bal-sick_bal.

ENDIF.