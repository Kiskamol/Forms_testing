***Settings***
Library     SeleniumLibrary

***Variables***
${apply}=              xpath=//div[@class='action']/a[text()='สนใจสมัคร']
${next}=               xpath=//div[@class='action']/button[@id='p1btn-next']
${disable_button}=     btn disabled-action
${name}=               John Doe
${tel_number}=         0984565223
${id_number}=          3985063180732
${false_tel_number}=   123456789
${false_id_number}=    1234567891234
${tel_number_input}=   xpath=//div[@data-for='ptel']/input
${id_number_input}=    xpath=//div[@data-for='pcomid']/input

***Keywords***
Open Webpage
    Open Browser        https://uat.kasikornbank.com/th/business/sme/financial-services/collection-solutions/pages/edc.aspx     browser=chrome
    Maximize Browser Window
Should be disable button
    Element Attribute Value Should Be      ${next}      class      ${disable_button}
Click apply
    Click Element        ${apply}
Click next    
    Click Button         ${next}

***Test Cases***
TC001 - Check if blank data can't submit 
    Open Webpage        
    Click apply        
    Should be disable button  

TC002 - Check if invalid data can't submit 
    Open Webpage
    Input text     ${tel_number_input}      ${false_tel_number}           
    Input text     ${id_number_input}       ${false_id_number}
    Should be disable button

TC003 - Check if valid data can submit forms
    Open Webpage
    Input text     ${tel_number_input}      ${tel_number}           
    Input text     ${id_number_input}       ${id_number}
    Click next     
    Wait Until Element Is Visible           id=pname
    Click Element  xpath=//span[@id="select2-pprovince-container"]
    Mouse Down     xpath=//span[@class="select2-results"]/ul/li[text()='กรุงเทพมหานคร']
    Click Element  xpath=//span[@class="select2-results"]/ul/li[text()='กรุงเทพมหานคร']
    Element Attribute Value Should Be       id=select2-pprovince-container  title   กรุงเทพมหานคร 
    Click Element  xpath=//span[@id="select2-pdistrict-container"]
    Mouse Down     xpath=//span[@class="select2-results"]/ul/li[text()='เขตพระนคร']
    Click Element  xpath=//span[@class="select2-results"]/ul/li[text()='เขตพระนคร']
    Element Attribute Value Should Be       id=select2-pdistrict-container  title    เขตพระนคร
    Click Element  xpath=//span[@id="select2-pbranch-container"]        
    Mouse Down     xpath=//span[@class="select2-results"]/ul/li[text()='สาขาเสาชิงช้า']
    Click Element  xpath=//span[@class="select2-results"]/ul/li[text()='สาขาเสาชิงช้า']
    Element Attribute Value Should Be       id=select2-pbranch-container    title      สาขาเสาชิงช้า
    Click Element  xpath=//span[@id="select2-ptime-container"]
    Mouse Down     xpath=//span[@class="select2-results"]/ul/li[text()='08.00 - 11.00']
    Click Element  xpath=//span[@class="select2-results"]/ul/li[text()='08.00 - 11.00']
    Element Attribute Value Should Be       id=select2-ptime-container      title   08.00 - 11.00
     
    