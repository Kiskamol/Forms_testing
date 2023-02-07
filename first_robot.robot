*** setting *** 
Library		SeleniumLibrary

*** variable ***
# ${message}	My message
	${home}=	Get text	xpath=//div[@class='story']/a[@href="listproducts.php?cat=1"]/h3

*** Keyword ***
Say Hello
	Log To Console		ThisIsSayHello

*** Test cases ***
Test print text
	Open Browser		http://testphp.vulnweb.com/login.php	browser=chrome
	Input Text			xpath=//input[@name='uname']	test
	Input Text			xpath=//input[@name='pass']		test
	Click Element		xpath=//input[@type='submit' and @value='login']
	Handle Alert		Accept
	Click Link			xpath=//a[text()='Browse categories']
	# sleep				20s
	Element Text Should Be		xpath=//div[@class='story']/a[@href="listproducts.php?cat=1"]/h3	Posters	
	

	








































