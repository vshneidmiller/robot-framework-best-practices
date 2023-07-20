*** Settings ***
Documentation       Example test cases using the keyword-driven testing approach.
...
...                 All tests contain a workflow constructed from keywords.
...                 Creating new tests or editing
...                 existing is easy even for people without programming skills.
...
...                 The _keyword-driven_ appoach works well for normal test
...                 automation, but the _gherkin_ style might be even better
...                 if also business people need to understand tests. If the
...                 same workflow needs to repeated multiple times, it is best
...                 to use to the _data-driven_ approach.

Library             ../../resources/utils.py


*** Test Cases ***
Verify Password Strength
    Verify Password Strength    weak123    weak
    Verify Password Strength    Password1    medium
    Verify Password Strength    sUp3r$ecure    strong
    Verify Password Strength    V3ry$tr0ngP@$$    very_strong
    Verify Password Strength    thisisaverylongbutweakpassword    weak
    Verify Password Strength    pa55w0rd123    medium
    Verify Password Strength    SuperSecure123    medium
    Verify Password Strength    STRONGPASSWORD123    medium
    Verify Password Strength    !@#$%^&*()_+=-{}[]    strong
    Verify Password Strength    12345!@#$%    medium


*** Keywords ***
Verify Password Strength
    [Documentation]    Verifies if the provided password's strength matches the expected strength
    [Arguments]    ${password}    ${expected_strength}
    ${actual_strength}    Evaluate Password Strength    ${password}
    Should Be Equal    ${expected_strength}    ${actual_strength}
