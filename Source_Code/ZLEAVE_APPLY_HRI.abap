*&---------------------------------------------------------------------*
*& Report ZLEAVE_APPLY_HRI
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT ZLEAVE_APPLY_HRI.



PARAMETERS:
  p_empid TYPE c LENGTH 10,
  p_ltype TYPE zleave_type,
  p_fdate TYPE dats,
  p_tdate TYPE dats,
  p_days  TYPE zdays.

DATA:
  ls_leave TYPE zleave_request_h,
  ls_emp   TYPE zemp_master_hri.

* Check whether employee exists
SELECT SINGLE *
  FROM zemp_master_hri
  INTO ls_emp
  WHERE emp_id = p_empid.


IF sy-subrc <> 0.
  WRITE: / 'Employee does not exist'.
  EXIT.
ENDIF.

* Fill leave request structure
DATA:
  lv_maxid TYPE zleave_request_h-req_id,
  lv_newid TYPE zleave_request_h-req_id.

SELECT MAX( req_id )
  INTO lv_maxid
  FROM zleave_request_h.

lv_newid = lv_maxid + 1.

ls_leave-req_id = lv_newid.
ls_leave-emp_id     = p_empid.
ls_leave-leave_type = p_ltype.
ls_leave-from_date  = p_fdate.
ls_leave-to_date    = p_tdate.
ls_leave-leave_days = p_days.
ls_leave-status     = 'PENDING'.
ls_leave-created_on = sy-datum.

* Insert leave request
INSERT zleave_request_h FROM ls_leave.

IF sy-subrc = 0.
  WRITE: / 'Leave Request Submitted Successfully'.
ELSE.
  WRITE: / 'Error While Saving Request'.
ENDIF.