*&---------------------------------------------------------------------*
*& Report ZLEAVE_HISTORY_HRI
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zleave_history_hri.

PARAMETERS: p_empid TYPE zemp_id_leav.

DATA:
      lt_leave TYPE TABLE OF zleave_request_h,
      ls_leave TYPE zleave_request_h.

START-OF-SELECTION.

SELECT *
  FROM zleave_request_h
  INTO TABLE lt_leave
  WHERE emp_id = p_empid.

IF sy-subrc <> 0.
  WRITE: / 'No leave history found for Employee ID:', p_empid.
  EXIT.
ENDIF.

WRITE: / '************* LEAVE HISTORY REPORT *************'.
ULINE.

WRITE: / 'Employee ID :', p_empid.
ULINE.

WRITE: / 'Request ID',
         18 'Leave Type',
         35 'From Date',
         50 'To Date',
         65 'Days',
         75 'Status',
         90 'Created On'.

ULINE.

LOOP AT lt_leave INTO ls_leave.

  WRITE: / ls_leave-req_id,
           18 ls_leave-leave_type,
           35 ls_leave-from_date,
           50 ls_leave-to_date,
           65 ls_leave-leave_days,
           75 ls_leave-status,
           90 ls_leave-created_on.

ENDLOOP.

ULINE.
WRITE: / 'Total Leave Requests:', lines( lt_leave ).