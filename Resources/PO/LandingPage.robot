*** Settings ***
Library         SeleniumLibrary

*** Keywords ***
Load
    Go To                       ${START_URL}

Verify Page Loaded
    Wait Until Page Contains    Automation Exercise

Click on Products
    click element    //*[@id="header"]/div/div/div/div[2]/div/ul/li[2]/a

Scroll To Footer
    Execute JavaScript    window.scrollTo(0, document.body.scrollHeight)

Verify Subscription Header
    Wait Until Page Contains    Subscription

Enter Subscription Email
    Input Text    id=susbscribe_email    ${SUBSCRIPTION_EMAIL}
    sleep    2s

Submit Subscription
    Click Element    id=subscribe
    sleep    2s

Verify Subscription Success
    Wait Until Page Contains    You have been successfully subscribed!