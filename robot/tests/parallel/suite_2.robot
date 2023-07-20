*** Settings ***
Documentation       A test suite demonstrating parallel execution of test cases.
...                 Test cases in this suite contain sleep commands simulating test execution time.
...                 When running this suite in parallel, the overall execution time will be reduced.
...                 To achieve parallel execution, use the 'pabot' tool.
...                 Example commands for parallel execution:
...                 pabot --processes <number_of_processes> <path_to_test_suite>


*** Test Cases ***
Test 1
    Sleep    1s

Test 2
    Sleep    1s

Test 3
    Sleep    1s

Test 4
    Sleep    1s

Test 5
    Sleep    1s
