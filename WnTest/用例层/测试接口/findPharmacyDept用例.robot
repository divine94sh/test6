*** Settings ***
Library           WnLibraryV3
Library           RequestsLibrary
Resource          findPharmacyDept入参.robot
Resource          ../../1操作层/初始化操作.robot
Resource          ../../1操作层/数据库操作.robot
Resource          ../../接口层/findPharmacyDept接口.robot
Suite Setup     {初始化host地址}


*** Test Cases ***
用户登录
    {默认用户登录初始化}

findPharmacyDept_正确入参
    ${Return}       findPharmacyDept      ${data_001}
    ${data}     数据库查询_行数       pharmacy_org    SELECT * FROM `pharmacy_dept`
    should be equal as strings     ${Return['code']}   1
    should be equal     ${Return['msg']}   操作成功
    should be equal     ${Return['data']['total']}      ${data}

findPharmacyDept_data未传
    ${Return}       findPharmacyDept      ${data_002}
#    ${data}     数据库查询_行数       pharmacy_org    SELECT * FROM `pharmacy_dept`
    should be equal as strings    ${Return['code']}   0
    should be equal     ${Return['msg']}   页码不能为空
    should be equal     ${Return['data']}      ${None}






