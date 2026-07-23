*&---------------------------------------------------------------------*
*& Report ZLEAVE_REJECT_HRI
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT ZLEAVE_REJECT_HRI.


PARAMETERS p_reqid TYPE zleave_request_h-req_id.

DATA ls_leave TYPE zleave_request_h.

SELECT SINGLE *
  FROM zleave_request_h
  INTO ls_leave
  WHERE req_id = p_reqid.

IF sy-subrc <> 0.
  WRITE: / 'Leave Request Not Found'.
  EXIT.
ENDIF.

IF ls_leave-status = 'APPROVED'.
  WRITE: / 'Approved Requests Cannot Be Rejected'.
  EXIT.
ENDIF.

IF ls_leave-status = 'REJECTED'.
  WRITE: / 'Leave Request Already Rejected'.
  EXIT.
ENDIF.

ls_leave-status = 'REJECTED'.

UPDATE zleave_request_h
  FROM ls_leave.

IF sy-subrc = 0.
  WRITE: / 'Leave Request Rejected Successfully'.
ELSE.
  WRITE: / 'Error While Rejecting Request'.
ENDIF.