*** Settings ***
Documentation       In the test suite, the username and password are hardcoded directly into the test case.
...                 This is an anti-pattern because it makes the test case less flexible and more difficult to maintain.
...                 It also exposes sensitive information like passwords directly in the test case.
...                 Instead, you should use variables to store test data
...                 and keep sensitive information in separate configuration files.

Variables           ../../config/config.py


*** Variables ***
${SUITE_USER}           john_doe@example.com
${SUITE_PASSWORD}       mySuperSecretPassword


*** Test Cases ***
Hardcoded Test Data Example (bad)
    Log In    john_doe@example.com    mySuperSecretPassword

Test data is stored in suite variables (not so bad)
    Log In    ${SUITE_USER}    ${SUITE_PASSWORD}

Variables are stored in the global config (good)
    Log In    ${GLOBAL_USER}    ${GLOBAL_PASSWORD}


*** Keywords ***
Log In
    [Documentation]    User logs in to the system with username and password
    [Arguments]    ${user_name}    ${password}
    Log    Logging in with the following credentials:
    Log    User: ${user_name}
    Log    Password: ${password}
