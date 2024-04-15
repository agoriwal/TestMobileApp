*** Settings ***
Library     AppiumLibrary
Library     Builtin

*** Variables ***

${ANDROID_AUTOMATION_NAME}  UIAutomator2
${ANDROID_APP}
${ANDROID_PLATFORM_NAME}    ANDROID
${ANDROID_PLATFORM_VERSION}
${ANDROID_APP_PACKAGE}
#
#*** Keywords ***
#    [Arguments]     ${appActivity}=${EMPTY}
#    Open Application    http://127.0.0.1:4723   automationName=${ANDROID_AUTOMATION_NAME}  app=${ANDROID_APP}   platformName=${ANDROID_PLATFORM_NAME}   platformVersion=${ANDROID_PLATFORM_VERSION}     appPackage=${ANDROID_APP_PACKAGE}       appActivity=${appActivity}
#
