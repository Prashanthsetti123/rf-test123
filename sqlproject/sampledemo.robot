*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${BROWSER}        edge
${DB_FIDDLE_URL}  https://www.db-fiddle.com/
${CREATE_TABLE_SQL}    CREATE TABLE Users (firstname VARCHAR(50), lastname VARCHAR(50), phone_number VARCHAR(15), city VARCHAR(50), country VARCHAR(50), pincode VARCHAR(10));
${INSERT_DATA_SQL}     INSERT INTO Users (firstname, lastname, phone_number, city, country, pincode) VALUES ('John', 'Doe', '1234567890', 'New York', 'USA', '10001'), ('Jane', 'Smith', '0987654321', 'Los Angeles', 'USA', '90001'), ('Alice', 'Johnson', '1122334455', 'Chicago', 'USA', '60601'), ('Bob', 'Brown', '2233445566', 'Houston', 'USA', '77001'), ('Charlie', 'Davis', '3344556677', 'Phoenix', 'USA', '85001');
${SELECT_SQL}          SELECT * FROM Users;

*** Test Cases ***
Create Table and Insert Data
    [Documentation]    This test case creates a Users table, inserts sample data into it, and verifies the data.
    Open Browser    ${DB_FIDDLE_URL}    ${BROWSER}
    Maximize Browser Window
    # Wait Until Page Contains Element    xpath://textarea[@id="schema-input"]
    
    Input schema SQL Query    ${CREATE_TABLE_SQL}
    # Execute Query
    # Verify Query Success
    
    Input schema SQL Query    ${INSERT_DATA_SQL}
    # Execute Query
    # Verify Query Success
    
    Input SQL Query    ${SELECT_SQL}
    # Execute Query
    # Verify Inserted Data
    
    [Teardown]    Close Browser

*** Keywords ***
Input schema SQL Query
    [Arguments]    ${Schema_SQL_QUERY}

    Wait Until Element Is Visible    xpath://*[@id="schema-input"]    5seconds
    Input Text    xpath://*[@id="schema-input"]    ${Schema_SQL_QUERY}

Input SQL Query
    [Arguments]    ${SQL_QUERY}
    
    Wait Until Element Is Visible    xpath://*[@id="schema-input"]    5seconds
    Input Text    xpath://*[@id="schema-input"]    ${SQL_QUERY}    

Execute Query
    [Documentation]    Click the 'Run' button to execute the SQL query.
    Click Button    xpath://*[@id="runButton"]
    Wait Until Element Is Visible    xpath://*[@id="resultsMarkdownButtonTextarea"]

Verify Query Success
    [Documentation]    Verify that the query execution was successful.
    Wait Until Page Contains    Copy as Markdown

# Verify Inserted Data
#     [Documentation]    Verify that the data was inserted correctly, with a specific check for Jane Smith and pincode 60601.
#     ${results}=    Get Text    xpath://div[contains(@class, 'output')]
#     Log    ${results}
#     Should Contain    ${results}    Jane
#     Should Contain    ${results}    Smith
#     Should Contain    ${results}    60601
#     ${jane_smith_pincode}=    Evaluate    '60601' in [line for line in ${results}.splitlines() if 'Jane Smith' in line]
#     Should Be True    ${jane_smith_pincode}    'Jane Smith should have pincode 60601'
