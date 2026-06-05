*** Settings ***
Library    SeleniumLibrary
Test Setup    Ouvrir le navigateur
Test Template    se connecter avec des identifiants inavlides
Test Teardown    Close Browser

*** Variables ***
${email}    1203bl@gmaail.com
${fullName}    jean 
${contact}    1231223


*** Test Cases ***

se connecter avec des identifiants inavlides    fullName    Email    contact
invalid full name    julien        ${email}    ${contact}
invalid email    ${fullName}    begeg@gmail.com    ${contact}
invalid contact    ${fullName}    ${email}    123456789



*** Keywords ***
Ouvrir le navigateur
    Open Browser    https://orangehrm.com/contact-sales    Chrome
    Maximize Browser Window
    # Cliquer sur refuser Deny
    Click Element    xpath=//button[contains(.,'Deny')]
     # Cupturer le titre et l'enregrister et le vérifier
    ${Title}     TitleShould Be    Contact Sales | Get in Touch | HR Software | HRMS | OrangeHRM
    ${Title}    Get Title
se connecter avec des identifiants inavlides
     [Arguments]    ${fullName}    ${email}    ${contact}
    Log Many    ${fullName}    ${email}    ${contact}

     # Saisir les identifiants
    Input Text    name=FullName    ${fullName}
    Input Text    name=Email    ${email}
    Input Text    name=Contact    ${contact}
    Sleep    2s
    #  Choisir le pays dans la liste déroulante
    Select From List By Label    name=Country    Algeria
    Input Text    name=CompanyName    OrangeHRM
    Input Text    name=JobTitle    Software Engineer

    Select From List By Label    name=NoOfEmployees  11 - 50
    Input Text    name=Comment   Ceci est un formulaire d'inscripiotn

    ${imageformulaire}    Capture Page Screenshot
    Log    ${imageformulaire}
    

    # git add C:\ProjetNouveauRobot\results\templates.robot