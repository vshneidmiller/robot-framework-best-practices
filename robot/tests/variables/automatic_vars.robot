#https://robotframework.org/robotframework/latest/RobotFrameworkUserGuide.html#automatic-variables
*** Settings ***
Documentation    This test suite demonstrates how to log and use Robot Framework's automatic variables.
                 ...    Automatic variables provide information about the current test execution context,
                 ...    such as test and suite names, paths to output files, and the status of tests and keywords.
                 ...
                 ...    The test suite consists of one test case called "Log Automatic Variables" which logs
                 ...    the values of most automatic variables. Some of these variables are only available
                 ...    in specific contexts, such as test teardown and suite teardown. These variables are
                 ...    logged in separate keywords called "Log Test Teardown Variables" and
                 ...    "Log Suite Teardown Variables," which are executed during test and suite teardown, respectively.
                 ...
                 ...    Automatic variables used in this test suite:
                 ...
                 ...    - Test-related variables: ${TEST NAME}, @{TEST TAGS}, ${TEST DOCUMENTATION},
                 ...      ${TEST STATUS}, and ${TEST MESSAGE}.
                 ...    - Suite-related variables: ${SUITE NAME}, ${SUITE SOURCE}, ${SUITE DOCUMENTATION},
                 ...      &{SUITE METADATA}, ${SUITE STATUS}, and ${SUITE MESSAGE}.
                 ...    - Output-related variables: ${OUTPUT FILE}, ${LOG FILE}, ${REPORT FILE},
                 ...      ${DEBUG FILE}, and ${OUTPUT DIR}.
                 ...    - Miscellaneous variables: ${LOG LEVEL}, ${PREV_TEST_NAME}, ${PREV_TEST_STATUS},
                 ...      ${PREV_TEST_MESSAGE}, and &{OPTIONS}.
                 ...
                 ...    Note that some automatic variables will not have meaningful values in certain contexts.
                 ...    For example, ${TEST STATUS} and ${TEST MESSAGE} will only have relevant values
                 ...    during a test teardown.

Test Teardown    Log Test Teardown Variables
Suite Teardown   Log Suite Teardown Variables

*** Test Cases ***
Automatic Variables
    [Documentation]    Verifies the values of various automatic variables during test execution
    [Tags]   test_tag
    Should Be Equal    ${TEST NAME}     Automatic Variables
    Should Be Equal    ${SUITE NAME}    Tests.Variables.Automatic Vars
    Should Be Equal    ${TEST DOCUMENTATION}    Verifies the values of various automatic variables during test execution
    Should Be Equal    @{TEST TAGS}    test_tag
    Log    The suite source is: ${SUITE SOURCE}
    Log    The suite documentation is: ${SUITE DOCUMENTATION}
    Log    The log level is: ${LOG LEVEL}
    Log    The output file path is: ${OUTPUT FILE}
    Log    The output directory is: ${OUTPUT DIR}
    Log    The command line options are: &{OPTIONS}
    Log    The log file path is: ${LOG FILE}
    Log    The report file path is: ${REPORT FILE}
    Log    The previous test name: ${PREV TEST NAME}
    Log    The previous test status: ${PREV_TEST_STATUS}
    Log    The previous test message: ${PREV_TEST_MESSAGE}
    Should Be Equal    ${DEBUG FILE}    NONE
    Keyword with teardown

    # Log    The current test status is: ${TEST STATUS}    Variable '${TEST STATUS}' not found. Did you mean:#    ${PREV_TEST_STATUS}
    # Log    The current test message is: ${TEST MESSAGE}    	Variable '${TEST MESSAGE}' not found. Did you mean:#    ${PREV_TEST_MESSAGE}
    # Log    The suite status is: ${SUITE STATUS}    #Variable '${SUITE STATUS}' not found.
    # Log    The suite message is: ${SUITE_MESSAGE}    #Variable '${SUITE_MESSAGE}' not found.

Automatic variables for previous test
    Log    The previous test name is: ${PREV TEST NAME}
    Log    The previous test status is: ${PREV_TEST_STATUS}
    Log    The previous test message is: ${PREV_TEST_MESSAGE}

*** Keywords ***
Log Test Teardown Variables
    [Documentation]    Log test teardown-specific automatic variables.
    Log    The current test status is: ${TEST STATUS}
    Log    The current test message is: ${TEST MESSAGE}
    Log    The current test documentation is: ${TEST DOCUMENTATION}
    Log    The current test tags are: @{TEST TAGS}

Log Suite Teardown Variables
    [Documentation]    Log suite teardown-specific automatic variables.
    Log    The suite status is: ${SUITE STATUS}
    Log    The suite message is: ${SUITE_MESSAGE}

Keyword with teardown
    Log    ${TEST_NAME}
    [Teardown]    Log    The current keyword status and message: ${KEYWORD_STATUS}, ${KEYWORD_MESSAGE}
