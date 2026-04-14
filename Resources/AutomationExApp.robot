*** Settings ***
Resource    ../Resources/PO/LandingPage.robot
Resource    ../Resources/PO/SearchResults.robot
Resource    ../Resources/PO/Product.robot
Resource    ../Resources/PO/Cart.robot
Resource    ../Resources/PO/CookieConsent.robot
Resource    ../Resources/PO/ProductsPage.robot
Resource    ../Resources/PO/SignupLoginPage.robot
Resource    ../Resources/PO/AccountPage.robot

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

Register New User
    LandingPage.Load
    LandingPage.Verify Page Loaded
    CookieConsent.Accept Cookies If Present
    SignupLoginPage.Navigate To Signup Login
    SignupLoginPage.Enter Signup Name And Email
    SignupLoginPage.Submit Signup
    AccountPage.Fill Account Details
    AccountPage.Create Account
    AccountPage.Verify Account Created
    CookieConsent.Dismiss Ad If Present
    AccountPage.Click Continue After Created
    AccountPage.Verify Logged In After Registration
    CookieConsent.Dismiss Ad If Present
    AccountPage.Delete Account

