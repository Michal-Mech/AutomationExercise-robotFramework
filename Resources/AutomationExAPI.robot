*** Settings ***
Resource    ../Data/InputData.robot
Resource    ../Resources/API/ProductsAPI.robot
Resource    ../Resources/API/BrandsAPI.robot
Resource    ../Resources/API/SearchAPI.robot

*** Keywords ***
Begin API Test
    ProductsAPI.Create API Session

End API Test
    ProductsAPI.Delete API Session

Get All Products List
    ${response}=    ProductsAPI.Get All Products
    RETURN    ${response}

Post To Products List
    ${response}=    ProductsAPI.Post To Products List
    RETURN    ${response}

Get All Brands List
    ${response}=    BrandsAPI.Get All Brands
    RETURN    ${response}

Put To Brands List
    ${response}=    BrandsAPI.Put To Brands List
    RETURN    ${response}

Search For Product
    [Arguments]    ${search_term}=${SEARCH_PRODUCT}
    ${response}=    SearchAPI.Search Product    ${search_term}
    RETURN    ${response}
