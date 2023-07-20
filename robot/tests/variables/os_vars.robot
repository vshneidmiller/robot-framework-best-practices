*** Settings ***
Documentation       This test suite demonstrates the usage of operating-system-related built-in variables.
...                 It logs the values of various variables and performs simple file operations using them.
...                 The test case shows how to create a file using ${CURDIR} and ${/}
...                 https://robotframework.org/robotframework/latest/RobotFrameworkUserGuide.html#built-in-variables

Library             OperatingSystem


*** Test Cases ***
Log OS Built-in Variables
    [Documentation]    Logs the values of various operating-system-related built-in variables.
    # An absolute path to the directory where the test data file is located. This variable is case-sensitive.
    # /Users/<username>/PycharmProjects/robot-framework-best-practices/robot/tests/variables
    Log    The current directory is: ${CURDIR}

    # ${TEMPDIR} An absolute path to the system temporary directory.
    # In UNIX-like systems this is typically /tmp, and in Windows c:\Documents and Settings\<user>\Local Settings\Temp.
    # /var/folders/31/ngxmthlj72xbl0rwr_0td1d40000gn/T
    Log    The temporary directory is: ${TEMPDIR}

    # ${EXECDIR} An absolute path to the directory where test execution was started from.
    # /Users/<username>/PycharmProjects2/robot-framework-best-practices
    Log    The execution directory is: ${EXECDIR}

    # The system directory path separator. / in UNIX-like systems and \ in Windows.
    Log    The system directory path separator is: ${/}

    # The system path element separator. : in UNIX-like systems and ; in Windows.
    Log    The system path element separator is: ${:}

    # The system line separator. \n in UNIX-like systems and \r\n in Windows.
    Log    The system line separator is: ${\n}

Create Binary File
    [Documentation]    Creating a binary file in the current directory
    ${file_name}    Set Variable    test.txt
    ${expected_file_content}    Set Variable    Some text here${\n}on two lines
    Create File    ${TEMPDIR}${/}${file_name}    ${expected_file_content}
    ${actual_file_content}    Get File    ${TEMPDIR}${/}${file_name}
    Should Be Equal    ${actual_file_content}    ${expected_file_content}
