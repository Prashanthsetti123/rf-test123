*** Settings ***
Library    SeleniumLibrary
Documentation    This is a test suite for demonstration purposes.

*** Variables ***
${url}    https://gemini.google.com/?hl=en-IN
${USERNAME}    settiprashanth@gmail.com        
${PASSWORD}    Prashanth@123 
# ${text}    hi


*** Test Cases ***
open browser and login
    Set Selenium Speed    0.4s
    open browser and use edge browser     ${url}
    Sleep    2s
    Wait Until Element Is Visible    xpath://button/span[contains(text(),"Sign in")]    10s
    Click Element    xpath://button/span[contains(text(),"Sign in")]
    Input Text    xpath://*[@id="identifierId"]    ${USERNAME}
    Click Element    xpath://button/span[contains(text(),"Next")]
    Wait Until Element Is Visible    xpath://*[@name="Passwd"]    10s
    Input Password    xpath://*[@name="Passwd"]    ${PASSWORD}
    Wait Until Element Is Visible    xpath://button/span[contains(text(),"Continue")]    15s
    Click Button    xpath://button/span[contains(text(),"Continue")]
        Wait Until Element Is Visible    xpath://button/span[contains(text(),"Continue")]    15s
    Click Button    xpath://button/span[contains(text(),"Continue")]
search for the text
    Input Text    xpath://input-area-v2    hello world
    Click Element    xpath://button[contains(@class,"send-button")]
*** Keywords ***
open browser and use edge browser     
    [Arguments]    ${url}  
    Open Browser    ${url}    chrome 
    Maximize Browser Window    