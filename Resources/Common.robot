*** Settings ***
Library         SeleniumLibrary
Library         ../Libraries/CustomValidators.py

*** Keywords ***
Begin Web Test
    Validate Email Format       ${USER_EMAIL}
    Validate Password Strength  ${USER_PASSWORD}
    open browser        https://www.google.com/     ${BROWSER}

End Web Test
    Close Browser
