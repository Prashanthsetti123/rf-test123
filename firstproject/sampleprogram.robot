*** Settings ***
Library           SeleniumLibrary


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
    Set Selenium Speed    0.4s
    Enter Username    ${VALID_USERNAME}
    Enter Password    ${VALID_PASSWORD}
    Capture Page Screenshot    take.png
    Click Login Button
    Sleep   2s    
    Capture Element Screenshot      take2.png 
   

# # Scenario 2: Successful Login without "Remember Me" Checkbox Checked
# Login Without Remember Me Checked
#     [Documentation]    Verify that the user can log in successfully when the "Remember Me" checkbox is not checked.
#     Enter Username    ${VALID_USERNAME}
#     Enter Password    ${VALID_PASSWORD}
#     Uncheck Remember Me
#     Click Login Button
#     Verify Successful Login
#     Verify No Remember Me Functionality

# # Scenario 3: Unsuccessful Login with Incorrect Credentials
# Unsuccessful Login With Incorrect Credentials
#     [Documentation]    Verify that the user cannot log in with incorrect credentials.
#     Enter Username    ${INVALID_USERNAME}
#     Enter Password    ${INVALID_PASSWORD}
#     Click Login Button
#     Verify Unsuccessful Login
#     Enter Username    ${VALID_USERNAME}
#     Enter Password    ${INVALID_PASSWORD}
#     Click Login Button
#     Verify Unsuccessful Login

# # Scenario 4: Verify "Remember Me" Checkbox Default State
# Verify Remember Me Checkbox Default State
#     [Documentation]    Verify the default state of the "Remember Me" checkbox when the login page is loaded.
#     # Open Login Page
#     Verify Checkbox Default State

# # Scenario 5: Remember Me Checkbox Functionality with Browser Cache Cleared
# Remember Me Functionality After Clearing Cache
#     [Documentation]    Verify the behavior of the "Remember Me" checkbox when the browser cache is cleared.
#     Log In And Check Remember Me
#     Clear Browser Cache
#     Reopen Login Page
#     # Verify No Remember Me Functionality After Cache Cleared

*** Keywords ***

Open Browser And Navigate To Login Page
    Open Browser    ${LOGIN_URL}    edge
    Maximize Browser Window
    Set Selenium Implicit Wait    10 seconds

Enter Username
    [Arguments]    ${username}
    Input Text    xpath://*[@id="RSC_input_username-inner"]    ${username}

Enter Password
    [Arguments]    ${password}
    Input Text   xpath://*[@id="RSC_input_password-inner"]    ${password}

# Check Remember Me
#     Click Element    id=remember_checkbox

# Uncheck Remember Me
#     Uncheck Checkbox    id=remember_checkbox

Click Login Button
    Click Button    xpath://*[@id="oButtonLogin"]

Verify Successful Login
    Wait Until Element Is Visible    id=logout_button
    Element Should Be Visible    id=logout_button

Verify Unsuccessful Login
    Wait Until Element Is Visible    id=error_message
    Element Should Be Visible    id=error_message

# Verify Remember Me Functionality
#     [Teardown]    Close Browser
#     Open Browser And Navigate To Login Page
#     Element Should Contain    id=username_field    ${VALID_USERNAME}
#     Checkbox Should Be Selected    id=remember_checkbox

# Verify No Remember Me Functionality
#     [Teardown]    Close Browser
#     Open Browser And Navigate To Login Page
#     Element Text Should Be Empty    id=username_field
#     Checkbox Should Not Be Selected    id=remember_checkbox

# Verify Checkbox Default State
#     Checkbox Should Not Be Selected    id=remember_checkbox

# Log In And Check Remember Me
#     Enter Username    ${VALID_USERNAME}
#     Enter Password    ${VALID_PASSWORD}
#     Check Remember Me
#     Click Login Button
#     Verify Successful Login

# Clear Browser Cache
#     Execute Javascript    window.localStorage.clear(); window.sessionStorage.clear();

# Reopen Login Page
#     Open Login Page
