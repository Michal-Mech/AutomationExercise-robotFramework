*** Settings ***
Library  SeleniumLibrary

*** Variables ***
${ACCEPT_COOKIES}    xpath=/html/body/div/div[2]/div[2]/div[2]/div[2]/button[1]/p

*** Keywords ***
Accept Cookies If Present
    Wait Until Page Contains Element    ${ACCEPT_COOKIES}    5s
    Click Element    ${ACCEPT_COOKIES}

Dismiss Ad If Present
    Execute JavaScript
    ...    var anchors = document.querySelectorAll('#adplus-anchor, div[id*="ad-anchor"]');
    ...    anchors.forEach(function(el){ el.style.display = 'none'; });
    ...    var frames = document.querySelectorAll('ins.adsbygoogle, iframe[id^="aswift_"]');
    ...    frames.forEach(function(el){ el.style.display = 'none'; });
    Sleep   2s
