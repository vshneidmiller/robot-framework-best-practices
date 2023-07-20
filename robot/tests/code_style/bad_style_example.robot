*** Settings ***
Documentation  This test suite demonstrates bad indentations and formatting issues. Also it has long documentation without text wrapping

Library  Collections

*** Variables ***
${malware}  WannaCry
${phishing}  Spear Phishing

*** Test Cases ***
Check Malware
  Log  Checking Malware: ${malware}
  Log  Malware found: ${malware}

Phishing Attack Detection
  Log  Checking Phishing: ${phishing}
  Log  Phishing found: ${phishing}

*** Keywords ***
Check Malware
  Log  Checking malware
  Log  Malware found

Check Phishing
  Log  Checking phishing
  Log  Phishing found