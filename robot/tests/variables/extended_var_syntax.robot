*** Settings ***
Documentation       This test suite demonstrates the Extended Variable Syntax feature in Robot Framework.
...                 It allows you to call a built-in Python methods or access an attribute of a variable.
...                 It shows how to use the special syntax with different types of variables,
...                 including strings, lists, and dictionaries.
...                 https://robotframework.org/robotframework/latest/RobotFrameworkUserGuide.html#extended-variable-syntax

Library             Collections
Library             String


*** Variables ***
${GREETING}     Hello, World!
@{THREATS}      Phishing    Malware    Ransomware
&{PERSON}       name=John    age=25    country=USA


*** Test Cases ***
Extended Variable Syntax For String
    Should Be Equal    ${greeting.lower()}    hello, world!
    Should Be Equal    ${greeting.upper()}    HELLO, WORLD!
    Should Be Equal    ${greeting * 2}    Hello, World!Hello, World!
    Should Be Equal    ${greeting.replace('World', 'Space')}    Hello, Space!
    Should Be Equal    ${greeting.split(', ')[-1]}    World!
    Should Be Equal    ${greeting.strip('!')}    Hello, World
    Should Be Equal    ${greeting.lstrip('Hello, ')}    World!
    Should Be Equal    ${greeting.swapcase()}    hELLO, wOrld!

    Should Be Equal As Strings    ${greeting.startswith('Hello')}    True
    Should Be Equal As Strings    ${greeting.endswith('World!')}    True
    Should Be Equal As Integers    ${greeting.count('l')}    2
    Should Be Equal As Integers    ${greeting.find('beam')}    10

Extended Variable Syntax For List
    Should Be Equal    ${threats[0]}    Phishing
    Should Be Equal As Integers    ${threats.index('Malware')}    1
    Should Be Equal As Integers    ${threats.count('Ransomware')}    1

Extended Variable Syntax For Dictionary
    Should Be Equal    ${PERSON.name}    John
    Should Be Equal    ${PERSON.name.upper()}    JOHN
    Should Be Equal    ${PERSON.country.lower()}    usa
    Should Be Equal As Strings    ${PERSON.keys()}    odict_keys(['name', 'age', 'country'])
    Should Be Equal As Strings    ${PERSON.values()}    odict_values(['John', '25', 'USA'])
    Should Be Equal As Strings    ${PERSON.name.startswith('J')}    True
    Should Be Equal As Strings    ${PERSON.country.endswith('A')}    True
