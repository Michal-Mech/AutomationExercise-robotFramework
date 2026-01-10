*** Settings ***
Library  SeleniumLibrary

*** Variables ***
${ACCEPT_COOKIES}    xpath=/html/body/div/div[2]/div[2]/div[2]/div[2]/button[1]/p

*** Keywords ***
Accept Cookies If Present
    Wait Until Page Contains Element    ${ACCEPT_COOKIES}    5s
    Click Element    ${ACCEPT_COOKIES}
