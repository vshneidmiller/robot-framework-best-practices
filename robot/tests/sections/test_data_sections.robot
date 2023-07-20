*** Comments ***
https://robotframework.org/robotframework/latest/RobotFrameworkUserGuide.html#test-data-sections

*** Settings ***
Documentation       This test suite demonstrates the usage of all the test data sections in Robot Framework.
...                 The test suite contains a single test case that utilizes a custom keyword.
...                 Sections:
...                 - Comments: Additional comments or data. Ignored by Robot Framework.
...                 - Settings:
...                 1) Importing test libraries, resource files and variable files.
...                 2) Defining metadata for test suites and test cases.
...                 - Variables: Defining variables that can be used elsewhere in the test data.
...                 - Test Cases: Creating test cases from available keywords
...                 - Tasks: Creating tasks using available keywords. Single file can only contain either tests or tasks
...                 - Keywords: Creating user keywords from existing lower-level keywords


*** Variables ***
${USER_NAME}            John
${USER_LAST_NAME}       Smith

# *** Tasks ****


*** Test Cases ***
Log Username
    ${full_name}    Get Full Name    ${USER_NAME}    ${USER_LAST_NAME}
    Log    ${full_name}


*** Keywords ***
Get Full Name
    [Documentation]    This keyword concatenates the given user's first name and last name
    ...    and returns the full name as a single string.
    [Arguments]    ${USER_NAME}    ${USER_LAST_NAME}
    RETURN    ${USER_NAME} ${USER_LAST_NAME}
