*** Settings ***
Resource            resource.robot

Suite Setup         Prepare Browser
#Suite Teardown      Close Browser 

Test Setup          Open Obstacle
Test Teardown       Verify Solved

*** Test Cases ***

TWINS
    [Tags]  12952
    Wait Until Page Contains Element    xpath=(//a[@id="id"])[2]
    Click Element                       xpath=(//*[@id="id"])[2]
    Verify Solved

Can you do this?
    [Tags]  22505
    Wait Until Page Contains Element    xpath=(//*[@id="dontuseid"])[2]
    Click Element                       xpath=(//*[@id="dontuseid"])[2]
    Verify Solved

Math
    [Tags]  32403
    ${first_value}       Get text        id=no1
    ${second_value}      Get text        id=no2
    ${operator_value}    Get text        id=symbol1
    ${result}            Evaluate                   ${first_value}${operator_value}${second_value} 
    Input text                           id=result  ${result}

Wait a moment
    [Tags]  33678
    Click Element                       id=one
    Wait Until Element is Enabled       id=two        2minutes
    Click Element                       id=two
