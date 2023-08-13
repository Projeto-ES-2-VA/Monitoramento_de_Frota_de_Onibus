Feature: Busca de motorista
  As a Usuario do sistema
  I want to buscar um motorista pelo seu nome, CPF ou email
  So that eu encontre o motorista ideal para uma rota

  Scenario: buscar motorista por nome
    Given o motorista de nome: "Maria Josefa", cpf: "11578944433", email: "teste2@cucumber.com", senha: "456789963@", telefone: "81998833627", e cnh: "1234567890" foi criado
    And o usuario esta na pagina de busca de motorista
    And digita o nome do motorista que deseja buscar
    And clica no botao buscar
    Then aparece o motorista desejado

  Scenario: buscar motorista por cpf
    Given o motorista de nome: "Maria Josefa", cpf: "11578944433", email: "teste2@cucumber.com", senha: "456789963@", telefone: "81998833627", e cnh: "1234567890" foi criado
    And o usuario esta na pagina de busca de motorista
    And digita o cpf do motorista que deseja buscar
    And clica no botao buscar
    Then aparece o motorista desejado buscado por cpf

  Scenario: buscar motorista por email
    Given o motorista de nome: "Maria Josefa", cpf: "11578944433", email: "teste2@cucumber.com", senha: "456789963@", telefone: "81998833627", e cnh: "1234567890" foi criado
    And o usuario esta na pagina de busca de motorista
    And digita o email do motorista que deseja buscar
    And clica no botao buscar
    Then aparece o motorista desejado buscado por email

  Scenario: buscar motorista por cpf nao cadastrado
    Given o motorista de nome: "Maria Josefa", cpf: "11578944433", email: "teste2@cucumber.com", senha: "456789963@", telefone: "81998833627", e cnh: "1234567890" foi criado
    And o usuario esta na pagina de busca de motorista
    And digita um cpf que nao existe no banco de dados
    And clica no botao buscar
    Then aparece a mensagem de que nenhum motorista foi encontrado

  Scenario: buscar motorista por email nao cadastrado
    Given o motorista de nome: "Maria Josefa", cpf: "11578944433", email: "teste2@cucumber.com", senha: "456789963@", telefone: "81998833627", e cnh: "1234567890" foi criado
    And o usuario esta na pagina de busca de motorista
    And digita um email que nao existe no banco de dados
    And clica no botao buscar
    Then aparece a mensagem de que nenhum motorista foi encontrado
