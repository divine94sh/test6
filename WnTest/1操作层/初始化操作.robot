*** Settings ***
Library           WnLibraryV3
Library           urllib3
Library           RequestsLibrary
Resource          通用参数.robot
Resource          配置文件读取.robot
Resource          初始化_底层.robot

*** Keywords ***
{初始化host地址}
    ${value}    获取host地址
    set global variable      ${HOST}     ${value}
    [Return]     ${value}


{指定用户登录初始化}
    [Arguments]     ${username}     ${password}
    ${token}    用户登录token       ${username}     ${password}
    set suite variable     ${cookie}       ${token}
    set suite variable      ${default_header}   {'Content-Type':'application/json;charset:utf-8','cookie':'token=${cookie}'}



{默认用户登录初始化}
    ${token}    默认用户登录token
    set suite variable     ${cookie}       ${token}
    set suite variable      ${default_header}   {'Content-Type':'application/json;charset:utf-8','cookie':'token=${cookie}'}
#    log to console      cookie：${COOKIE}
#    log to console      def:${DEFAULT_HEADER}
#
#







