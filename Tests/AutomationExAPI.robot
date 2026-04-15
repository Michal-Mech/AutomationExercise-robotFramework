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
