*** Settings ***
Documentation    This test suite demonstrates the usage of Named Arguments in Robot Framework for security incident handling.

*** Test Cases ***
DDoS Incident
    Investigate Incident    type=DDoS
    Remediate Incident    type=DDoS

Brute Force Attack Incident
    Investigate Incident    type=Brute Force Attack
    Remediate Incident    type=Brute Force Attack

Insider Threat Incident
    Investigate Incident    type=Insider Threat
    Remediate Incident    type=Insider Threat

*** Keywords ***
Investigate Incident
    [Arguments]    ${type}
    Log    Select incident: ${type}
    Log    Investigate incident

Remediate Incident
    [Arguments]    ${type}
    Log    Select incident: ${type}
    Log    Remediate incident
