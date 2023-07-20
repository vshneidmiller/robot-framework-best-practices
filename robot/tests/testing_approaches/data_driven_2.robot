*** Settings ***
Documentation       Example test cases using the data-driven testing approach.
...                 The _data-driven_ style works well when you need to repeat
...                 the same workflow multiple times.

Library             ../../resources/utils.py


*** Test Cases ***
Verify Password Strength
    [Template]    Verify Password Strength
    weak123    weak
    Password1    medium
    sUp3r$ecure    strong
    V3ry$tr0ngP@$$    very_strong
    thisisaverylongbutweakpassword    weak
    pa55w0rd123    medium
    SuperSecure123    medium
    STRONGPASSWORD123    medium
    !@#$%^&*()_+=-{}[]    strong
    12345!@#$%    medium


*** Keywords ***
Verify Password Strength
    [Documentation]    Verifies if the provided password's strength matches the expected strength.
    [Arguments]    ${password}    ${expected_strength}
    ${actual_strength}    Evaluate Password Strength    ${password}
    Should Be Equal    ${expected_strength}    ${actual_strength}
