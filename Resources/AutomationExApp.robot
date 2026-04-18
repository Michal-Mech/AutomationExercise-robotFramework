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
Library         ../Libraries/CustomValidators.py

*** Keywords ***
Generate Test User Data
    [Documentation]    Generates a random name, email and password using the
    ...                CustomValidators Python library and returns them as a
    ...                3-element list: name, email, password.
    ${name}=      Generate Random Name      prefix=TestUser
    ${email}=     Generate Random Email     domain=test.com
    ${password}=  Generate Random Password  length=10
    Validate Email Format        ${email}
    Validate Password Strength   ${password}
    RETURN    ${name}    ${email}    ${password}


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
    ${name}    ${email}    ${password}=    Generate Test User Data
    Set Suite Variable    ${USER_NAME}      ${name}
    Set Suite Variable    ${USER_EMAIL}     ${email}
    Set Suite Variable    ${USER_PASSWORD}  ${password}
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

