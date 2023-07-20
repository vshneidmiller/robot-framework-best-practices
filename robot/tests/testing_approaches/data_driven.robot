*** Settings ***
Documentation       Example test cases using the data-driven testing approach.
...                 The _data-driven_ style works well when you need to repeat
...                 the same workflow multiple times.

Library             ../../resources/utils.py

Test Template       Verify Password Strength


| *** Test Cases ***             | password                       | expected_strength |
| Short                          | weak123                        | weak              |
| Mixed cases                    | Password1                      | medium            |
| Special characters             | sUp3r$ecure                    | strong            |
| Very strong                    | V3ry$tr0ngP@$$                 | very_strong       |
| Long and simple                | thisisaverylongbutweakpassword | weak              |
| Mixed with numbers             | pa55w0rd123                    | medium            |
| No special characters          | SuperSecure123                 | medium            |
| All uppercase                  | STRONGPASSWORD123              | medium            |
| All special characters         | !@#$%^&*()_+=-{}[]             | strong            |
| Numbers and special characters | 12345!@#$%                     | medium            |


*** Keywords ***
Verify Password Strength
    [Documentation]    Verifies if the provided password's strength matches the expected strength
    [Arguments]    ${password}    ${expected_strength}
    ${actual_strength}    Evaluate Password Strength    ${password}
    Should Be Equal    ${expected_strength}    ${actual_strength}
