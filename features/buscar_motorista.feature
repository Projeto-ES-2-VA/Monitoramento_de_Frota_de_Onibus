Feature: Busca de motorista
  As a Usuario do sistema
  I want to buscar um motorista pelo seu nome, CPF ou email
  So that eu encontre o motorista ideal para uma rota

  Scenario: buscar motorista por nome
    Given que eu estou na pagina de cadastro de motorista
    And eu preencho "nome" com "Maria Josefa"
    And eu preencho "cpf" com "11578944433"
    And eu preencho "email" com "teste2@cucumber.com"
    And eu preencho "senha" com "456789963@"
    And eu preencho "telefone" com "81998833627"
    And eu preencho "cnh" com "1234567890"
    And clico em "Create Motoristum"
    When eu estou na pagina de busca de motorista
    And digito "Maria Josefa" no campo de busca
    And clico em "Buscar"
    Then como resultado aparece o motorista de "Nome" de "Maria Josefa"

  Scenario: buscar motorista por cpf
    Given que eu estou na pagina de cadastro de motorista
    And eu preencho "nome" com "Maria Josefa"
    And eu preencho "cpf" com "11578944433"
    And eu preencho "email" com "teste2@cucumber.com"
    And eu preencho "senha" com "456789963@"
    And eu preencho "telefone" com "81998833627"
    And eu preencho "cnh" com "1234567890"
    And clico em "Create Motoristum"
    When eu estou na pagina de busca de motorista
    And digito "11578944433" no campo de busca
    And clico em "Buscar"
    Then como resultado aparece o motorista de "Cpf" de "11578944433"

  Scenario: buscar motorista por email
    Given que eu estou na pagina de cadastro de motorista
    And eu preencho "nome" com "Maria Josefa"
    And eu preencho "cpf" com "11578944433"
    And eu preencho "email" com "teste2@cucumber.com"
    And eu preencho "senha" com "456789963@"
    And eu preencho "telefone" com "81998833627"
    And eu preencho "cnh" com "1234567890"
    And clico em "Create Motoristum"
    When eu estou na pagina de busca de motorista
    And digito "teste2@cucumber.com" no campo de busca
    And clico em "Buscar"
    Then como resultado aparece o motorista de "Email" de "teste2@cucumber.com"

  Scenario: buscar motorista por cpf nao cadastrado
    Given que eu estou na pagina de cadastro de motorista
    And eu preencho "nome" com "Maria Josefa"
    And eu preencho "cpf" com "11578944433"
    And eu preencho "email" com "teste2@cucumber.com"
    And eu preencho "senha" com "456789963@"
    And eu preencho "telefone" com "81998833627"
    And eu preencho "cnh" com "1234567890"
    And clico em "Create Motoristum"
    When eu estou na pagina de busca de motorista
    And eu preencho a busca com "11500"
    And clico em "Buscar"
    Then como resultado aparece a mensagem de que nenhum motorista foi encontrado

  Scenario: buscar motorista por email nao cadastrado
    Given que eu estou na pagina de cadastro de motorista
    And eu preencho "nome" com "Maria Josefa"
    And eu preencho "cpf" com "11578944433"
    And eu preencho "email" com "teste2@cucumber.com"
    And eu preencho "senha" com "456789963@"
    And eu preencho "telefone" com "81998833627"
    And eu preencho "cnh" com "1234567890"
    And clico em "Create Motoristum"
    When eu estou na pagina de busca de motorista
    And eu preencho a busca com "inesbrasil@cucumber.com"
    And clico em "Buscar"
    Then como resultado aparece a mensagem de que nenhum motorista foi encontrado
