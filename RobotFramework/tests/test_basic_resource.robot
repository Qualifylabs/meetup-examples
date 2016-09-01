*** Settings ***
Library  AppiumLibrary

*** Variables ***
${PLATFORM_NAME}  ANDROID
${PLATFORM_VERSION}  ${EMPTY}
${DEVICE_NAME}  <local_device_id_here>
${APP_PACKAGE}  ${EMPTY}
${APP_ACTIVITY}  ${EMPTY}
${APP}  ${CURDIR}${/}..${/}..${/}apps${/}ContactManager.apk
${REMOTE_URL}  http://127.0.0.1:4723/wd/hub
${BROWSER_NAME}  ${EMPTY}
${contact_name}  id=contactNameEditText
${contact_email}  id=contactEmailEditText

*** Keywords ***
Open App
  ${app1}  open application  ${REMOTE_URL}  platformName=${PLATFORM_NAME}  platformVersion=${PLATFORM_VERSION}
  ...  app=${APP}   deviceName=${DEVICE_NAME}  automationName=Appium  appPackage=${APP_PACKAGE}
  ...  appActivity=${APP_ACTIVITY}  newCommandTimeout=${1000}

Go To New Contact Add
  wait until page contains element  id=Add Contact
  click element  id=Add Contact

Fill Form with mandatory fields
  input text  ${contact_name}  Appium User
  input text  ${contact_email}  someone@appium.io
  capture page screenshot
  element name should be  ${contact_name}  Appium User
  element name should be  ${contact_email}  someone@appium.io
  hide keyboard
  click element  id=Save
  capture page screenshot

Verify new contact added
  wait until page contains  Appium User
  capture page screenshot