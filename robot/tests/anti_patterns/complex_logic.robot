*** Comments ***
According to the user guide, "complex use cases should be preferably implemented in test libraries":
https://robotframework.org/robotframework/latest/RobotFrameworkUserGuide.html#control-structures


*** Settings ***
Documentation       This test suite demonstrates the rule that complex logic should be moved to Python libraries
...                 in Robot Framework. It includes two test cases to compare two lists with some ignored indexes,
...                 one using a keyword within the test suite and another using a Python library function.

Library             Collections
Library             ../../resources/utils.py


*** Variables ***
@{LIST_1}               Phishing    Cryptomining    Ransomware    Data Leak
@{LIST_2}               Phishing    Malware    Ransomware    Privilage Abuse

@{IGNORED_FIELDS}       1    3


*** Test Cases ***
Compare lists using keyword
    Compare Lists With Ignored Indexes Keyword    ${LIST_1}    ${LIST_2}    ${IGNORED_FIELDS}

Compare lists using python lib
    Compare Lists With Ignored Indexes    ${LIST_1}    ${LIST_2}    ${IGNORED_FIELDS}


*** Keywords ***
Compare Lists With Ignored Indexes Keyword
    [Arguments]    ${list1}    ${list2}    ${ignored_indexes}
    ${list1_length}=    Get Length    ${list1}
    ${list2_length}=    Get Length    ${list2}

    Should Be Equal    ${list1_length}    ${list2_length}

    ${results}=    Create List

    FOR    ${index}    IN RANGE    0    ${list1_length}
        ${value1}=    Get From List    ${list1}    ${index}
        ${value2}=    Get From List    ${list2}    ${index}
        ${status}=    Run Keyword And Ignore Error    Should Be Equal    ${value1}    ${value2}
        Log    ${status}

        Append To List    ${results}    ${index} ${status}|||${value1}!=${value2}
    END

    Log Many    ${results}

    FOR    ${index}    IN RANGE    0    ${list1_length}
        IF    '${index}' in @{ignored_indexes}    CONTINUE
        ${value1}=    Get From List    ${list1}    ${index}
        ${value2}=    Get From List    ${list2}    ${index}
        Should Be Equal    ${value1}    ${value2}
    END
