*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${CHROME_DRIVER_PATH}    C:/Users/tai-0/Downloads/chromedriver-win64/chromedriver-win64/chromedriver.exe
${URL}    http://35.154.145.139/login
${USERNAME}    settiprashanth@gmail.com
${PASSWORD}    123456789
${ASSET_QUANTITY}    17
${ASSET_PRICE}    170000
${PDF_FILE_PATH}    C:/Users/tai-0/Downloads/dummy.pdf

*** Test Cases ***
User1 Login And Create Asset
    [Documentation]    Test case to login as User1 and create an asset.
    Open Browser    ${URL}    edge    
    Maximize Browser Window
    Input Text    xpath://input[@id="email"]    ${USERNAME}
    Input Text    xpath://input[@id="password"]    ${PASSWORD}
    Click Button    xpath://button[@type="submit"]
    Sleep    1s
    Click Element    xpath://input[@id="assetType"]
    Sleep    0.5s
    Click Element    xpath://*[text()="Laptop"]
    Input Text    xpath://*[@id="Quantity"]    ${ASSET_QUANTITY}
    Input Text    xpath://*[@id="unitPrice"]    ${ASSET_PRICE}
    Choose File    xpath://*[@type="file"]    ${PDF_FILE_PATH}

    Wait Until Element Is Enabled    xpath://*[@type="submit"]    timeout=10s
    Click Button    xpath://*[@type="submit"]


    