*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${LOGOUT_LINK}      xpath=//a[@href='/logout']

*** Keywords ***
Logout User
    Click Element    ${LOGOUT_LINK}
    Wait Until Page Contains    Login to your account
