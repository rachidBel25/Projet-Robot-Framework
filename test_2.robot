***settings***
Library    SeleniumLibrary
# Quand plusieurs navigateurs on suprime Test setup
# Test Setup    Ouvertures des navigateurs    ${url}    ${browser}
Test Teardown    Close All Browsers

*** Variables ***
${BROWSER_1}    chrome
${BROWSER_2}    firefox
${BROWSER_3}    Edge  
${Url_1}    https://www.wikipedia.org
${Url_2}    https://www.google.com
${Url_3}    https://www.bing.com

*** Keywords ***
Ouvertures des navigateurs
    [Arguments]    ${url}    ${browser}
    Open Browser    ${url}    ${browser}
    Maximize Browser Window
    Capture Page Screenshot

*** Test Cases ***
Test cas 1 Recherche de mot sur wikipedia chrome:
    Ouvertures des navigateurs    ${Url_1}    ${BROWSER_1} 
    # Descendre jusqu'en bas
    Execute JavaScript    window.scrollTo(0, document.body.scrollHeight);
    # Revenir tout en haut
    Execute JavaScript    window.scrollTo(0, 0);
    
Test cas 2 Recherche de mot sur firefox:
    Ouvertures des navigateurs    ${Url_2}    ${BROWSER_2}
    Click Element    xpath=//button[contains(.,'Tout refuser')]
    Input Text    name=q    Robot Framework
    Clear Element Text    name=q    
    Press Key    name=q    robot framewor python
    Wait Until Element Is Visible    name=btnK 
    
Test cas 3 Recherche de mot sur bing:
    Ouvertures des navigateurs    ${Url_3}    ${BROWSER_3}
    Click Element    xpath=//button[contains(.,'Tout refuser')]
    Input Text    name=q    Robot Framework*
    Capture Page Screenshot
    Press Keys    name=q    ENTER
    ${capture_mot-robot}     Capture Page Screenshot
    Log To Console    ${capture_mot-robot}   

  
