Setup Test
Siapkann project baru misalnya dengan nama robot-framework-in-docker-1 kemudian buat folder di dalamnya dengan nama test. Kemudian buat file untuk testing dengan robot yaitu dengan nama basicChecks.robot isinya adalah sebagai berikut:
*** Keywords ***
printMessage
    [Arguments]    ${arg1}
    Log    ${arg1}
​
*** Test Cases ***
TC-001: Test 1
    printMessage   Robot container running successfully