*** Settings ***
Library           WnLibraryV3
Library           urllib3
Library           RequestsLibrary
Resource          ../1操作层/通用参数.robot

*** Keywords ***
findPharmacyDept
#    [Documentation] 文字说明
    [Tags]      ceeelelle
    [Timeout]   1 minutes
    [Arguments]     ${data}     ${headers}=${default_header}
    disable_warnings
    Create Session    api    ${HOST}    ${headers}      verify=${False}
    ${Return}   Post Request    api    /organization-middleground/pharmacyDept/findPharmacyDept/page    data=${data}
    status should be    200
    log to console       ${Return.json()}
    [Return]    ${Return.json()}






