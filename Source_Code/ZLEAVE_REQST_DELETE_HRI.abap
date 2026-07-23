*&---------------------------------------------------------------------*
*& Report ZLEAVE_REQST_DELETE_HRI
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT ZLEAVE_REQST_DELETE_HRI.


PARAMETERS p_reqid TYPE zleave_request_h-req_id.

DELETE FROM zleave_request_h
  WHERE req_id = p_reqid.

IF sy-subrc = 0.
  WRITE: / 'Leave Request Deleted Successfully'.
ELSE.
  WRITE: / 'Request Not Found'.
ENDIF.