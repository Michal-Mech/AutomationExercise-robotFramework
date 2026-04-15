*** Settings ***
Resource    ../Data/InputData.robot
Resource    ../Resources/API/ProductsAPI.robot

*** Keywords ***
Begin API Test
    ProductsAPI.Create API Session

End API Test
    ProductsAPI.Delete API Session

Get All Products List
    ${response}=    ProductsAPI.Get All Products
    RETURN    ${response}
