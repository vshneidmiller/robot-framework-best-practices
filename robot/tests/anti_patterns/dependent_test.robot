*** Comments ***
https://github.com/robotframework/HowToWriteGoodTestCases/blob/master/HowToWriteGoodTestCases.rst#id21

Tests should be independent.
Sometimes dependencies between tests cannot be avoided.
For example, it can take too much time to initialize all tests separately.
Never have long chains of dependent tests.
Consider verifying the status of the previous test using the built-in ${PREV TEST STATUS} variable.


*** Settings ***
Library             SeleniumLibrary
Resource            ../../resources/ui/common.resource
Resource            ../../resources/ui/pages/main_exabeam_page.resource
Resource            ../../resources/ui/pages/why_exabeam_page.resource

Suite Setup         Open Main Page
Suite Teardown      Close All Browsers


*** Variables ***
${GET_DEMO_URL}     ${BASE_URL}/contact/get-a-demo/


*** Test Cases ***
Open 'Why Exabeam' Page From Main
    Go To The Main Page
    Click Element    ${MAIN_MENU_WHY_EXABEAM}
    Page Should Contain Element    ${GET_DEMO_BUTTON}

Get Demo Button Leads To Get Demo Page
    [Tags]    exclude
    Click Element    ${GET_DEMO_BUTTON}
    Location Should Be    ${GET_DEMO_URL}
