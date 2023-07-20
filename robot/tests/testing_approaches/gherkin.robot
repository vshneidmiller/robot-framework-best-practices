*** Settings ***
Documentation     Example test case using the gherkin syntax.
...
...               This test has a workflow similar to the keyword-driven
...               examples. The difference is that their arguments are embedded into
...               the keyword names.
...
...               This kind of _gherkin_ syntax has been made popular by
...               [http://cukes.info|Cucumber]. It works well especially when
...               tests act as examples that need to be easily understood also
...               by the business people.
Library    ../../resources/utils.py

*** Test Cases ***
Different types of passwords are evaluated
    Given I have a password "weak123"
    When I evaluate the password strength
    Then the password strength should be "weak"

    Given I have a password "Password1"
    When I evaluate the password strength
    Then the password strength should be "medium"

    Given I have a password "sUp3r$ecure"
    When I evaluate the password strength
    Then the password strength should be "strong"

    Given I have a password "V3ry$tr0ngP@$$"
    When I evaluate the password strength
    Then the password strength should be "very_strong"

    Given I have a password "thisisaverylongbutweakpassword"
    When I evaluate the password strength
    Then the password strength should be "weak"

    Given I have a password "pa55w0rd123"
    When I evaluate the password strength
    Then the password strength should be "medium"

    Given I have a password "SuperSecure123"
    When I evaluate the password strength
    Then the password strength should be "medium"

    Given I have a password "STRONGPASSWORD123"
    When I evaluate the password strength
    Then the password strength should be "medium"

    Given I have a password "!@#$%^&*()_+=-{}[]"
    When I evaluate the password strength
    Then the password strength should be "strong"

    Given I have a password "12345!@#$%"
    When I evaluate the password strength
    Then the password strength should be "medium"

*** Keywords ***
I have a password "${password}"
    Set Test Variable    ${password}

I evaluate the password strength
    ${actual_strength}    Evaluate Password Strength    ${password}
    Set Test Variable    ${actual_strength}

the password strength should be "${expected_strength}"
    Should Be Equal    ${expected_strength}    ${actual_strength}
