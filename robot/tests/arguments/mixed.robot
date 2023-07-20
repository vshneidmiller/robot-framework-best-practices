*** Settings ***
Documentation    This test suite demonstrates the usage of various types of arguments in Robot Framework for security incident handling.

*** Test Cases ***
Ransomware Incident
    Investigate And Remediate Incident    Ransomware    High    action=Investigate    additional_info=File encryption detected
    Investigate And Remediate Incident    Ransomware    High    action=Remediate    additional_info=File decryption in progress

SQL Injection Incident
    Investigate And Remediate Incident    SQL Injection    Medium    action=Investigate    additional_info=Database logs show suspicious activity
    Investigate And Remediate Incident    SQL Injection    Medium    action=Remediate    additional_info=Patch applied to vulnerable code

Phishing Incident
    [Tags]    phishing
    Investigate And Remediate Incident    Phishing    Critical    action=Investigate    additional_info=Email with malicious attachment identified
    Investigate And Remediate Incident    Phishing    Critical    action=Remediate    additional_info=Email removed from user's inbox

*** Keywords ***
Investigate And Remediate Incident
    [Arguments]    ${type}    ${severity}    ${action}=Investigate    &{kwargs}
    Log    Select incident: ${type}
    Log    Incident severity: ${severity}
    Log    ${action} incident
    Log    Additional Info: ${kwargs.additional_info}
