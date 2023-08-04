Feature: Gerenciamento de onibus
  As a Usuario do sistema
  I want to registrar, editar e remover um onibus
  So that eu mantenha a frota de onibus atualizada

  Scenario: Registro de onibus no sistema
    Given que eu sou um usuario do sistema
    When eu acesso a pagina de registro de onibus
    And preencho as informacoes do onibus placa 'ABC-1234', modelo 'Volvo 9700', chassi '1111111111111111', capacidade '50', status 'em operacao'
    And clico no botao de registro
    Then vejo uma mensagem de confirmacao de registro do onibus

  Scenario: Edicao de informacoes de um onibus
    Given que eu sou um Usuario do sistema
    And existe um onibus registrado com placa 'XYZ-5678'
    When eu acesso a pagina de edicao de onibus para a placa 'XYZ-5678'
    And atualizo as informacoes do onibus modelo 'Mercedes-Benz O500'
    And clico no botao de atualizacao
    Then vejo uma mensagem de confirmacao de atualizacao das informacoes do onibus

  Scenario: Remocao de um onibus do sistema
    Given que eu sou um Usuario do sistema
    And existe um onibus registrado com placa 'JKL-9012'
    When eu acesso a pagina de gerenciamento de onibus
    And seleciono a opcao de remover o onibus com placa 'JKL-9012'
    And confirmo a remocao
    Then vejo uma mensagem de confirmacao de remocao do onibus

  Scenario: Registro de onibus no sistema com campos vazios
    Given que eu sou um Usuario do sistema
    When eu acesso a pagina de registro de onibus
    And clico no botao de registro
    Then vejo uma mensagem informando que nao e possivel cadastrar o onibus

  Scenario: Edicao do campo placa para um valor invalido
    Given que eu sou um Usuario do sistema
    And existe um onibus registrado com placa 'XYZ5678'
    When eu acesso a pagina de edicao de onibus para a placa 'XYZ-5678'
    And atualizo as informacoes do onibus placa 'lbltlal'
    And clico no botao de atualizacao
    Then vejo uma mensagem de falha ao tentar atualizar a placa

