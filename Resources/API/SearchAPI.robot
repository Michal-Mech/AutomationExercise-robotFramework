*** Settings ***
Library     RequestsLibrary
Resource    ../../Data/InputData.robot

*** Keywords ***
Search Product
    [Arguments]    ${search_term}=${SEARCH_PRODUCT}
    &{data}=    Create Dictionary    search_product=${search_term}
    ${response}=    POST On Session    automationex    /api/searchProduct    data=${data}
    RETURN    ${response}
