*** Settings ***
Library           WnLibraryV3
Library           Collections
Library           RequestsLibrary
Resource          通用参数.robot



*** Keywords ***
获取配置文件路径
    ${config_path}      wnconfigini_config_path
#    Run Keyword If  "${config_path}" != ${null}  log     配置文件读取.获取配置文件路径：${CONF_DATA}
    [Return]    ${config_path}

所有配置文件值
    ${config_path}      获取配置文件路径
    ${value_dict}    wnconfigini_get_all     ${config_path}
    set global variable     ${CONF_DATA}    ${value_dict}
    Run Keyword If  "${CONF_DATA}"!=None  log     配置文件读取.所有配置文件值获取成功：${CONF_DATA}
#    log to console      ${CONF_DATA}

获取配置文件
    [Arguments]     ${section}     ${option}
    #    获取已经获取过一次配置文件则不在执行
    Run Keyword If  "${CONF_DATA}"==""    所有配置文件值
    [Return]    ${CONF_DATA}[${section}][${option}]

获取host地址
    ${value}    获取配置文件      server      host
    [Return]    ${value}


获取default_user
    ${value}    获取配置文件      server      default_user
    [Return]    ${value}

获取default_pswd
    ${value}    获取配置文件      server      default_pswd
    [Return]    ${value}

获取数据库ip
    ${value}    获取配置文件      database      db_ip
    [Return]    ${value}

获取数据库port
    ${value}    获取配置文件      database      db_port
    [Return]    ${value}

获取数据库username
    ${value}    获取配置文件      database      db_username
    [Return]    ${value}

获取数据库password
    ${value}    获取配置文件      database      db_password
    [Return]    ${value}

获取rds_ip
    ${value}    获取配置文件      redis      rds_ip
    [Return]    ${value}

获取rds_port
    ${value}    获取配置文件      redis      rds_port
    [Return]    ${value}

获取rds_password
    ${value}    获取配置文件      redis      rds_password
    [Return]    ${value}

