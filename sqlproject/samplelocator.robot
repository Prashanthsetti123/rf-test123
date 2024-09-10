*** Settings ***
Library           SeleniumLibrary


*** Variables ***
${url}    https://practicetestautomation.com/practice-test-login/
${student_name}    student
${student_password}    Password123
${student_name1}    student1
${student_password1}    Password1234

*** Test Cases ***
open browser and enter login credeentials and click on login
    opening browser and maximize window    ${url}    edge
    enter username and password
    Click Element    id:submit
    Sleep    2s

enter invalid credentials and take screenshot
    opening browser and maximize window   ${url}    edge 
    enter invalid username and password     student1    
    Click Element    id:submit
    Sleep    2s
    Capture Page Screenshot    failed1.png

*** Keywords ***  
opening browser and maximize window
    [Arguments]    ${URL}    ${browsername}
    Open Browser    ${URL}  browsername
    Maximize Browser Window
enter username and password
    Input Text    id:username    ${student_name}
    Sleep    2s
    Input Text    id:password    ${student_password}
    Sleep    2s
enter invalid username and password  
    [Arguments]    ${std_name}      
    Input Text    id:username   ${std_name}
    Sleep    2s
    Input Text    id:password    ${student_password1}
    Sleep    2s


    