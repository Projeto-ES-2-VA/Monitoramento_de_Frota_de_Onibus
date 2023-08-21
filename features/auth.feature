Feature: Autentificacao
  As a Usuario do sistema
  I want to me registrar, editar, exibir e remover
  So that eu possa controlar todas as acoes do sistema

Scenario: Cadastro de conta
    Given estou na pagina de login
    And entao clico em 'Sign up'
    When estou na pagina de cadastro
    And entao eu preencho 'email' com 'algo@email.com'
    And entao eu preencho 'password' com '12345678'
    And entao eu preencho 'password_confirmation' com '12345678'
    And entao clico em 'Sign up'
    And entao vejo a mensagem 'Welcome! You have signed up successfully.'

Scenario: Login
    Given estou na pagina de login
    And entao clico em 'Sign up'
    When estou na pagina de cadastro
    And entao eu preencho 'email' com 'algo@email.com'
    And entao eu preencho 'password' com '12345678'
    And entao eu preencho 'password_confirmation' com '12345678'
    And entao clico em 'Sign up'
    And entao clico em 'Sign Out'
    And entao eu preencho 'email' com 'algo@email.com'
    And entao eu preencho 'password' com '12345678'
    And entao clico em 'Log in'
    And entao vejo a mensagem 'Signed in successfully.'
