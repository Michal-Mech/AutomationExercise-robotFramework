*** Settings ***
Documentation    API test suite for AutomationExercise REST endpoints
Resource    ../Data/InputData.robot
Resource    ../Resources/AutomationExAPI.robot
Test Setup       AutomationExAPI.Begin API Test
Test Teardown    AutomationExAPI.End API Test

*** Test Cases ***
Get All Products List
    [Tags]    api    products    get
    ${response}=    AutomationExAPI.Get All Products List
    Should Be Equal As Integers    ${response.json()['responseCode']}    200
    Should Not Be Empty    ${response.json()['products']}
    Validate Response Has Keys    ${response.json()}    responseCode    products
    Validate Products Schema      ${response.json()['products']}

POST To All Products List
    [Tags]    api    products    post
    ${response}=    AutomationExAPI.Post To Products List
    Should Be Equal As Integers    ${response.json()['responseCode']}    405
    Should Be Equal As Strings     ${response.json()['message']}    This request method is not supported.

Get All Brands List
    [Tags]    api    brands    get
    ${response}=    AutomationExAPI.Get All Brands List
    Should Be Equal As Integers    ${response.json()['responseCode']}    200
    Should Not Be Empty    ${response.json()['brands']}
    Validate Response Has Keys    ${response.json()}    responseCode    brands
    Validate Brands Schema        ${response.json()['brands']}

PUT To All Brands List
    [Tags]    api    brands    put
    ${response}=    AutomationExAPI.Put To Brands List
    Should Be Equal As Integers    ${response.json()['responseCode']}    405
    Should Be Equal As Strings     ${response.json()['message']}    This request method is not supported.

Search Product
    [Tags]    api    search    post
    ${response}=    AutomationExAPI.Search For Product
    Should Be Equal As Integers    ${response.json()['responseCode']}    200
    Should Not Be Empty    ${response.json()['products']}
