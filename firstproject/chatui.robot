*** Settings ***
Library  SeleniumLibrary
Library    example.py
Library    example2crop.py

*** Variables ***
${BROWSER}  edge
${URL}  https://www.tutorialspoint.com/selenium/practice/alerts.php

*** Test Cases ***
Handle Alerts and take full screesnhot including time
    Open Browser  ${URL}  ${BROWSER}
    Maximize Browser Window
    Sleep    1s
    Take Screenshot    C:\\Users\\tai-0\\OneDrive\\Desktop\\screenshots\\screenshotusingpy.png

handle alert and crop
    Open Browser  ${URL}  ${BROWSER}
    Maximize Browser Window
    Sleep    1s
    Take Screenshot2    C:\\Users\\tai-0\\OneDrive\\Desktop\\screenshots\\screenshotusingpy1.png    0,50,1920,1080
click on things
    Open Browser    https://www.google.com    edge
        
           