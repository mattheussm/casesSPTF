***Settings***
Library     SeleniumLibrary
Library     FakerLibrary

***Variables***
${url}      https://open.spotify.com/intl-pt?
${EMAILFAKE}        FakerLibrary.Email

***Keywords***
New session
    Open Browser        ${url}      chrome

Click on SignUp button
    Click Element       xpath=//button[@class="Button-sc-1dqy6lx-0 eOxaqu sibxBMlr_oxWTfBrEz2G"]

Click on Submit Button      #this keyword belongs to Next button in signup form
    Sleep       1
    Click Element       xpath=//button[@data-testid="submit"]

SignUp With email
    Wait Until Element Is Visible       xpath=//input[@id="username"]       10      #this xpath belongs do text box that isn`t visible for a while
    ${EMAILFAKE}        FakerLibrary.Email     #Creating a fake random email with faker library
    Set Global Variable     ${email}        ${EMAILFAKE}        #Setting up a variable that receives and saves the email generated
    Input Text      xpath=//input[@id="username"]      ${EMAILFAKE}

Set up new password
    Wait Until Element Is Visible       xpath=//input[@id="new-password"]       10
    ${PASSWORDFAKE}     FakerLibrary.Password       #Creating a random password with faker library
    Set Global Variable     ${password}     ${PASSWORDFAKE}               #Setting up a variable that receives and saves the password generated
    Input Text      xpath=//input[@id="new-password"]       ${PASSWORDFAKE}

Finish sign up
    Wait Until Element Is Visible       xpath=//input[@name="displayName"]      10
    ${NOMEFAKE}     FakerLibrary.Name
    Input Text      xpath=//input[@name="displayName"]      ${NOMEFAKE}

    ${DATAFAKE}     FakerLibrary.Date       #The Birth Date is made of two inputs and one combobox
    Input Text      xpath=//input[@id="day"]        ${DATAFAKE}

    Select From List By Label       xpath=//select[@id="month"]     janeiro

    ${random_year}=     Evaluate        random.randint(1900, 2005)      #generating an year where the user is greater than 18 years old
    Input Text      xpath=//input[@id="year"]      ${random_year}      #using the variable with the random year
    Log     ${random_year}

    Click Element       xpath=//label[@for="gender_option_male"]        #Here the robot is selecting one of the radio button options

Agree with terms and conditions     #There's only one required checkbox to finish up the register
    Wait Until Element Is Visible       xpath=//label[@for="terms-conditions-checkbox"]/span[@class="Indicator-sc-1airx73-0 jCsyxi"]        10
    Click Element       xpath=//label[@for="terms-conditions-checkbox"]/span[@class="Indicator-sc-1airx73-0 jCsyxi"]

Home Page
    Wait Until Element Is Visible       xpath=//span[contains(text(), "Início")]        10

Logout
    Click Element       xpath=//button[@data-testid="user-widget-link"]
    CLick Element       xpath=//button[@data-testid="user-widget-dropdown-logout"]

Click on Login Button       #The login button has a similar xpath to signup button
    Wait Until Element Is Visible       xpath=//button[@data-testid="login-button"]     10
    Click Element       xpath=//button[@data-testid="login-button"]
    Sleep       1

Login With
    [Arguments]     ${email}        ${password}     #Those variables came from the signup form when the faker library generated random email and password
    Wait Until Element Is Visible       xpath=//input[@id="login-username"]     10
    Input Text      xpath=//input[@id="login-username"]     ${email}

    Input Text      xpath=//input[@id="login-password"]     ${password}

Don't remind me     #key to remember the credentials for the next time
    Click Element       xpath=//span[@class="Wrapper-sc-16y5c87-0 imHfsA"]

Message Error Login     #validating the error message when the user tries to sign in with wrong email or password
    Wait Until Element Is Visible       xpath=//div[@data-encore-id="banner"]       10
    Page Should Contain     Nome de usuário ou senha incorretos.

Login Without Email
    Wait Until Element Is Visible    xpath=//input[@id="login-username"]        10
    Input Text                       xpath=//input[@id="login-username"]        Teste teste teste
    Press Keys                       xpath=//input[@id="login-username"]        CTRL+a+BACKSPACE        #erasing the text in the text box
    Wait Until Element Is Visible    xpath=//div[@data-testid="username-error"]     10
    Page Should Contain              Insira seu nome de usuário ou endereço de e-mail do Spotify.       #validating the error message

Error No Email                     #trying to register a new user without email
    Wait Until Element Is Visible    xpath=//input[@id="username"]      10      #this xpath belongs to text box that isn`t visible for a while
    Click Element                    xpath=//button[@data-testid="submit"]

    Wait Until Element Is Visible    xpath=//div[@id="username-error-message"]      10
    Page Should Contain              Esse e-mail é inválido. O formato correto é assim: exemplo@email.com

Error Must Create a Password
    Wait Until Element Is Visible       xpath=//input[@id="new-password"]       10
    Click Element                    xpath=//button[@data-testid="submit"]

    Wait Until Element Is Visible       xpath=//div[@id="password-error-message"]       10
    Page Should Contain     A senha deve ter pelo menos 8 caracteres.

Password Must Have 8 Characters
    Wait Until Element Is Visible       xpath=//input[@id="new-password"]       10
    Input Text      xpath=//input[@id="new-password"]       As1@

    Click Element                    xpath=//button[@data-testid="submit"]

Message Error Must Have 8 Characters
    Wait Until Element Is Visible       xpath=//div[@id="password-error-message"]       10
    Page Should Contain     A senha deve ter pelo menos 8 caracteres.

Must Have a Name
    ${DATAFAKE}     FakerLibrary.Date       #The Birth Date is made of two inputs and one combobox
    Input Text      xpath=//input[@id="day"]        ${DATAFAKE}

    Select From List By Label       xpath=//select[@id="month"]     janeiro

    ${random_year}=     Evaluate        random.randint(1900, 2005)      #generating an year where the user is greater than 18 years old
    Input Text      xpath=//input[@id="year"]      ${random_year}      #using the variable with the random year
    Log     ${random_year}

    Click Element       xpath=//label[@for="gender_option_male"]        #Here the robot is selecting one of the radio button options

    Click Element                    xpath=//button[@data-testid="submit"]      #I already put the click on Next button because the validation depends on this path to confirm the error message

Message Error Must Have a Name
    Wait Until Element Is Visible       xpath=//div[@id="displayname-error-message"]        10
    Page Should Contain     Insira um nome para seu perfil.

Must Have Birth Date
    Wait Until Element Is Visible       xpath=//input[@name="displayName"]      10
    ${NOMEFAKE}     FakerLibrary.Name
    Input Text      xpath=//input[@name="displayName"]      ${NOMEFAKE}

    Click Element       xpath=//label[@for="gender_option_male"]        #Here the robot is selecting one of the radio button options

    Click Element                    xpath=//button[@data-testid="submit"]      #I already put the click on Next button because the validation depends on this path to confirm the error message

Message Error Must Have a Birth Date
    Wait Until Element Is Visible       xpath=//div[@id="birthdate-error-invalid"]        10
    Page Should Contain     Insira sua data de nascimento.

Must Select a Gender
    Wait Until Element Is Visible       xpath=//input[@name="displayName"]      10
    ${NOMEFAKE}     FakerLibrary.Name
    Input Text      xpath=//input[@name="displayName"]      ${NOMEFAKE}

    ${DATAFAKE}     FakerLibrary.Date       #The Birth Date is made of two inputs and one combobox
    Input Text      xpath=//input[@id="day"]        ${DATAFAKE}

    Select From List By Label       xpath=//select[@id="month"]     janeiro

    ${random_year}=     Evaluate        random.randint(1900, 2005)      #generating an year where the user is greater than 18 years old
    Input Text      xpath=//input[@id="year"]      ${random_year}      #using the variable with the random year
    Log     ${random_year}

    Click Element                    xpath=//button[@data-testid="submit"]      #I already put the click on Next button because the validation depends on this path to confirm the error message

Message Error Must Select a Gender    
    Wait Until Element Is Visible       xpath=//div[@id="gender-error-message"]     10
    Page Should Contain     Selecione seu gênero

Password Must be Stronger
    Wait Until Element Is Visible       xpath=//input[@id="new-password"]       10
    Input Text      xpath=//input[@id="new-password"]       12345678

    Click Element       xpath=//button[@data-testid="submit"]

    Wait Until Element Is Visible       xpath=//div[@id="password-error-message"]       10
    Page Should Contain     Sua senha é muito fraca. Escolha uma opção mais forte.

Must Insert a Day
    Wait Until Element Is Visible       xpath=//input[@name="displayName"]      10
    ${NOMEFAKE}     FakerLibrary.Name
    Input Text      xpath=//input[@name="displayName"]      ${NOMEFAKE}

    Select From List By Label       xpath=//select[@id="month"]     janeiro

    ${random_year}=     Evaluate        random.randint(1900, 2005)      #generating an year where the user is greater than 18 years old
    Input Text      xpath=//input[@id="year"]      ${random_year}      #using the variable with the random year
    Log     ${random_year}

    Click Element       xpath=//label[@for="gender_option_male"]        #Here the robot is selecting one of the radio button options

    Click Element                    xpath=//button[@data-testid="submit"]      #I already put the click on Next button because the validation depends on this path to confirm the error message

Message Error Must Insert a Day    
    Wait Until Element Is Visible       xpath=//div[@id="birthdate-error-day_invalid"]     10
    Page Should Contain     Insira o dia que você nasceu usando um número entre 1 e 31.

Select a Month
    Wait Until Element Is Visible       xpath=//input[@name="displayName"]      10
    ${NOMEFAKE}     FakerLibrary.Name
    Input Text      xpath=//input[@name="displayName"]      ${NOMEFAKE}

    ${DATAFAKE}     FakerLibrary.Date       #The Birth Date is made of two inputs and one combobox
    Input Text      xpath=//input[@id="day"]        ${DATAFAKE}

    ${random_year}=     Evaluate        random.randint(1900, 2005)      #generating an year where the user is greater than 18 years old
    Input Text      xpath=//input[@id="year"]      ${random_year}      #using the variable with the random year
    Log     ${random_year}

    Click Element       xpath=//label[@for="gender_option_male"]        #Here the robot is selecting one of the radio button options

    Click Element                    xpath=//button[@data-testid="submit"]

Message Error Select a Month
    Wait Until Element Is Visible       xpath=//div[@id="birthdate-error-month_invalid"]        10
    Page Should Contain         Selecione o mês de nascimento.

Must Check Terms and conditions
    Wait Until Element Is Visible       xpath=//div[@id="tc-error-message"]     10
    Page Should Contain     Aceite os termos e condições para continuar.