*&---------------------------------------------------------------------*
*& Report ZLEAVE_APPROVE_HRI
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zleave_approve_hri.

PARAMETERS p_reqid TYPE zleave_request_h-req_id.

DATA:
  ls_leave TYPE zleave_request_h,
  ls_bal   TYPE zemp_leavebal_hr.

* Read leave request
SELECT SINGLE *
  FROM zleave_request_h
  INTO ls_leave
  WHERE req_id = p_reqid.

IF ls_leave-status = 'APPROVED'.
  WRITE: / 'Leave Already Approved'.
  EXIT.
ENDIF.

IF sy-subrc <> 0.
  WRITE: / 'Leave Request Not Found'.
  EXIT.
ENDIF.

* Read employee balance
SELECT SINGLE *
  FROM zemp_leavebal_hr
  INTO ls_bal
  WHERE emp_id = ls_leave-emp_id.

IF sy-subrc <> 0.
  WRITE: / 'Employee Leave Balance Not Found'.
  EXIT.
ENDIF.

* Update balance based on leave type
IF ls_leave-leave_type = 'ANNUAL'.

  IF ls_bal-annual_bal < ls_leave-leave_days.
    WRITE: / 'Insufficient Annual Leave Balance'.
    EXIT.
  ENDIF.

  ls_bal-annual_used =
    ls_bal-annual_used + ls_leave-leave_days.

  ls_bal-annual_bal =
    ls_bal-annual_bal - ls_leave-leave_days.

ELSEIF ls_leave-leave_type = 'SICK'.

  IF ls_bal-sick_bal < ls_leave-leave_days.
    WRITE: / 'Insufficient Sick Leave Balance'.
    EXIT.
  ENDIF.

  ls_bal-sick_used =
    ls_bal-sick_used + ls_leave-leave_days.

  ls_bal-sick_bal =
    ls_bal-sick_bal - ls_leave-leave_days.

ENDIF.

* Save balance
UPDATE zemp_leavebal_hr
  FROM ls_bal.

* Approve request
ls_leave-status = 'APPROVED'.

UPDATE zleave_request_h
  FROM ls_leave.

IF sy-subrc = 0.
  WRITE: / 'Leave Approved and Balance Updated Successfully'.
ELSE.
  WRITE: / 'Error While Approving Leave'.
ENDIF.