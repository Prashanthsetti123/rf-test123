*** Settings ***
Library    SeleniumLibrary
Documentation    This is a test suite for demonstration purposes.

*** Variables ***
${url}    https://demoqa.com/browser-windows

*** Test Cases ***
switch window
    Open Browser    ${url}    edge
    Set Selenium Speed    0.4

    Maximize Browser Window
    Click Element    xpath://*[@id="tabButton"]
    ${Handles}=    Get Window Handles
    Switch Window    ${Handles}[0]
    ${title}=    Get Title
    Log To Console    ${title}


    # /* login and enter credentials for chatgpt
#     Set Selenium Speed     2

#     Open Browser    ${url}    edge
#     # Sleep    10seconds
#     Maximize Browser Window
#     Wait Until Element Is Visible    xpath://*[text()="Log in"]    10seconds
#     Click Element    xpath://*[text()="Log in"]
#     # Click Element     xpath://button[@data-testid="welcome-login-button"]
#     Wait Until Element Is Visible    xpath://*[@id="email-input"]   10    
#     Input Text  xpath://*[@id="email-input"]     settiprashanth22@gmail.com
#     Click Element    xpath://*[text()="Continue"]
#     Wait Until Element Is Visible    xpath://*[@id="password"]    10seconds
#     Input Password    xpath://*[@id="password"]    Prashanth@12345
#     Click Element    xpath://*[@data-action="toggle"]
#     Click Element    xpath://*[@name="action"]
#     Wait Until Element Is Visible    xpath://*[@id="prompt-textarea"]    15seconds
#     Input Text    xpath://*[@id="prompt-textarea"]    what is the weather in hyderabad?    
#     Wait Until Element Is Visible    xpath://*[@data-testid="send-button"]    10seconds
#     Click Element    xpath://*[@data-testid=
# "send-button"]
 
    # Execute JavaScript    window.scrollTo(0, document.body.scrollHeight)
    # Sleep    3seconds
    # Capture Page Screenshot    report2.png
    # # Execute JavaScript    window.scrollTo(0, -document.body.scrollHeight)
    # Sleep    2seconds
    # Press Keys    xpath=//body    PAGE_DOWN
    # searching another text
    # search for anything    what is the meaning of prashanth
    # # take screenshot
    # Take screenshot    prashanthimage