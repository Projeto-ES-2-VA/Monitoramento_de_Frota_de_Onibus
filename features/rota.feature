Feature: Busca de rotas
  Como um usuário do sistema
  Eu quero buscar as rotas que um ônibus já percorreu informando sua placa
  Para que eu saiba por onde cada ônibus da frota já passou

  Scenario: Busca de rotas de um ônibus válido
    Given que existem dados de rotas registrados no sistema
    And um ônibus com a placa "ABC-1234" já percorreu algumas rotas
    When eu informo a placa do ônibus como "ABC-1234"
    Then o sistema exibe a lista de rotas percorridas pelo ônibus

  Scenario: Busca de rotas de um ônibus com placa inválida
    Given que existem dados de rotas registrados no sistema
    And um ônibus com a placa "XYZ-9876" já percorreu algumas rotas
    When eu informo a placa do ônibus como "AAA-1111"
    Then o sistema exibe uma mensagem de erro informando que a placa é inválida

  Scenario: Busca de rotas de um ônibus sem histórico de rotas
    Given que existem dados de rotas registrados no sistema
    And um ônibus com a placa "XYZ-9876" ainda não percorreu nenhuma rota
    When eu informo a placa do ônibus como "XYZ-9876"
    Then o sistema exibe uma mensagem informando que o ônibus ainda não possui rotas registradas

  Scenario: Busca de rotas de um ônibus com placa em branco
    Given que existem dados de rotas registrados no sistema
    And um ônibus com a placa "ABC-1234" já percorreu algumas rotas
    When eu informo a placa do ônibus em branco
    Then o sistema exibe uma mensagem de erro informando que a placa deve ser preenchida

  Scenario: Busca de rotas de um ônibus inexistente
    Given que existem dados de rotas registrados no sistema
    And não há registros de um ônibus com a placa "XYZ-9876"
    When eu informo a placa do ônibus como "XYZ-9876"
    Then o sistema exibe uma mensagem informando que o ônibus com essa placa não foi encontrado
