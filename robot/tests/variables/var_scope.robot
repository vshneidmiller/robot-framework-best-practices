*** Settings ***
Documentation       This test suite demonstrates the different variable scopes in Robot Framework,
...                 including global, suite, test, and local scopes.
...                 https://robotframework.org/robotframework/latest/RobotFrameworkUserGuide.html#variable-scopes

Library             OperatingSystem
Variables           ../../resources/global_variables.py

Suite Setup         Initialize Suite Variable
Test Setup          Initialize Test Variable


*** Variables ***
${SUITE_VAR_FROM_VARIABLES_SECTION}    Suite Scope Variable From Varables Section


*** Test Cases ***
Global, Suite, Test Variables Are Initialized
    Should Be Equal    ${GLOBAL_VAR}    Global Scope Variable
    Should Be Equal    ${SUITE_VAR}    Suite Scope Variable from Suite Setup
    Should Be Equal    ${SUITE_VAR_FROM_VARIABLES_SECTION}    Suite Scope Variable From Varables Section
    Should Be Equal    ${TEST_VAR}    Test Scope Variable from Suite Setup

    Variable Should Not Exist    ${test_var_2}
    Variable Should Not Exist    ${SUITE_VAR_2}

Set Test And New Suite Variable
    Set Test Variable    ${test_var_2}    Test Scope Variable
    Set Suite Variable    ${SUITE_VAR_2}    Suite Scope Variable

    Should Be Equal    ${GLOBAL_VAR}    Global Scope Variable
    Should Be Equal    ${SUITE_VAR}    Suite Scope Variable from Suite Setup
    Should Be Equal    ${SUITE_VAR_2}    Suite Scope Variable
    Should Be Equal    ${test_var}    Test Scope Variable from Suite Setup
    Should Be Equal    ${test_var_2}    Test Scope Variable

Test Variable From Previous Test Is Not Initialized
    Variable Should Not Exist    ${test_var_2}

    Should Be Equal    ${GLOBAL_VAR}    Global Scope Variable
    Should Be Equal    ${SUITE_VAR}    Suite Scope Variable from Suite Setup
    Should Be Equal    ${SUITE_VAR_2}    Suite Scope Variable
    Should Be Equal    ${test_var}    Test Scope Variable from Suite Setup

Local Variable
    Initialize Local Variable
    Variable Should Not Exist    ${local_var}

    Should Be Equal    ${GLOBAL_VAR}    Global Scope Variable
    Should Be Equal    ${SUITE_VAR}    Suite Scope Variable from Suite Setup
    Should Be Equal    ${SUITE_VAR_2}    Suite Scope Variable
    Should Be Equal    ${TEST_VAR}    Test Scope Variable from Suite Setup
    Variable Should Not Exist    ${test_var_2}

Global Variable Is Not Initialized Without Import
    Variable Should Not Exist    ${BASE_URL}


*** Keywords ***
Initialize Suite Variable
    Set Suite Variable    ${SUITE_VAR}    Suite Scope Variable from Suite Setup

Initialize Test Variable
    Set Test Variable    ${TEST_VAR}    Test Scope Variable from Suite Setup

Initialize Local Variable
    ${local_var}    Set Variable    Local Scope Variable
    Should Be Equal As Strings    ${local_var}    Local Scope Variable
