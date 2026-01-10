*** Settings ***
Library         SeleniumLibrary

*** Keywords ***
Begin Web Test
    open browser        https://www.google.com/     ${BROWSER}

End Web Test
    Close Browser
