*&---------------------------------------------------------------------*
*& Report ZLEAVE_CANCEL_HRI
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT ZLEAVE_CANCEL_HRI.


PARAMETERS p_reqid TYPE zreqst_id.

DATA:
  ls_leave TYPE zleave_request_h,
  ls_bal   TYPE zemp_leavebal_hr.

* Read Leave Request
SELECT SINGLE *
  FROM zleave_request_h
  INTO ls_leave
  WHERE req_id = p_reqid.

IF sy-subrc <> 0.
  WRITE: / 'Leave Request Not Found'.
  EXIT.
ENDIF.

* Allow cancellation only for approved requests
IF ls_leave-status <> 'APPROVED'.
  WRITE: / 'Only Approved Requests Can Be Cancelled'.
  EXIT.
ENDIF.

* Read Employee Leave Balance
SELECT SINGLE *
  FROM zemp_leavebal_hr
  INTO ls_bal
  WHERE emp_id = ls_leave-emp_id.

IF sy-subrc <> 0.
  WRITE: / 'Employee Leave Balance Record Not Found'.
  EXIT.
ENDIF.

* Restore Leave Balance
IF ls_leave-leave_type = 'ANNUAL'.

  ls_bal-annual_used =
    ls_bal-annual_used - ls_leave-leave_days.

  ls_bal-annual_bal =
    ls_bal-annual_bal + ls_leave-leave_days.

ELSEIF ls_leave-leave_type = 'SICK'.

  ls_bal-sick_used =
    ls_bal-sick_used - ls_leave-leave_days.

  ls_bal-sick_bal =
    ls_bal-sick_bal + ls_leave-leave_days.

ENDIF.

* Update Leave Balance Table
UPDATE zemp_leavebal_hr
  FROM ls_bal.

IF sy-subrc <> 0.
  WRITE: / 'Error Updating Leave Balance'.
  EXIT.
ENDIF.

* Update Leave Request Status
ls_leave-status = 'CANCELLED'.

UPDATE zleave_request_h
  FROM ls_leave.

IF sy-subrc = 0.
  WRITE: / 'Leave Cancelled Successfully'.
ELSE.
  WRITE: / 'Error While Cancelling Leave'.
ENDIF.