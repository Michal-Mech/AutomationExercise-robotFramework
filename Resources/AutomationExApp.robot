*** Settings ***
Resource    ../Resources/PO/LandingPage.robot
Resource    ../Resources/PO/SearchResults.robot
Resource    ../Resources/PO/Product.robot
Resource    ../Resources/PO/Cart.robot
Resource    ../Resources/PO/CookieConsent.robot
Resource    ../Resources/PO/ProductsPage.robot
Resource    ../Resources/PO/SignupLoginPage.robot
Resource    ../Resources/PO/AccountPage.robot
Resource    ../Resources/PO/Header.robot
Resource    ../Resources/PO/ContactUsPage.robot

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

Create Test Account
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

Delete Test Account
    CookieConsent.Dismiss Ad If Present
    AccountPage.Delete Account

Login With Invalid Credentials
    LandingPage.Load
    LandingPage.Verify Page Loaded
    CookieConsent.Accept Cookies If Present
    SignupLoginPage.Navigate To Signup Login
    SignupLoginPage.Enter Login Credentials    ${WRONG_EMAIL}    ${WRONG_PASSWORD}
    SignupLoginPage.Submit Login
    SignupLoginPage.Verify Login Error

Register New User
    Create Test Account
    Delete Test Account

Login With Valid Credentials
    Create Test Account
    Header.Logout User
    SignupLoginPage.Enter Login Credentials    ${USER_EMAIL}    ${USER_PASSWORD}
    SignupLoginPage.Submit Login
    CookieConsent.Dismiss Ad If Present
    AccountPage.Verify Logged In After Registration
    Delete Test Account

Logout User
    Create Test Account
    Header.Logout User
    SignupLoginPage.Enter Login Credentials    ${USER_EMAIL}    ${USER_PASSWORD}
    SignupLoginPage.Submit Login
    CookieConsent.Dismiss Ad If Present
    AccountPage.Verify Logged In After Registration
    Delete Test Account

Submit Contact Us Form
    LandingPage.Load
    LandingPage.Verify Page Loaded
    CookieConsent.Accept Cookies If Present
    ContactUsPage.Navigate To Contact Us
    ContactUsPage.Verify Get In Touch Header
    ContactUsPage.Fill Contact Form
    ContactUsPage.Upload File
    ContactUsPage.Submit Contact Form
    ContactUsPage.Verify Success Message
    ContactUsPage.Click Home Button

Verify Home Page Subscription
    LandingPage.Load
    LandingPage.Verify Page Loaded
    CookieConsent.Accept Cookies If Present
    LandingPage.Scroll To Footer
    LandingPage.Verify Subscription Header
    LandingPage.Enter Subscription Email
    LandingPage.Submit Subscription
    LandingPage.Verify Subscription Success

Register With Existing Email
    Create Test Account
    Header.Logout User
    SignupLoginPage.Navigate To Signup Login
    SignupLoginPage.Enter Signup Name And Email
    SignupLoginPage.Click Signup Button
    SignupLoginPage.Verify Email Already Exists
    SignupLoginPage.Enter Login Credentials    ${USER_EMAIL}    ${USER_PASSWORD}
    SignupLoginPage.Submit Login
    CookieConsent.Dismiss Ad If Present
    AccountPage.Verify Logged In After Registration
    Delete Test Account

