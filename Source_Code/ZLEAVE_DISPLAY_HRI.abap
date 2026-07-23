*&---------------------------------------------------------------------*
*& Report ZLEAVE_DISPLAY_HRI
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT ZLEAVE_DISPLAY_HRI.


DATA:
  lt_leave TYPE TABLE OF zleave_request_h,
  ls_leave TYPE zleave_request_h.

SELECT *
  FROM zleave_request_h
  INTO TABLE lt_leave.

WRITE: / 'LEAVE REQUEST LIST'.
ULINE.

LOOP AT lt_leave INTO ls_leave.

  WRITE: /
    ls_leave-req_id,
    ls_leave-emp_id,
    ls_leave-leave_type,
    ls_leave-leave_days,
    ls_leave-status.

ENDLOOP.