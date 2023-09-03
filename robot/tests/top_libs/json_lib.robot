*** Comments ***
This is a very simple example of using Robot Framework JSON library to create, update, parse, validate a JSON and extract the values from it.


*** Settings ***
Library     JSONLibrary
Library     OperatingSystem
Library     Collections
Resource    ../variables/automatic_vars.robot


*** Test Cases ***
Create JSON file
    ${education}=    Create Dictionary
    ...    school=University of California, Berkeley
    ...    degree=BS
    ...    major=Electrical Engineering and Computer Science
    ${obj}=    Create Dictionary    name=John    age=30    education=${education}
    Dump Json To File    ${EXECDIR}/example_create.json    ${obj}

 Add object to JSON
    ${education}=    Create Dictionary
    ...    school=University of California, Berkeley
    ...    degree=BS
    ...    major=Electrical Engineering and Computer Science
    ${obj}=    Create Dictionary    name=John    age=30    education=${education}
    Dump Json To File    ${EXECDIR}/example_update.json    ${obj}

    ${new_education}=    Create Dictionary    course=Udemy
    ${json_obj}=    Load Json From File    file_name=${EXECDIR}/example_update.json
    ${json_with_new_edu}=    Add Object To Json    ${json_obj}    $..education    ${new_education}
    Log    message=${json_with_new_edu}

Update JSON
    ${education}=    Create Dictionary
    ...    school=University of California, Berkeley
    ...    degree=BS
    ...    major=Electrical Engineering and Computer Science
    ${obj}=    Create Dictionary    name=John    age=30    education=${education}
    Dump Json To File    ${EXECDIR}/example_update.json    ${obj}
    ${json_obj}=    Load Json From File    ${EXECDIR}/example_update.json
    ${new_json_obj}=    Update Value To Json    ${json_obj}    $.name    James
    Log    ${new_json_obj}

Delete object from JSON
    ${education}=    Create Dictionary
    ...    school=University of California, Berkeley
    ...    degree=BS
    ...    major=Electrical Engineering and Computer Science
    ${obj}=    Create Dictionary    name=John    age=30    education=${education}
    Dump Json To File    ${EXECDIR}/example_update.json    ${obj}
    ${json_obj}=    Load Json From File    ${EXECDIR}/example_update.json

    ${json_without_education}=    Delete Object From Json    ${json_obj}    $.education
    Log    message=${json_without_education}

JSON should have values
    ${education}=    Create Dictionary
    ...    school=University of California, Berkeley
    ...    degree=BS
    ...    major=Electrical Engineering and Computer Science
    ${obj}=    Create Dictionary    name=John    age=30    education=${education}
    Dump Json To File    ${EXECDIR}/example_should_have.json    ${obj}
    ${json_obj}=    Load Json From File    ${EXECDIR}/example_should_have.json
    Should Have Value In Json    ${json_obj}    $.name
    Should Not Have Value In Json    ${json_obj}    $.lastName

JSON schema validation
    ${education}=    Create Dictionary
    ...    school=University of California, Berkeley
    ...    degree=BS
    ...    major=Electrical Engineering and Computer Science
    ${obj}=    Create Dictionary    name=John    age=30    education=${education}
    Dump Json To File    ${EXECDIR}/example_should_have.json    ${obj}
    ${json_obj}=    Load Json From File    ${EXECDIR}/example_should_have.json

    Validate Json By Schema File    ${json_obj}    ${EXECDIR}/robot/resources/schemas/schema.json

    ${schema}=    Load Json From File    file_name=${EXECDIR}/robot/resources/schemas/schema.json
    Validate Json By Schema    ${json_obj}    ${schema}


Convert JSON to string and vice versa
    ${json_str}=    Set Variable    {"name": "John", "age": 30}
    ${json}=    Convert Json To String    json_object=${json_str}
    Log    ${json}
    ${new_json_str}=    Convert String To Json    json_string=${json}
    Log    message=${new_json_str}
    Should Be Equal As Strings    ${json_str}    ${new_json_str}


Get Value from JSON
    ${json_str}=    Set Variable    {"name": "John", "age": 30}
    ${json}=    Convert Json To String    json_object=${json_str}
    ${value}=    Get Value From Json    ${json}    $.name
    Log    ${value}