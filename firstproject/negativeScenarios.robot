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

*** Test Cases ***
User1 Login with valid credentials
    [Documentation]    Test case to login as User1 and create an asset.
    Open Browser    ${URL}    edge    
    Maximize Browser Window
    Input Text    xpath://input[@id="email"]    ${USERNAME}
    Input Text    xpath://input[@id="password"]    ${PASSWORD}
    Click Button    xpath://button[@type="submit"]
    Sleep    2s
    Capture Page Screenshot    validData.png
    Sleep    2s
    Click Link    Asset
    Sleep    2s
    Capture Page Screenshot    Assetpage.png
    Wait Until Element Is Visible    xpath=//table
    Sleep    5s  
    Capture Page Screenshot    Assetselection.png

User Login with valid username and invalid password
    [Documentation]    Test case to login as User1 and create an asset.
    Open Browser    ${URL}    edge    
    Maximize Browser Window
    Input Text    xpath://input[@id="email"]    settiprashanth@gmail.com
    Input Text    xpath://input[@id="password"]    123456
    Click Button    xpath://button[@type="submit"]
    Sleep    2s 
    Capture Page Screenshot    invalidPassword.png
   
User Login with invalid username and valid password
    [Documentation]    Test case to login as User1 and create an asset.
    Open Browser    ${URL}    edge    
    Maximize Browser Window
    Input Text    xpath://input[@id="email"]    setti@gmail.com
    Input Text    xpath://input[@id="password"]    123456789
    Click Button    xpath://button[@type="submit"]
    Sleep    2s
     Capture Page Screenshot    invalidUsername.png

User Login with invalid username and invalid password
    [Documentation]    Test case to login as User1 and create an asset.
    Open Browser    ${URL}    edge    
    Maximize Browser Window
    Input Text    xpath://input[@id="email"]    setti@gmail.com
    Input Text    xpath://input[@id="password"]    12345
    Click Button    xpath://button[@type="submit"]
    Sleep    2s
    Capture Page Screenshot    invalidUserNameAndPassword.png  

Form Submission with Empty Fields  

    Open Browser    ${URL}    edge    
    Maximize Browser Window
    Input Text    xpath://input[@id="email"]    ${USERNAME}
    Input Text    xpath://input[@id="password"]    ${PASSWORD}
    Click Button    xpath://button[@type="submit"]
    Sleep    2s
    Capture Page Screenshot    loginSuccessfull.png  
    Wait Until Element Is Enabled    xpath://*[@type="submit"]    timeout=10s
    Click Button    xpath://*[@type="submit"]
    sleep     2s
    Capture Page Screenshot    submitionfailure.png 



    


    