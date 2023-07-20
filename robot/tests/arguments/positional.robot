*** Settings ***
Documentation    This test suite demonstrates the usage of Positional Arguments in Robot Framework for security incident handling.

*** Test Cases ***
Credential Dump Incident
    Investigate And Remediate Incident    Credential Dump    High    Investigate
    Investigate And Remediate Incident    Credential Dump    High    Remediate

XSS Attack Incident
    Investigate And Remediate Incident    XSS Attack    Medium    Investigate
    Investigate And Remediate Incident    XSS Attack    Medium    Remediate

Account Takeover Incident
    Investigate And Remediate Incident    Account Takeover    Critical    Investigate
    Investigate And Remediate Incident    Account Takeover    Critical    Remediate

*** Keywords ***
Investigate And Remediate Incident
    [Arguments]    ${type}    ${severity}    ${action}
    Log    Select incident: ${type}
    Log    Incident severity: ${severity}
    Log    ${action} incident
