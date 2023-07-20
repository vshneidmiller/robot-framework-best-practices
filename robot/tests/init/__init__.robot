#https://robotframework.org/robotframework/latest/RobotFrameworkUserGuide.html#suite-initialization-files
*** Settings ***
Documentation    This is an example of a test suite initialization file (__init__.robot).
...              This file contains settings and configurations that apply to all the test cases
...              in this directory and its subdirectories.
...              Test case related settings are defined here, and can be overridden at a lower level.
...              Variables and keywords should be placed in separate resource files for sharing.

Suite Setup      My Suite Setup From Init
Suite Teardown   My Suite Teardown From Init

Test Tags       init_tag    ${SUITE_NAME}

Test Setup       Log    Test setup from __init__ file
Test Teardown    Log    Test teardown from __init__ file
Test Timeout     2 minutes

*** Keywords ***
My Suite Setup From Init
    [Documentation]    Keyword to set up the suite.
    Log    My Suite Setup From Init

My Suite Teardown From Init
    [Documentation]    Keyword to tear down the suite.
    Log    My Suite Teardown From Init
