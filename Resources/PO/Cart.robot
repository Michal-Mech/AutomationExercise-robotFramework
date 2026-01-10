*** Settings ***
Library  SeleniumLibrary

*** Keywords ***
Go to Cart
    Click Element    xpath=//a[@href='/view_cart']

Verify Cart Loaded
    Wait Until Page Contains  Shopping Cart