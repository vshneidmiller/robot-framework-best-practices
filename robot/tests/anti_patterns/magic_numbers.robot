*** Settings ***
Documentation       In this test suite, magic numbers are used directly in the test case and keyword.
...                 This is an anti-pattern because it makes the test case less flexible and more difficult to maintain.
...                 Instead, you should use variables to store values and provide meaningful names for those variables.


*** Variables ***
${PHISHING_RISK_SCORE}      70
${MALWARE_RISK_SCORE}       85
${RANSOMWARE_RISK_SCORE}    90


*** Test Cases ***
Assess Risk (Magic Numbers Example)
    Assess Security Threat    Phishing    70
    Assess Security Threat    Malware    85
    Assess Security Threat    Ransomware    90

Assess Risk (Correct Way)
    Assess Security Threat    Phishing    ${PHISHING_RISK_SCORE}
    Assess Security Threat    Malware    ${MALWARE_RISK_SCORE}
    Assess Security Threat    Ransomware    ${RANSOMWARE_RISK_SCORE}


*** Keywords ***
Assess Security Threat
    [Documentation]    Assess the risk of a security threat given its type and risk score
    [Arguments]    ${threat_type}    ${risk_score}
    Log    The risk score for ${threat_type} is ${risk_score}
