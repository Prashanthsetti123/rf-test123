*** Settings ***
Library    SeleniumLibrary
Documentation    This is a test suite for demonstration purposes.
Suite Setup      Log    Suite setup
Suite Teardown   Log    Suite teardown

*** Variables ***
${USERNAME}      settiprashanth@gmail.com    
${PASSWORD}      123456789

*** Test Cases ***
Valid Login Test
    [Documentation]    A test case to verify valid login functionality
    [Tags]             login
    Open Browser To Login Page
    Input Credentials  ${USERNAME}  ${PASSWORD}
    Click Login
   
    
Create Asset
    Wait Until Element Is Enabled    timeout=5s    locator=xpath//*[@id="assetType"]
    Click Element    xpath://*[@id="assetType"]

    Wait Until Element Is Enabled    timeout=5s    locator=xpath://*[@id="Quantity"]
    Input Text    xpath://*[@id="Quantity"]    10

*** Keywords ***
Open Browser To Login Page
    Open Browser    http://35.154.145.139/login    edge

Input Credentials
    [Arguments]    ${username}      ${password}
    Input Text     id:email       ${username}
    Input Text     id:password       ${password}

Click Login
    Click Button   xpath://*[@type="submit"]
