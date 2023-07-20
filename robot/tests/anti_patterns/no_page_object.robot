*** Settings ***
Library             SeleniumLibrary
Resource            ../../resources/ui/common.resource


Suite Setup         Open Main Page
Suite Teardown      Close All Browsers


*** Test Cases ***
Test
    Log    to do