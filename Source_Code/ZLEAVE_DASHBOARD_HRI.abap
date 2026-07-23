*&---------------------------------------------------------------------*
*& Report ZLEAVE_DASHBOARD_HRI
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT ZLEAVE_DASHBOARD_HRI.


DATA:
  lv_total_emp      TYPE i,
  lv_total_req      TYPE i,
  lv_pending_req    TYPE i,
  lv_approved_req   TYPE i,
  lv_rejected_req   TYPE i,
  lv_cancelled_req  TYPE i.

* Count Total Employees

SELECT COUNT( * )
  INTO lv_total_emp
  FROM zemp_master_hri.

* Count Total Leave Requests
SELECT COUNT( * )
  INTO lv_total_req
  FROM zleave_request_h.


* Count Pending Requests
SELECT COUNT( * )
  INTO lv_pending_req
  FROM zleave_request_h
  WHERE status = 'PENDING'.

* Count Approved Requests
SELECT COUNT( * )
  INTO lv_approved_req
  FROM zleave_request_h
  WHERE status = 'APPROVED'.

* Count Rejected Requests
SELECT COUNT( * )
  INTO lv_rejected_req
  FROM zleave_request_h
  WHERE status = 'REJECTED'.

* Count Cancelled Requests
SELECT COUNT( * )
  INTO lv_cancelled_req
  FROM zleave_request_h
  WHERE status = 'CANCELLED'.


* Display Dashboard

ULINE.
WRITE: / '           LEAVE MANAGEMENT DASHBOARD'.
ULINE.

SKIP.

WRITE: / 'Total Employees          : ', lv_total_emp.
WRITE: / 'Total Leave Requests     : ', lv_total_req.
WRITE: / 'Pending Requests         : ', lv_pending_req.
WRITE: / 'Approved Requests        : ', lv_approved_req.
WRITE: / 'Rejected Requests        : ', lv_rejected_req.
WRITE: / 'Cancelled Requests       : ', lv_cancelled_req.

ULINE.