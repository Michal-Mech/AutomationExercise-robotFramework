*** Settings ***
Library         SeleniumLibrary

*** Keywords ***
Load
    Go To                       ${START_URL}

Verify Page Loaded
    Wait Until Page Contains    Automation Exercise

Click on Products
    click element    //*[@id="header"]/div/div/div/div[2]/div/ul/li[2]/a