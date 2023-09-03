*** Settings ***
Library         SeleniumLibrary
Variables       ../../config/config.py


*** Keywords ***
Open Main Page
    Open Browser    url=${BASE_URL}    browser=${BROWSER}
    Set Window Size    1600    800

Go To The Main Page
    Go To    ${BASE_URL}
