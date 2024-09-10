*** Settings ***
Library           JSONLibrary
Library           Collections

*** Variables ***
${JSON_FILE1}     data11.json
${JSON_FILE2}     data12.json

*** Test Cases ***
Compare JSON Files
    ${json1}=    Load JSON From File    ${JSON_FILE1}
    ${json2}=    Load JSON From File    ${JSON_FILE2}

    # Convert the JSON to dictionaries if needed
    ${dict1}=    Convert To Dictionary    ${json1}
    ${dict2}=    Convert To Dictionary    ${json2}

    # Compare the JSON structures
    Dictionaries Should Be Equal    ${dict1}    ${dict2}
