
*** Settings ***
Library    SeleniumLibrary    

Documentation    This is a test suite for demonstration purposes.
Suite Setup      Set Selenium Implicit Wait    10seconds

*** Variables ***
${url}    https://www.perplexity.ai/
${USERNAME}      settiprashanth@gmail.com    
${PASSWORD}      123456789
${text}    what is the weather in hyderabad? today
# ${IMPLICIT_WAIT}    5s
${searchElement}    //textarea[contains(@placeholder,"Ask anything")]

${INTERRUPTING_ELEMENT}    //*[@id="__next"]/main/div/div/div[2]/div/div/div[4]/div/div/div[1]/button/div
${followsearchElement}        //*[@placeholder="Ask follow-up"]


*** Test Cases ***
login and search for code on given requirement
    open browser and use edge browser
    search for anything    Create a program that prints 'Hello, World!' to the console using Python as the programming language
    Take screenshot with name    code
    page down
  
search for image generation
    open browser and use edge browser
    search for anything    I need an image of a cat drinking milk from a pot without the owner's knowledge.
    Take screenshot with name    catimage
    page down
    
search for text 
    open browser and use edge browser
    search for anything    what is the meaning of prashanth 
    Take screenshot with name    namemeaning 
    page down
# Search for the wather
#     search for anything    what is the weather in hyderabad today 
#     Take screenshot with name    weatherreport 
#     page down
    
search for Text accuracy
    open browser and use edge browser
    search for anything    i want the text, not for you ,for me that is i need prashanth logo but dont expose to every one keep it private
    Take screenshot with name    textaccuracy
    page down
search language transalation
    open browser and use edge browser 
    search for anything    translate this to telugu "hi how are you"
    Take screenshot with name    translation
    page down
# search for the story
#     search for anything    Create a short story about a dog and a cat
#     Take screenshot with name    story
#     page down
search for the story and ask questions in followup
    Open Browser    ${url}    chrome    executable_path=C:\\Users\\tai-0\\Downloads\\chromedriver-win64\\chromedriver-win64\\chromedriver.exe    options=--headless=${False}
    Maximize Browser Window
    Close Interrupting Element
    Wait Until Element Is Visible    xpath:${searchElement}    10seconds
    Sleep    2s
    Input Text    xpath:${searchElement}    hi how are you?
    Click Element    xpath://*[@aria-label="Submit"]
    # Sleep    3seconds
    Take screenshot with name    followup1
    Close Interrupting Element
    Wait Until Element Is Visible    xpath:${followsearchElement}    10seconds
    Input Text    xpath:${followsearchElement}    i want to ask you the story of dog and cat
    Click Element    xpath://*[@aria-label="Submit"]
    Sleep    3seconds
    Take screenshot with name    story
    page down
    Capture Page Screenshot    C:\\Users\\tai-0\\OneDrive\\Desktop\\screenshots\\scrollpage.png

*** Keywords ***
open browser and use edge browser   
    Open Browser    ${url}    chrome    executable_path=C:\\Users\\tai-0\\Downloads\\chromedriver-win64\\chromedriver-win64\\chromedriver.exe    options=--headless=${False}
    Maximize Browser Window

    Maximize Browser Window
    Sleep    1s

Setup Suite
    Set Selenium Implicit Wait    5s
    Set Selenium Speed    0.2    


Close Interrupting Element
    ${element_present}=    Run Keyword And Return Status    Element Should Be Visible    ${INTERRUPTING_ELEMENT}
    IF    ${element_present}
        Click Element    ${INTERRUPTING_ELEMENT}
    END    
    
search for anything
    [Arguments]    ${nexttext}
    # Click Element    xpath:(//*[text()="Home"])[1]
    Close Interrupting Element
    Wait Until Element Is Visible    xpath:${searchElement}    10seconds
    Sleep    2s
    Input Text    xpath:${searchElement}    ${nexttext}
    Click Element    xpath://*[@aria-label="Submit"]
    Sleep    3seconds

Take screenshot with name
    [Arguments]    ${imagename}
    Sleep    3seconds
    Capture Page Screenshot    ${imagename}.png

page down
    Press Keys    xpath=//body    PAGE_DOWN 
    Sleep    2s   
    
    


    