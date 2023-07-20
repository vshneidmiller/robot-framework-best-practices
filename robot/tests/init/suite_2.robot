*** Settings ***
Suite Setup         Log    I am a Suite Setup
Suite Teardown      Log    I am a Suite Teardown


*** Test Cases ***
Test1
    Log    ${TEST_NAME}

Test2
    Log    ${TEST_NAME}
