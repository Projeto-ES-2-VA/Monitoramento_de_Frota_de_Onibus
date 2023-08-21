Feature: Gerenciamento de onibus
  As a Usuario do sistema
  I want to registrar, editar e remover um onibus
  So that eu mantenha a frota de onibus atualizada

  Scenario: Registro de onibus no sistema
    Given que eu acesso a pagina de registro de onibus
    And entao preencho "placa" com "ABC-1234"
    And entao preencho "modelo" com "Volvo 9700"
    And entao preencho "chassi" com "7y6JXw8Kbj38k4700"
    And entao preencho "capacidade" com "50"
    And entao seleciono "em operação" como "status"
    And clico em um botao "Create Onibus"
    Then vejo a mensagem "Onibus was successfully created."

  Scenario: Edicao de informacoes de um onibus
    Given que eu acesso a pagina de registro de onibus
    And entao preencho "placa" com "ABC-1234"
    And entao preencho "modelo" com "Volvo 9700"
    And entao preencho "chassi" com "7y6JXw8Kbj38k4700"
    And entao preencho "capacidade" com "50"
    And entao seleciono "em operação" como "status"
    And clico em um botao "Create Onibus"
    When eu acesso a pagina de visualizacao do onibus com a placa "ABC-1234"
    And eu clico no link "Edit this onibus"
    And entao preencho "modelo" com "Mercedes-Benz O500"
    And clico em um botao "Update Onibus"
    Then vejo a mensagem "Onibus was successfully updated."

  Scenario: Remocao de um onibus do sistema
    Given que eu acesso a pagina de registro de onibus
    And entao preencho "placa" com "ABC-1234"
    And entao preencho "modelo" com "Volvo 9700"
    And entao preencho "chassi" com "7y6JXw8Kbj38k4700"
    And entao preencho "capacidade" com "50"
    And entao seleciono "em operação" como "status"
    And clico em um botao "Create Onibus"
    When eu acesso a pagina de visualizacao do onibus com a placa "ABC-1234"
    And clico em um botao "Destroy this onibus"
    Then vejo a mensagem "Onibus was successfully destroyed."

  Scenario: Registro de onibus no sistema com campos vazios
    Given que eu acesso a pagina de registro de onibus
    And entao preencho "placa" com ""
    And entao preencho "modelo" com ""
    And entao preencho "chassi" com "78k4700"
    And entao preencho "capacidade" com "5"
    And entao seleciono "em operação" como "status"
    And clico em um botao "Create Onibus"
    Then vejo a mensagem "errors prohibited this onibus from being saved:"

  Scenario: Edicao do campo placa para um valor invalido
    Given que eu acesso a pagina de registro de onibus
    And entao preencho "placa" com "ABC-1234"
    And entao preencho "modelo" com "Volvo 9700"
    And entao preencho "chassi" com "7y6JXw8Kbj38k4700"
    And entao preencho "capacidade" com "50"
    And entao seleciono "em operação" como "status"
    And clico em um botao "Create Onibus"
    When eu acesso a pagina de visualizacao do onibus com a placa "ABC-1234"
    And eu clico no link "Edit this onibus"
    And entao preencho "placa" com "kakak"
    And clico em um botao "Update Onibus"
    Then vejo a mensagem "Placa is invalid"
