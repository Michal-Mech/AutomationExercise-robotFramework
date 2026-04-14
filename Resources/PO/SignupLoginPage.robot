*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${SIGNUP_LOGIN_LINK}        xpath=//a[@href='/login']
${SIGNUP_NAME_INPUT}        css=[data-qa="signup-name"]
${SIGNUP_EMAIL_INPUT}       css=[data-qa="signup-email"]
${SIGNUP_BUTTON}            css=[data-qa="signup-button"]
${LOGIN_EMAIL_INPUT}        css=[data-qa="login-email"]
${LOGIN_PASSWORD_INPUT}     css=[data-qa="login-password"]
${LOGIN_BUTTON}             css=[data-qa="login-button"]

*** Keywords ***
Navigate To Signup Login
    Click Element    ${SIGNUP_LOGIN_LINK}
    Wait Until Page Contains    New User Signup!

Enter Signup Name And Email
    Input Text    ${SIGNUP_NAME_INPUT}    ${USER_NAME}
    Input Text    ${SIGNUP_EMAIL_INPUT}   ${USER_EMAIL}

Submit Signup
    Click Element    ${SIGNUP_BUTTON}
    Wait Until Page Contains    Enter Account Information

Click Signup Button
    Click Element    ${SIGNUP_BUTTON}

Enter Login Credentials
    [Arguments]    ${email}    ${password}
    Input Text    ${LOGIN_EMAIL_INPUT}    ${email}
    Input Text    ${LOGIN_PASSWORD_INPUT}    ${password}

Submit Login
    Click Element    ${LOGIN_BUTTON}

Verify Login Error
    Wait Until Page Contains    Your email or password is incorrect!

Verify Email Already Exists
    Wait Until Page Contains    Email Address already exist!
