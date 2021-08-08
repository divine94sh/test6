*** Settings ***
Library           WnLibraryV3
Library           RequestsLibrary
#Resource          通用参数.robot
Resource          配置文件读取.robot


*** Keywords ***
数据库查询
    [Arguments]     ${db_name}      ${sql}
    ${db_ip}    获取数据库ip
    ${db_port}    获取数据库port
    ${db_username}    获取数据库username
    ${db_password}    获取数据库password
    ${return}       wnmysql_get     ${db_ip}    ${db_port}  ${db_username}  ${db_password}  ${db_name}  ${sql}
    [Return]    ${return}

数据库查询_行数
    [Arguments]     ${db_name}      ${sql}
    ${db_ip}    获取数据库ip
    ${db_port}    获取数据库port
    ${db_username}    获取数据库username
    ${db_password}    获取数据库password
    ${return}       wnmysql_get_len    ${db_ip}    ${db_port}  ${db_username}  ${db_password}  ${db_name}  ${sql}
    [Return]    ${return}
