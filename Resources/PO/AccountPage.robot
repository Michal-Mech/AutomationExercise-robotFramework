*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${TITLE_MR}             id=id_gender1
${PASSWORD_INPUT}       css=[data-qa="password"]
${DAYS_SELECT}          css=[data-qa="days"]
${MONTHS_SELECT}        css=[data-qa="months"]
${YEARS_SELECT}         css=[data-qa="years"]
${NEWSLETTER_CHECKBOX}  id=newsletter
${OPTIN_CHECKBOX}       id=optin
${FIRST_NAME_INPUT}     css=[data-qa="first_name"]
${LAST_NAME_INPUT}      css=[data-qa="last_name"]
${ADDRESS_INPUT}        css=[data-qa="address"]
${COUNTRY_SELECT}       css=[data-qa="country"]
${STATE_INPUT}          css=[data-qa="state"]
${CITY_INPUT}           css=[data-qa="city"]
${ZIPCODE_INPUT}        css=[data-qa="zipcode"]
${MOBILE_INPUT}         css=[data-qa="mobile_number"]
${CREATE_ACCOUNT_BTN}   css=[data-qa="create-account"]
${CONTINUE_BTN}         css=[data-qa="continue-button"]
${DELETE_ACCOUNT_LINK}  xpath=//a[contains(text(), 'Delete Account')]
${LOGGED_IN_AS}         xpath=//a[contains(text(), 'Logged in as')]

*** Keywords ***
Fill Account Details
    Click Element    ${TITLE_MR}
    Input Text    ${PASSWORD_INPUT}        ${USER_PASSWORD}
    Select From List By Value    ${DAYS_SELECT}      ${DOB_DAY}
    Select From List By Label    ${MONTHS_SELECT}    ${DOB_MONTH}
    Select From List By Value    ${YEARS_SELECT}     ${DOB_YEAR}
    Select Checkbox    ${NEWSLETTER_CHECKBOX}
    Select Checkbox    ${OPTIN_CHECKBOX}
    Input Text    ${FIRST_NAME_INPUT}    ${FIRST_NAME}
    Input Text    ${LAST_NAME_INPUT}     ${LAST_NAME}
    Input Text    ${ADDRESS_INPUT}       ${ADDRESS}
    Select From List By Label    ${COUNTRY_SELECT}   ${COUNTRY}
    Input Text    ${STATE_INPUT}         ${STATE}
    Input Text    ${CITY_INPUT}          ${CITY}
    Input Text    ${ZIPCODE_INPUT}       ${ZIPCODE}
    Input Text    ${MOBILE_INPUT}        ${MOBILE}

Create Account
    Execute JavaScript    document.querySelector('[data-qa="create-account"]').click()

Verify Account Created
    Wait Until Page Contains    Account Created!
    Sleep                       2s

Click Continue After Created
    Execute JavaScript    document.querySelector('[data-qa="continue-button"]').click()

Verify Logged In After Registration
    Wait Until Page Contains Element    ${LOGGED_IN_AS}

Delete Account
    Click Element    ${DELETE_ACCOUNT_LINK}
    sleep    5s

Verify Account Deleted
    Wait Until Page Contains    Account Deleted!

Click Continue After Deleted
    Click Element    ${CONTINUE_BTN}
