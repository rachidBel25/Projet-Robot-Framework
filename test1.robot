***settings***
Library    SeleniumLibrary
Test Setup    Ouvrir mon navigateur
Test Teardown    Close Browser

*** Variables ***
${nav1}    chrome
${nav2}    firefox

*** Keywords ***
Ouvrir mon navigateur
    Open Browser    https://www.google.com    ${nav1}
    Maximize Browser Window




*** Test Cases ***

Test cas 1:
    [DOCUMENTATION]  vérifier l ouverture de google 1  et du titre 1
    [Tags]  Test d'ouverture de navigateur avec chrome
    Title Should Be    Google
    Page Should Contain    Google
    Wait Until Element Is Visible    APjFqb
    # Click Element     W0wltc
    Click Element    xpath=//button[contains(.,'Tout refuser')]
    # ${captue}    Capture Page Screenshot
    # Log     ${captue}
    # Click Element    id = APjFqb   
    Input Text    APjFqb    Télephone
    # ${capturesaisieTelephone}    Capture Page Screenshot
    # Log     ${capturesaisieTelephone}
    Press Keys    APjFqb    ENTER
    # ${capturesaisieTelephone}    Capture Page Screenshot
    # Log     ${capturesaisieTelephone}
    Execute JavaScript    window.scrollTo(0, document.body.scrollHeight)
    
    
Test cas 2:
    [DOCUMENTATION]  vérifier l ouverture de google 2  et du titre 2
    [Tags]  Test d'ouverture de navigateur avec firefox
    Open Browser    https://www.google.com    ${nav2}
    Maximize Browser Window
    Title Should Be    Google
    Page Should Contain    Google
    Click Element    xpath=//button[contains(.,'Tout accepter')]
    Execute JavaScript    window.scrollTo(0, document.body.scrollHeight)

    