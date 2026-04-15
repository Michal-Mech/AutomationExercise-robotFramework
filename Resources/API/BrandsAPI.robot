*** Settings ***
Library     RequestsLibrary
Resource    ../../Data/InputData.robot

*** Keywords ***
Get All Brands
    ${response}=    GET On Session    automationex    /api/brandsList
    RETURN    ${response}

Put To Brands List
    ${response}=    PUT On Session    automationex    /api/brandsList    expected_status=any
    RETURN    ${response}
