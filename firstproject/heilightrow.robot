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
${BGCOLOR}    yellow


*** Variables ***
${URL}            http://example.com
${USERNAME}       your_username
${PASSWORD}       your_password
${ASSET_LINK}     Asset
${HIGHLIGHT_COLOR}     yellow

*** Test Cases ***
User1 Login With Valid Credentials
    [Documentation]    Test case to login as User1 and create an asset.
    Open Browser    ${URL}    edge
    Maximize Browser Window
    Input Text    xpath=//input[@id="email"]    ${USERNAME}
    Input Text    xpath=//input[@id="password"]    ${PASSWORD}
    Click Button    xpath=//button[@type="submit"]
    Sleep    2s
    Capture Page Screenshot    validData.png
    Sleep    2s
    Click Link    ${ASSET_LINK}
    Sleep    2s
    Capture Page Screenshot    Assetpage.png
    # Wait Until Element Is Visible    xpath=//table
    # Ensure the table and rows are fully loaded
    Sleep    5s  
    # ${row}=    Get WebElement    xpath=//table//tr[2]//td[1]
    # # Ensure the WebElement is correctly retrieved
    # Run Keyword If    '${row}' == ''    Fail    Element not found or WebElement retrieval failed
    # Execute JavaScript    arguments[0].style.backgroundColor = '${HIGHLIGHT_COLOR}'    ${row}
    # Capture Page Screenshot    Assetselection.png
    
    # Close Browser
search for the Asset
    Input Text    xpath://*[@placeholder="Search by status"]    Pending
    Click Element    xpath://*[@type="button"]
    


