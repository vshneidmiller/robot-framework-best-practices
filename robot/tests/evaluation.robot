*** Settings ***
Documentation       This test suite demonstrates the usage of the Evaluate keyword in Robot Framework.
...                 The test cases in this suite showcase various examples of using the Evaluate keyword.
...                 The Evaluate keyword allows you to run Python expressions directly in your test cases,
...                 enabling you to use Python functionality that is not available through built-in Robot Framework keywords.


*** Test Cases ***
Arithmetic Operations
    ${sum}=    Evaluate    10 + 5
    ${difference}=    Evaluate    10 - 5
    ${product}=    Evaluate    10 * 5
    ${quotient}=    Evaluate    10 / 5
    Log    Sum: ${sum}, Difference: ${difference}, Product: ${product}, Quotient: ${quotient}

String Manipulations
    ${input_string}=    Set Variable    Robot Framework
    ${lower_case}=    Evaluate    '${input_string}'.lower()
    ${upper_case}=    Evaluate    '${input_string}'.upper()
    ${reversed_string}=    Evaluate    '${input_string}'[::-1]
    Log    Lower case: ${lower_case}, Upper case: ${upper_case}, Reversed string: ${reversed_string}

Python Built-In Functions
    ${input_list}=    Create List    5    2    8    1
    ${sorted_list}=    Evaluate    sorted(${input_list})
    ${max_value}=    Evaluate    max(${input_list})
    ${min_value}=    Evaluate    min(${input_list})
    Log    Sorted list: ${sorted_list}, Max value: ${max_value}, Min value: ${min_value}

Import and Use Python Libraries
    ${random_integer}=    Evaluate    (__import__('random').randint)(1, 100)
    Log    Random integer between 1 and 100: ${random_integer}
