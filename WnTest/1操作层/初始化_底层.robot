*** Settings ***
Library           WnLibraryV3
Library           urllib3
Library           Collections
Library           RequestsLibrary
Resource          通用参数.robot


*** Keywords ***
captcha
# 验证码返回{'verCode':'','verKey':''}
    ${rds_ip}     获取rds_ip
    ${rds_port}     获取rds_port
    ${rds_password}     获取rds_password
    disable_warnings
    Create Session    api    ${HOST}    ${DEFAULT_HEADER}      verify=${False}
    ${Return}   Post Request    api    /sso/sso/captcha     data={}
    status should be    200
    #缺少验证
    ${vercode}      WnRedis_get     ${rds_ip}   ${rds_port}     ${rds_password}     ${Return.json()['data']['key']}
    &{data}     Create Dictionary   verCode=${vercode}      verKey=${Return.json()['data']['key']}
    [Return]    &{data}

用户登录token
#返回token
    [Arguments]     ${username}     ${password}
    ${pswd_enyt}    WnRsa_pswd_encrypt      ${password}
    ${data}      captcha
    set to Dictionary       ${data}      password=${pswd_enyt}   username=${username}
    disable_warnings
    Create Session    api    ${HOST}    ${DEFAULT_HEADER}      verify=${False}
    log to console      用户登录token：${DEFAULT_HEADER}
    ${Return}   Post Request    api    /sso/sso/login     data=${data}
    status should be    200
    [Return]      ${Return.json()['data']['token']}
#    set global variable     ${COOKIE}       ${Return.json()['data']['token']}
#
#指定用户登录token
#    [Arguments]     ${username}     ${password}
#    ${token}    用户登录token    ${username}   ${password}
#    [Return]    ${token}

默认用户登录token
    ${username}     获取default_user
    ${password}     获取default_pswd
    ${token}    用户登录token    ${username}   ${password}
    [Return]    ${token}