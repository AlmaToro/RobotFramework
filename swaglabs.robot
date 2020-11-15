*** Settings ***
Library         SeleniumLibrary   run_on_failure=Nothing
Library         DateTime
Library         String
Library         XML
Library         OperatingSystem
Library         Collections

*** Variables ***
${URL}            https://www.saucedemo.com
${BROWSER}        Chrome
${DRIVER}         chromedriver
${DELAY}          0

***Test cases**
Test checkout
    Prepare Browser
    Login       standard_user       secret_sauce

    Add item to cart    Jacket
    Wait Until Page Contains Element    xpath=//*[@id="shopping_cart_container"]/a/span
    Add second item to cart    Onesie
    #Click Button                        xpath=//*[@id="shopping_cart_container"]
    Add third item
    Go to shopping-cart


    #Close browser

*** Keywords ***
Prepare Browser
    Open Browser    ${URL}  ${BROWSER}   executable_path=${DRIVER}
    Maximize Browser Window
    Set Selenium Speed    ${DELAY}

Login
    [Arguments]     ${user}     ${password}
    Input Text      id=user-name    ${user}
    Input Text      id=password     ${password}
    Click Button    LOGIN

Add item to cart
    [Arguments]     ${item}
    Click Button    xpath=//div[@class='inventory_item' and contains(.,'${item}')]//button[contains(.,'ADD')]

Add second item to cart
    [Arguments]     ${item}
    Click Button    xpath=//div[@class='inventory_item' and contains(.,'${item}')]//button[contains(.,'ADD')]

Add third item
    Click button    css:#inventory_container > div > div:nth-child(2) > div.pricebar > button

Go to shopping-cart
    Click Button    css:#shopping_cart_container > a > svg > path
