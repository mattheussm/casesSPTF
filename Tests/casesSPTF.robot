***Settings***
Library     SeleniumLibrary
Library     FakerLibrary
Resource        ../resources/base_sptf.robot

***Test Cases***
SignUp spotify
    [Tags]      signup
    New session
    
    Click on SignUp button
    Page Should Contain     Inscrever-se

    SignUp With email
    Click on Submit Button

    Page Should Contain     Crie uma senha
    Set up new password
    Click on Submit Button

    Page Should Contain     Fale de você
    Finish sign up
    Click on Submit Button

    Page Should Contain     Termos e Condições
    Agree with terms and conditions
    Click on Submit Button

    Home Page
    Logout

Signup Without Email
    [Tags]      signup_without_email
    New session

    Click on SignUp button
    Page Should Contain     Inscrever-se

    Error No Email

Signup Without Password
    [Tags]      signup_without_password
    New session

    Click on SignUp button
    Page Should Contain     Inscrever-se

    SignUp With email
    Click on Submit Button

    Error Must Create a Password

Password With Less Than 8 Characters
    [Tags]      password_less_characters
    New session

    Click on SignUp button
    Page Should Contain     Inscrever-se

    SignUp With email
    Click on Submit Button

    Must Have 8 Characters

Weak Password
    [Tags]      weak_password
    New session

    Click on SignUp button
    Page Should Contain     Inscrever-se

    SignUp With email
    Click on Submit Button

    Password Must be Stronger

Signup Without Name
    [Tags]      signup_without_name
    New session
    
    Click on SignUp button
    Page Should Contain     Inscrever-se

    SignUp With email
    Click on Submit Button

    Page Should Contain     Crie uma senha
    Set up new password
    Click on Submit Button

    Page Should Contain     Fale de você
    Must Have a Name

Signup Without Birth Date
    [Tags]      signup_without_birthdate
    New session
    
    Click on SignUp button
    Page Should Contain     Inscrever-se

    SignUp With email
    Click on Submit Button

    Page Should Contain     Crie uma senha
    Set up new password
    Click on Submit Button

    Page Should Contain     Fale de você
    Must Have Birth Date

Signup Without Day
    [Tags]      signup_without_day
    New session
    
    Click on SignUp button
    Page Should Contain     Inscrever-se

    SignUp With email
    Click on Submit Button

    Page Should Contain     Crie uma senha
    Set up new password
    Click on Submit Button

    Page Should Contain     Fale de você
    Must Insert a Day

Signup Without Month
    [Tags]      signup_without_month
    New session
    
    Click on SignUp button
    Page Should Contain     Inscrever-se

    SignUp With email
    Click on Submit Button

    Page Should Contain     Crie uma senha
    Set up new password
    Click on Submit Button

    Page Should Contain     Fale de você
    Select a Month

Signup Without Gender
    [Tags]      signup_without_gender
    New session
    
    Click on SignUp button
    Page Should Contain     Inscrever-se

    SignUp With email
    Click on Submit Button

    Page Should Contain     Crie uma senha
    Set up new password
    Click on Submit Button

    Page Should Contain     Fale de você
    Must Select a Gender

Register Without Agree with Terms
    [Tags]      register_without_terms
    New session
    
    Click on SignUp button
    Page Should Contain     Inscrever-se

    SignUp With email
    Click on Submit Button

    Page Should Contain     Crie uma senha
    Set up new password
    Click on Submit Button

    Page Should Contain     Fale de você
    Finish sign up
    Click on Submit Button

    Page Should Contain     Termos e Condições
    Click on Submit Button

    Must Check Terms and conditions

Login With Email
    [Tags]      login_ok
    New session

    Click on SignUp button
    Page Should Contain     Inscrever-se

    SignUp With email
    Click on Submit Button

    Page Should Contain     Crie uma senha
    Set up new password
    Click on Submit Button

    Page Should Contain     Fale de você
    Finish sign up
    Click on Submit Button

    Page Should Contain     Termos e Condições
    Agree with terms and conditions
    Click on Submit Button

    Home Page
    Logout

    Click on Login Button
    Page Should Contain     Entrar no Spotify

    Login With      ${email}     ${password}
    Don't remind me

    Click on Login Button

    Home Page

Login With Wrong Email
    [Tags]      login_wrong_email

    New session
    Click on Login Button
    Page Should Contain     Entrar no Spotify

    Login With      emailerradoteste@gmail.com     Teste123@#s
    Don't remind me

    Click on Login In Button
    Message Error Login

Login Without Email
    [Tags]      login_without_email

    New session
    Click on Login Button
    Page Should Contain     Entrar no Spotify

    Login Without Email                         


