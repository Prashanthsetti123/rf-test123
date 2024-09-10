*** Settings ***
Library    SeleniumLibrary
Library    Screenshot
Suite Setup      Set Selenium Implicit Wait    10 seconds

*** Variables ***
${eifuName}       Test_demo_vs_07
${eifuID}         Test_demo_vs_07
${url}            https://eifuindexdev2.jnjux.com/launchpad/eIFU_Index
${Browser}        edge
${PDF_FILE_PATH}    C:\\Users\\tai-0\\Downloads\\jnj 1.pdf
${CSV_FILE_Path}    C:\\Users\\tai-0\\Downloads\\5923 CSV File.csv
${TXT_file_path}    C:\\Users\\tai-0\\Downloads\\variant files.txt
${PROCEED_BUTTON}   xpath://span[text()="Yes, Proceed"] 


*** Test Cases ***
open the browser and do login
    Open Browser    ${url}    ${Browser}
    Maximize Browser Window
    Set Selenium Speed    0.2 seconds
    Wait Until Page Contains Element    id:inFormLoginUsername-inner    timeout=10s
    Input Text    id:inFormLoginUsername-inner    Akumarg5
    Input Text    id:inFormLoginPassword-inner    MYjnj@1427
    Wait Until Page Contains Element    id:formLoginButton-content    timeout=10s
    Click Button    id=formLoginButton
    Sleep    4s
Go to the modify page and search for the document
    Wait Until Page Contains Element    xpath://*[@id="root"]//ul/a[3]    timeout=10s
    Click Link    xpath://*[@id="root"]//ul/a[3]

    # search for the file
    Wait Until Page Contains Element   xpath://input[@placeholder="Search"]    timeout=10s
    Input Text    xpath://input[@placeholder="Search"]  ${eifuName}
    sleep    2s

    #click on go button  
    Click Element    xpath://button[@type="submit"]
    Sleep    5s
    Capture Page Screenshot   searchp1.png  

    # Edit button in modify page
    Wait Until Element Is Visible    xpath:(//tr[contains(@class,"ant-table-row-level-0")]//td[13]//button)[2]    10seconds
    Click Element    xpath:(//tr[contains(@class,"ant-table-row-level-0")]//td[13]//button)[2]

    # # Edit button after click edit button
    # Wait Until Element Is Visible    xpath://*[@id="root"]/div/div[2]/div/div[2]/div/div[1]/form/div[1]/div/div[3]/button[1]    10seconds
    # Click Element    xpath://*[@id="root"]/div/div[2]/div/div[2]/div/div[1]/form/div[1]/div/div[3]/button[1]
    
     # Edit button after click edit button
    ${result}=    Run Keyword And Ignore Error    Wait Until Element Is Visible    xpath://*[@id="root"]/div/div[2]/div/div[2]/div/div[1]/form/div[1]/div/div[3]/button[1]    10 seconds
    ${status}=    Set Variable    ${result}[0]
    Run Keyword If    '${status}' == 'PASS'    Click Element    xpath://*[@id="root"]/div/div[2]/div/div[2]/div/div[1]/form/div[1]/div/div[3]/button[1]



    # published button
    Wait Until Element Is Visible    xpath://*[@id="published"]    10seconds
    Click Element    xpath://*[@id="published"]

    # proceed button after unpublished
    Wait Until Element Is Visible    xpath://*[text()="Proceed"]    10seconds
    Click Element    xpath://*[text()="Proceed"]
    
    Capture Page Screenshot    erroratproceed.png