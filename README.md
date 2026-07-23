# SAP ABAP Leave-Management System

## Overview

This project is a Leave Management System developed using SAP ABAP. It allows employees to apply for leave while enabling managers to approve, reject, or cancel requests. The system automatically updates leave balances and provides reports for leave history, leave summary, and management dashboard.

---

## Features

- Employee Master Management
- Leave Balance Management
- Leave Application
- Leave Approval
- Leave Rejection
- Leave Cancellation
- Automatic Leave Balance Updates
- Leave History Report
- Leave Summary Report
- Dashboard Report

---

## Technologies Used

- SAP ABAP
- Open SQL
- SAP Dictionary (DDIC)
- Classical Reports

---

## SAP Dictionary Tables

- ZEMP_MASTER_HRI
- ZEMP_LEAVEBAL_HR
- ZLEAVE_REQUEST_H

---

## Reports

- ZEMP_SEARCH_HRI
- ZEMP_DISPLAY_HRI
- ZLEAVE_APPLY_HRI
- ZLEAVE_APPROVE_HRI
- ZLEAVE_REJECT_HRI
- ZLEAVE_CANCEL_HRI
- ZLEAVE_REQST_DELETE_HRI
- ZLEAVE-DISPLAY_HRI
- ZLEAVE_HISTORY_HRI
- ZEMP_LEAVE_SUMMARY_HRI
- ZLEAVE_DASHBOARD_HRI

---

## Workflow

Employee → Apply Leave → Pending → Approve/Reject → Update Balance → Cancel Leave → Restore Balance

---

## Screenshots

Screenshots are available in the `Screenshots` folder.

---

## Note

This project was developed in an SAP ABAP environment (SAP Logon) and requires an SAP system for execution.
