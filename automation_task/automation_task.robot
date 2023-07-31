*** Settings ***
Library           String
Library           SeleniumLibrary
Library           internal/download_web_driver.py
Library           internal/helpers.py

*** Variables ***
${product_locator}                         //div[@data-test-id="productPrice"]
${available_size_locator}                  //button[@aria-label="Size"]/parent::div[not(button[@aria-label="Notify"])]
${add_to_cart_button_locator}              //button[@id="AddToCart"]
${added_to_cart_successfully_locator}      //*[text()="Added to bag successfully"]
${cart_icon_locator}                       //li[@data-test-id="cartLink"]
${login_button_locator}                    //button[text()="Login"]


*** Test Cases ***
Navigate To A Category And Add The Most Expensive Item To Cart
    [Setup]    Open Browser and Navigate to Home Page

    FOR    ${index}    IN RANGE    2
        Click Menu Item     Shoes
        ${shopping_items_sorted_by_price}=    Get Shop Items Sorted By Price Descending
        Click Element       ${shopping_items_sorted_by_price}[${index}]     # we click the n-th most expensive item according to the ${index}
        Click Any Available Size
        Click Add To Cart
        Wait For Shopping Item To Be Added To Cart
    END

    Click Cart Icon
    Capture Page Screenshot

    [Teardown]    Close Browser


*** Keywords ***
Open Browser and Navigate to Home Page
    ${web_driver_path}=   download_chrome_driver    relative_path=drivers
    Open Browser    https://www.zalora.sg/s/men    Chrome   executable_path=${web_driver_path}
    Maximize Browser Window

Click Menu Item
    [Arguments]                          ${item_text}
    ${menu_item_locator}=                Set Variable           //nav//a[text()="${item_text}"]
    Wait Until Element Is Visible        ${menu_item_locator}
    Wait Until Keyword Succeeds          10      1       Click Element     ${menu_item_locator}
    Mouse Over                           (//header)[1]

Get Shop Items Sorted By Price Descending
    Wait Until Page Contains Element     ${product_locator}
    ${items_unsorted}=     Get WebElements       ${product_locator}
    ${items_sorted}=    sort_shopping_items_by_price_descending     ${items_unsorted}
    [return]    ${items_sorted}

Click Any Available Size
    Wait Until Page Contains Element            ${available_size_locator}
    ${available_sizes}=     Get WebElements     ${available_size_locator}
    Click Element    ${available_sizes}[0]

Click Add To Cart
    Wait Until Element Is Visible     ${add_to_cart_button_locator}
    Click Element                     ${add_to_cart_button_locator}

Wait For Shopping Item To Be Added To Cart
    Wait Until Element Is Visible   ${added_to_cart_successfully_locator}
    Wait Until Keyword Succeeds     10      1   Element Should Not Be Visible     ${added_to_cart_successfully_locator}

Click Cart Icon
    Wait Until Element Is Visible   ${cart_icon_locator}
    Click Element                   ${cart_icon_locator}
    Wait Until Element Is Visible   ${login_button_locator}
