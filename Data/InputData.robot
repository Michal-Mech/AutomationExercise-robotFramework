*** Variables ***
${BROWSER} =            chrome
${START_URL} =          https://automationexercise.com/
${SEARCH_TERM} =        shirt

# TC1 - Register User data
${USER_NAME} =          TestUser
${USER_EMAIL} =         testuser_auto@test.com
${USER_PASSWORD} =      Test@12345
${FIRST_NAME} =         Test
${LAST_NAME} =          User
${ADDRESS} =            123 Test Street
${COUNTRY} =            United States
${STATE} =              California
${CITY} =               Los Angeles
${ZIPCODE} =            90001
${MOBILE} =             1234567890
${DOB_DAY} =            15
${DOB_MONTH} =          June
${DOB_YEAR} =           1990

# TC3 - Login with incorrect credentials
${WRONG_EMAIL} =        wronguser@test.com
${WRONG_PASSWORD} =     WrongPass123

# TC10 - Subscription
${SUBSCRIPTION_EMAIL} =     subscribe_test@test.com

# TC6 - Contact Us Form
${CONTACT_NAME} =       Test User
${CONTACT_EMAIL} =      contact_test@test.com
${CONTACT_SUBJECT} =    Test Subject
${CONTACT_MESSAGE} =    This is a test message sent by automation.
${UPLOAD_FILE_PATH} =   ${CURDIR}${/}TestFiles${/}test_upload.txt

# API Test Data
${API_BASE_URL} =       https://automationexercise.com
${SEARCH_PRODUCT} =     shirt