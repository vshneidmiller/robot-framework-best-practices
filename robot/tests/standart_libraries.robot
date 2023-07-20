*** Settings ***
Documentation       This test suite demonstrates the usage of the standard libraries in Robot Framework
...                 The test cases in this suite showcase a simple example for each library.
...                 more info: https://robotframework.org/robotframework/latest/RobotFrameworkUserGuide.html#standard-libraries

Library             Collections
Library             DateTime
Library             OperatingSystem
Library             Process
Library             Screenshot
Library             String
Library             Telnet
Library             XML


*** Test Cases ***
Collections Test
    ${my_list}=    Create List    apple    banana    orange
    ${length}=    Get Length    ${my_list}
    Should Be Equal As Integers    ${length}    3

DateTime Test
    ${current_date}=    Get Current Date    result_format=datetime
    Log    Current date: ${current_date}

OperatingSystem Test
    Create File    example.txt    This is an example file.
    File Should Exist    example.txt
    Remove File    example.txt

Process Test
    ${result}=    Run    echo "Hello, Robot Framework!"
    Log    ${result}

Screenshot Test
    [Tags]    exclude
    Take Screenshot

String Test
    ${text}=    Set Variable    Robot Framework is great!
    ${upper_string_text}=    Convert To Upper Case    ${text}
    Log    Upper string text: ${upper_string_text}

Telnet Test
    [Tags]    exclude
    # Replace 'your-telnet-server.com' and 'your-port' with actual Telnet server and port
    Open Connection    your-telnet-server.com    port=your-port
    Login    username    password
    ${result}=    Execute Command    echo "Hello, Telnet!"
    Log    ${result}
    Close Connection

XML Test
    ${xml}=    Set Variable    <root><element>Hello, XML!</element></root>
    ${content}=    Get Element Text    ${xml}    xpath=element
    Log    ${content}
