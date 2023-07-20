*** Settings ***
Documentation       This is a test suite demonstrating the usage of tags in Robot Framework.
...                 for more details: https://robotframework.org/robotframework/latest/RobotFrameworkUserGuide.html#tagging-test-cases

Test Tags           regression    smoke
# Force Tags    forced_tag    # still work, but they are considered deprecated
# Default Tags    default_tag    # still work, but they are considered deprecated


*** Variables ***
${HOST}     10.0.1.42


*** Test Cases ***
No own tags
    [Documentation]    This test has tags 'regression' and 'smoke'.
    Log    ${TEST_TAGS}

Own tags
    [Documentation]    This test has tags 'regression', 'smoke' and 'milestone-42'.
    [Tags]    milestone-42
    Log    ${TEST_TAGS}

Own tags with variable
    [Documentation]    This test has tags 'regression', 'smoke' and 'host: 10.0.1.42'.
    [Tags]    host: ${host}
    Log    ${TEST_TAGS}

Set Tags and Remove Tags keywords
    [Documentation]    This test has tags 'example' and 'another'.
    Set Tags    example    another
    Remove Tags    regression    smoke
    Log    ${TEST_TAGS}
