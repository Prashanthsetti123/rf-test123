*** Settings ***
Library    SeleniumLibrary
Library    Screenshot

*** Variables ***
${BROWSER}      edge
${URL}          https://practice.expandtesting.com/upload
${FILE_PATH}    C:\\Users\\tai-0\\Downloads\\variant files.txt
${screeshotlocation}    C:\\Users\\tai-0\\OneDrive\\Desktop\\screenshots\\

*** Test Cases ***
Upload File to ExpandTesting
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    Wait Until Element Is Visible    xpath=//input[@type='file']    timeout=10s
    Choose File    xpath=//input[@type='file']    ${FILE_PATH}
    Click Button    xpath=//button[@type='submit']   # Assuming there's a submit button
    # You can add additional steps to verify the upload
    Capture Page Screenshot   fileuploaded.png
    # [Teardown]    Close Browser

upload file and validate the file
    Open Browser    https://demo.automationtesting.in/FileUpload.html    edge
    Maximize Browser Window    
    Wait Until Element Is Visible   id=input-4    5s
    Choose File   id=input-4     ${FILE_PATH}
    Sleep    5s    
    Capture Page Screenshot    demopng.png

    
    