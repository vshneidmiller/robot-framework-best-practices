*** Settings ***
Documentation    This test suite demonstrates the usage of Embedded Arguments in Robot Framework for security incident handling.

*** Test Cases ***
Phishing Incident
    Security Analyst investigates a "Phishing" incident
    Security Analyst remediates a "Phishing" incident

Malware Incident
    Security Analyst investigates a "Malware" incident
    Security Analyst remediates a "Malware" incident

Data Leak Incident
    Security Analyst investigates a "Data Leak" incident
    Security Analyst remediates a "Data Leak" incident

*** Keywords ***
Security Analyst investigates a "${incident_type}" incident
    Log    Select incident: ${incident_type}
    Log    Investigate incident

Security Analyst remediates a "${incident_type}" incident
    Log    Select incident: ${incident_type}
    Log    Remediate incident
