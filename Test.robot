*** Settings ***
Library    Collections    

*** Variables ***
@{a}    red     blue    green
@{b}    head    eyes    nose
&{DIC}    a=${a}    b=${b}


*** Test Cases ***
TC
    Log Structure    ${DIC}

*** Keywords ***
Log Structure
    [Arguments]    ${structure}
    Log To Console    \n
    Log To Console    ------------------------------

    # For Loops only work on Lists, so get all the keys from the Dictionary
    ${keys}     Get Dictionary Keys    ${structure}

    :FOR    ${item}    IN   @{keys}
    \    Log Many To Console    ${item}    ${structure["${item}"]}


Log Many To Console
    [Arguments]    ${name}    ${list}

    Log To Console    ${name}
    Log To Console    ------------------------------

    :FOR    ${item}    IN     @{list}
    \    Log To Console    ${item}

    Log To Console    ------------------------------