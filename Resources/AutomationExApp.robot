*** Settings ***
Resource    ../Resources/PO/LandingPage.robot
Resource    ../Resources/PO/SearchResults.robot
Resource    ../Resources/PO/Product.robot
Resource    ../Resources/PO/Cart.robot
Resource    ../Resources/PO/CookieConsent.robot
Resource    ../Resources/PO/ProductsPage.robot

Library         SeleniumLibrary

*** Keywords ***
Search for Products
    LandingPage.Load
    LandingPage.Verify Page Loaded
    CookieConsent.Accept Cookies If Present
    LandingPage.Click on Products
    ProductsPage.Search for Products
    SearchResults.Verify Search Completed

Select Product from Search Results
    SearchResults.Click Product link
    Product.Verify Page Loaded

View Product In Cart
    Cart.Go to Cart

