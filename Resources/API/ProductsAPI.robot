*** Settings ***
Library     RequestsLibrary
Resource    ../../Data/InputData.robot

*** Keywords ***
Create API Session
    Create Session    automationex    ${API_BASE_URL}

Delete API Session
    Delete All Sessions

Get All Products
    ${response}=    GET On Session    automationex    /api/productsList
    RETURN    ${response}

Post To Products List
    ${response}=    POST On Session    automationex    /api/productsList
    RETURN    ${response}
