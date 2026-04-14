*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${CONTACT_US_LINK}      xpath=//a[@href='/contact_us']
${NAME_INPUT}           css=[data-qa="name"]
${EMAIL_INPUT}          css=[data-qa="email"]
${SUBJECT_INPUT}        css=[data-qa="subject"]
${MESSAGE_INPUT}        css=[data-qa="message"]
${FILE_UPLOAD}          xpath=//input[@name='upload_file']
${SUBMIT_BUTTON}        css=[data-qa="submit-button"]
${HOME_BUTTON}          xpath=//a[contains(text(), 'Home')]

*** Keywords ***
Navigate To Contact Us
    Click Element    ${CONTACT_US_LINK}

Verify Get In Touch Header
    Wait Until Page Contains    Get In Touch

Fill Contact Form
    Input Text    ${NAME_INPUT}       ${CONTACT_NAME}
    Input Text    ${EMAIL_INPUT}      ${CONTACT_EMAIL}
    Input Text    ${SUBJECT_INPUT}    ${CONTACT_SUBJECT}
    Input Text    ${MESSAGE_INPUT}    ${CONTACT_MESSAGE}

Upload File
    Choose File    ${FILE_UPLOAD}    ${UPLOAD_FILE_PATH}

Submit Contact Form
    Click Element    ${SUBMIT_BUTTON}
    sleep   2s
    Handle Alert

Verify Success Message
    Wait Until Page Contains    Success! Your details have been submitted successfully.

Click Home Button
    Click Element    ${HOME_BUTTON}
    Wait Until Page Contains    Automation Exercise
