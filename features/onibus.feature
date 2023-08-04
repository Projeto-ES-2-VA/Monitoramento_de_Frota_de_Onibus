Feature: Gerenciamento de onibus
  As a Usuario do sistema
  I want to registrar, editar e remover um onibus
  So that eu mantenha a frota de onibus atualizada

  Scenario: Registro de onibus no sistema
    Given que eu sou um usuario do sistema
    When eu acesso a pagina de registro de onibus
    And preencho as informacoes do onibus placa 'ABC-1234', modelo 'Volvo 9700', chassi '7y6JXw8Kbj38k4700', capacidade '50', status 'em operação'
    And clico no botao para cadastrar o onibus
    Then vejo uma mensagem de confirmacao de registro do onibus

  Scenario: Edicao de informacoes de um onibus
    Given que eu sou um usuario do sistema
    And existe um onibus registrado com placa 'XYZ-5678'
    When eu acesso a pagina de edicao de onibus para a placa 'XYZ-5678'
    And eu acesso a pagina editar esse onibus
    And atualizo as informacoes do onibus modelo 'Mercedes-Benz O500'
    And clico no botao de atualizacao
    Then vejo uma mensagem de confirmacao de atualizacao das informacoes do onibus

  Scenario: Remocao de um onibus do sistema
    Given que eu sou um usuario do sistema
    And existe um onibus registrado com placa 'XYZ-5678'
    And eu estou na pagina de listagem de onibus
    When eu acesso um onibus em especifico
    And eu clico para excluir o onibus
    Then aparece uma mensagem dizendo que o onibus foi excluido com sucesso

  Scenario: Registro de onibus no sistema com campos vazios
    Given que eu sou um usuario do sistema
    When eu acesso a pagina de registro de onibus
    And clico no botao para cadastrar o onibus
    Then vejo uma mensagem informando que nao e possivel cadastrar o onibus

  Scenario: Edicao do campo placa para um valor invalido
    Given que eu sou um usuario do sistema
    And existe um onibus registrado com placa 'XYZ-5678'
    And eu estou na pagina de listagem de onibus
    When eu acesso um onibus em especifico
    And eu acesso a pagina de editar onibus
    And atualizo as informacoes do onibus placa 'lbltlal'
    And clico no botao de atualizacao
    Then vejo uma mensagem de falha ao tentar atualizar a placa
