*** Settings ***
Library  SeleniumLibrary

*** Variables ***
${SEARCH_BAR} =    id=search_product
${SEARCH_BUTTON} =    xpath=//*[@id="submit_search"]

*** Keywords ***
Search for Products
    Enter Search Term
    Submit Search

Enter Search Term
    Input Text  ${SEARCH_BAR}   ${SEARCH_TERM}

Submit Search
    Click Button  ${SEARCH_BUTTON}