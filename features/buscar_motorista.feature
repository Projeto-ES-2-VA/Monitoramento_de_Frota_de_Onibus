Feature: Busca de motorista
  As a Usuario do sistema
  I want to buscar um motorista pelo seu nome, CPF ou email
  So that eu encontre o motorista ideal para uma rota

  Scenario: buscar motorista por nome
    Given que eu estou na pagina de cadastro de motorista
    And preencho o nome do motorista: "Maria Josefa"
    And preencho o cpf: "11578944433"
    And preencho o email: "teste2@cucumber.com"
    And preencho a senha: "456789963@"
    And preencho o telefone: "81998833627"
    And preencho o cnh: "1234567890"
    And clico em criar um motorista
    When o usuario esta na pagina de busca de motorista
    And digita o nome do motorista que deseja buscar
    And clica no botao buscar
    Then aparece o motorista desejado

  Scenario: buscar motorista por cpf
    Given que eu estou na pagina de cadastro de motorista
    And preencho o nome do motorista: "Maria Josefa"
    And preencho o cpf: "11578944433"
    And preencho o email: "teste2@cucumber.com"
    And preencho a senha: "456789963@"
    And preencho o telefone: "81998833627"
    And preencho o cnh: "1234567890"
    And clico em criar um motorista
    And o usuario esta na pagina de busca de motorista
    And digita o cpf do motorista que deseja buscar
    And clica no botao buscar
    Then aparece o motorista desejado buscado por cpf

  Scenario: buscar motorista por email
    Given que eu estou na pagina de cadastro de motorista
    And preencho o nome do motorista: "Maria Josefa"
    And preencho o cpf: "11578944433"
    And preencho o email: "teste2@cucumber.com"
    And preencho a senha: "456789963@"
    And preencho o telefone: "81998833627"
    And preencho o cnh: "1234567890"
    And clico em criar um motorista
    And o usuario esta na pagina de busca de motorista
    And digita o email do motorista que deseja buscar
    And clica no botao buscar
    Then aparece o motorista desejado buscado por email

  Scenario: buscar motorista por cpf nao cadastrado
    Given que eu estou na pagina de cadastro de motorista
    And preencho o nome do motorista: "Maria Josefa"
    And preencho o cpf: "11578944433"
    And preencho o email: "teste2@cucumber.com"
    And preencho a senha: "456789963@"
    And preencho o telefone: "81998833627"
    And preencho o cnh: "1234567890"
    And clico em criar um motorista
    And o usuario esta na pagina de busca de motorista
    And digita um cpf que nao existe no banco de dados
    And clica no botao buscar
    Then aparece a mensagem de que nenhum motorista foi encontrado

  Scenario: buscar motorista por email nao cadastrado
    Given que eu estou na pagina de cadastro de motorista
    And preencho o nome do motorista: "Maria Josefa"
    And preencho o cpf: "11578944433"
    And preencho o email: "teste2@cucumber.com"
    And preencho a senha: "456789963@"
    And preencho o telefone: "81998833627"
    And preencho o cnh: "1234567890"
    And clico em criar um motorista
    And o usuario esta na pagina de busca de motorista
    And digita um email que nao existe no banco de dados
    And clica no botao buscar
    Then aparece a mensagem de que nenhum motorista foi encontrado
