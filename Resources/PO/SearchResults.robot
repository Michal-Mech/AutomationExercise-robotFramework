*** Settings ***
Library  SeleniumLibrary

*** Keywords ***
Verify Search Completed
    Wait Until Page Contains  Searched Products

Click Product Link
    [Documentation]    Adds first product to cart using JS click
    Scroll Element Into View    xpath=(//div[@class='product-image-wrapper'])[1]
    Execute JavaScript  document.querySelectorAll("a.add-to-cart")[0].click();
    Wait Until Element Is Visible   xpath=//button[contains(.,'Continue Shopping')]    5s
    Click Element   xpath=//button[contains(.,'Continue Shopping')]