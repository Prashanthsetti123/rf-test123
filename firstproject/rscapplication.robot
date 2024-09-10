*** Settings ***
Library           SeleniumLibrary
Suite Setup    suite setup
Library    4tabkeywords.py


*** Variables ***
${LOGIN_URL}      https://eudev2.jnjux.com/launchpad/RSC_PLATFORM
${VALID_USERNAME}    akumarg5    
${VALID_PASSWORD}    MYjnj@1427
${INVALID_USERNAME}  invalid_username
${INVALID_PASSWORD}  invalid_password

*** Test Cases ***
# Scenario 1: Successful Login with "Remember Me" Checkbox Checked
Login With Remember Me Checked
    [Documentation]    Verify that the user can log in successfully when the "Remember Me" checkbox is checked.
    Open Browser And Navigate To Login Page
    Set Selenium Speed    0.2
    Capture Page Screenshot    take.png
    Enter Username    ${VALID_USERNAME}
    Enter Password    ${VALID_PASSWORD}
    Press Tab three Times and Then Press Space
    Capture Page Screenshot    take.png
    Click Login Button
    Sleep    3s
    Wait Until Element Is Visible    xpath://*[text()="Kumar g, Anil"]    5seconds
    Capture Page Screenshot    postlogin.png
    Sleep    2s
    Click Element    xpath://*[text()="Kumar g, Anil"] 

# Click Checkbox with Troubleshooting
#     Open Browser    ${LOGIN_URL}    edge
#     Maximize Browser Window

#     # Wait until the checkbox is visible and enabled
#     Wait Until Element Is Visible    xpath://*[@id="oCheckBox-CB"]    10s
#     Wait Until Element Is Enabled    xpath://*[@id="oCheckBox-CB"]    10s

#     # Scroll into view and click
#     Scroll Element Into View         xpath://*[@id="oCheckBox-CB"]
#     Click Element                    xpath://*[@id="oCheckBox-CB"]

#     # Capture screenshot if needed for debugging

#     Capture Page Screenshot          checkbox_clicked.png

#     # As a fallback, try clicking with JavaScript
#     Execute Javascript    document.evaluate('//[@id="oCheckBox-CB"]', document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null).singleNodeValue.click();

#     # Capture screenshot after JavaScript click
#     Capture Page Screenshot          checkbox_js_clicked.png
# check checkbox with id
#     Open Browser    ${LOGIN_URL}    edge
#     Maximize Browser Window
#     Sleep    10s
#     # Wait Until Element Is Visible    id=oCheckBox-CB    10s
#     Select Checkbox    xpath://*[@type="CheckBox"]
   # Log To Console    ${reult}
# Press Tab Four Times and Then Press Space using python
#     Open Browser    ${LOGIN_URL}    chrome
#     Maximize Browser Window
    
#     # Call the custom Python keyword
#     Press Tab And Space    driver

#     # Capture a screenshot to verify the result if needed
#     Capture Page Screenshot    after_space_pressedpy.png     
*** Keywords ***

Open Browser And Navigate To Login Page
    Open Browser    ${LOGIN_URL}    edge
    Maximize Browser Window
suite setup
    Set Selenium Speed    0.4s
    Set Selenium Implicit Wait    10seconds
Enter Username
    [Arguments]    ${username}
    Input Text    xpath://*[@id="RSC_input_username-inner"]    ${username}

Enter Password
    [Arguments]    ${password}
    Input Text   xpath://*[@id="RSC_input_password-inner"]    ${password}    
Click Login Button
    Click Button    xpath://*[@id="oButtonLogin"]
Press Tab three Times and Then Press Space
    # Open Browser    ${LOGIN_URL}    edge
    # Maximize Browser Window
    Press Keys    NONE    \ue004\ue004\ue004
    Press Keys    NONE    \ue00d
    Sleep    2s 
    Capture Page Screenshot    after_space_pressed.png   
    ${reult}=    Checkbox Should Be Selected    xpath://*[@id="oCheckBox-CB"]
        

# Click Checkbox with Troubleshooting
#     Open Browser    https://example.com    chrome
#     Maximize Browser Window

#     # Wait until the checkbox is visible and enabled
#     Wait Until Element Is Visible    xpath://*[@id="oCheckBox"]//input    10s
#     Wait Until Element Is Enabled    xpath://*[@id="oCheckBox"]//input    10s

#     # Scroll into view and click
#     Scroll Element Into View         xpath://*[@id="oCheckBox"]//input
#     Click Element                    xpath://*[@id="oCheckBox"]//input

#     # Capture screenshot if needed for debugging
#     Capture Page Screenshot          checkbox_clicked.png

#     # As a fallback, try clicking with JavaScript
#     Execute Javascript    document.evaluate('//*[@id="oCheckBox"]//input', document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null).singleNodeValue.click();

#     # Capture screenshot after JavaScript click
#     Capture Page Screenshot          checkbox_js_clicked.png        
