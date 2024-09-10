*** Settings ***
Library    SeleniumLibrary



*** Test Cases ***
handle alert - normal alert with ok
    Open Browser    https://demo.automationtesting.in/Alerts.html    edge
    Maximize Browser Window
    Wait Until Element Is Visible    xpath://button[@class='btn btn-danger']
    Click Button    xpath://button[@class='btn btn-danger']
    Sleep    1s    

    Handle Alert    accept

handle alert -alert with ok and cancel option
    # alert link
    Wait Until Element Is Visible    xpath://a[normalize-space()='Alert with OK & Cancel']
    Click Element    xpath://a[normalize-space()='Alert with OK & Cancel']
    # alert button
    Click Element    xpath://button[@class='btn btn-primary'] 
    Sleep    1s
    # alert with dismiss
    Handle Alert    dismiss

    # alert with ok button 
    Click Element    xpath://button[@class='btn btn-primary'] 
    Sleep    1s
    Handle Alert    accept
handle alert- alert with text box    
    Wait Until Element Is Visible    xpath://a[normalize-space()='Alert with Textbox']
    Click Element    xpath://a[normalize-space()='Alert with Textbox']
    # Input Text in the alert window
    Click Button    xpath://button[@class='btn btn-info']
    Sleep    1s
    # alert with input box
    Input Text Into Alert    prashanth setti    accept

handle alert-get the text of alert
    # alert link
    Wait Until Element Is Visible    xpath://a[normalize-space()='Alert with OK & Cancel']
    Click Element    xpath://a[normalize-space()='Alert with OK & Cancel']
     # alert with ok button 
    Click Element    xpath://button[@class='btn btn-primary'] 
    Sleep    1s
    ${message}=    Handle Alert
    Log To Console    ${message}
    Sleep    1s
    Capture Element Screenshot      xpath://*[@class="tabpane pullleft"]      p1.png   

        
   



