*** Settings ***
Resource  test_basic_resource.robot
Test Setup  Open App
Test Teardown  Close Application

*** Test Cases ***
Add to new contact successfully1
  [Documentation]  Add a new contact, fill form and verify added contact
  Go to New Contact Add
  Fill Form with mandatory fields
  Verify new contact added