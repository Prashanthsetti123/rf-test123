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

Click on create eIFU and enter details
    Wait Until Page Contains Element    xpath://*[@id="root"]//ul/a[2]    timeout=10s
    Click Link    xpath://*[@id="root"]//ul/a[2]
    Input Text    id=eifuName    ${eifuName}
    Input Text    id=eifuTitle    ${eifuID}
    Input Text    id=docCode    Test_demo_vs@03
    Input Text    id=subscriberVersion    0.02
    Select From List By Index    id=primaryIFU    1
    Click Element    xpath://*[@id="releaseDate"]

    Input Text    xpath://*[@id="releaseDate"]    08-27-2024
    Input Text    xpath://*[@id="projectLead"]    Akumarg
    Sleep     5S

    # Target audience
    Click Element    xpath://*[@id="targetAudience"]
    Input Text    xpath://*[@id="targetAudience"]    health
    Press Keys    xpath://*[@id="targetAudience"]    ENTER

    # Enterprise
    Select From List By Index    xpath://select[@id="enterprise"]    1

    # Franchise
    Click Element    xpath://*[@id="franchise"]
    Input Text    xpath://*[@id="franchise"]    acclare
    Press Keys    xpath://*[@id="franchise"]   ENTER

    # Product family
    Click Element    xpath://*[@id="productFamily"]
    Input Text    xpath://*[@id="productFamily"]    acclare
    Press Keys    xpath://*[@id="productFamily"]    ENTER

    # Product Category
    Click Element    xpath://*[@id="productCategory"]
    Input Text    xpath://*[@id="productCategory"]    acclare
    Press Keys    xpath://*[@id="productCategory"]    ENTER

    # documentSpecificFor
    Select From List By Index    xpath://select[@id="documentSpecificFor"]    1

    # keywordsStatements
    Input Text    id=keywordsStatements  testdata

     # Region
    Click Element    xpath://*[@id="region"]
    Input Text    xpath://*[@id="region"]    apac
    Press Keys    xpath://*[@id="region"]   ENTER

    # Assigned countries
    Click Element    xpath://*[@id="assignedCountries"]
    Input Text    xpath://*[@id="assignedCountries"]    india
    Press Keys    xpath://*[@id="assignedCountries"]   ENTER

    # # StrategyID
    # Click Element    xpath://*[@id="strategyId0"]
    # Input Text    xpath://*[@id="strategyId0"]    15475

    # eIFU Languages covered
    Click Element    xpath://*[@id="eifuLanguages"]
    Input Text    xpath://*[@id="eifuLanguages"]    engli
    Press Keys    xpath://*[@id="eifuLanguages"]   ENTER

    # CSV File
    Choose File    xpath://*[@id="product-variants-upload"]    ${CSV_FILE_Path}
    Sleep    2s

    # PDF File
    Choose File    xpath://*[@id="ifu-document-upload"]    ${PDF_FILE_PATH}
    Sleep    2s
upload supporting documents and click on validate and submit button
    # Plus Icon
    Click Button    xpath://*[@class="flex items-center justify-end"]//button
    Sleep    10s

    # TXT File
    Choose File    xpath://*[@id="filepicker_0"]    ${TXT_file_path}

    # TXT file docType
    Select From List By Index    xpath://select[@id="docType"]    1

    # View Icon for txt file
    Click Element    xpath:(//*[@class="flex flex-row space-x-2"]//button)[1]

    # Close View Window
    Click Button    xpath://*[@aria-label="Close"]
    Sleep    5s

    # validate button
    Click Button    xpath://button[text()="Validate"]
  
    Wait Until Element Is Visible    xpath://*[text()="Yes, Proceed"]    timeout=10s
    Click Element    xpath://*[text()="Yes, Proceed"]

    Capture Page Screenshot    validatep2.png

    # Submit button
    Wait Until Element Is Visible     xpath://button[text()="Submit"]    30 seconds
    Click Button     xpath://button[text()="Submit"]

     # Submit button
    Wait Until Element Is Enabled     xpath://*[text()="Go to Home"]   25 seconds
    Click Button     xpath://*[text()="Go to Home"]

    Sleep    10s
Go to modify page and search the created document
    # click on modify eIFU page
    Wait Until Page Contains Element    xpath://*[@id="root"]//ul/a[3]    timeout=10s
    Click Link    xpath://*[@id="root"]//ul/a[3]

    # search for the file
     Wait Until Page Contains Element   xpath://input[@placeholder="Search"]    timeout=10s
    Input Text    xpath://input[@placeholder="Search"]  ${eifuName}
    sleep    5s

    #click on go button  
    Click Element    xpath://button[@type="submit"]
    Sleep    5s
    Capture Page Screenshot   searchp1.png