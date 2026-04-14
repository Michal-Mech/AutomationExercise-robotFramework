*** Settings ***
Documentation   This is some basic info about the whole suite
Resource    ../Data/InputData.robot
Resource    ../Resources/AutomationExApp.robot
Resource    ../Resources/Common.robot
Test Setup    Begin Web Test
Test Teardown    End Web Test

# Copy/paste the below line to Terminal window to execute
# robot -d results tests/AutomationEx.robot

*** Variables ***

*** Test Cases ***
Logged out user should be able to search for products
    [Tags]  search
    AutomationExApp.Search for Products

Logged out user should be able to add and view product in cart
    [Tags]  cart
    AutomationExApp.Search for Products
    AutomationExApp.Select Product from Search Results
    AutomationExApp.View Product In Cart

Register User
    [Tags]  register
    AutomationExApp.Register New User




