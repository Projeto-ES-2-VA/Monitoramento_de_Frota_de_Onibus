Feature: Busca de rotas
  Como um usuário do sistema
  Eu quero buscar as rotas que um ônibus já percorreu informando sua placa
  Para que eu saiba por onde cada ônibus da frota já passou

  Scenario: Busca de rotas de um ônibus com resultado válido
    Given que existem dados de rotas registrados no sistema
    And um ônibus com a placa "ABC-1234" já percorreu algumas rotas
    When eu informo a placa do ônibus com placa "ABC-1234"
    Then o sistema exibe a lista de rotas percorridas pelo ônibus

  Scenario: Busca de rotas de um ônibus com resultado inválido
    Given não existe dados de rotas registrados no sistema
    And um ônibus com a placa "ABC-4321" não percorreu nenhuma rota
    When eu informo a placa do ônibus cadastrado com a placa "ABC-4321"
    Then o sistema exibe uma mensagem que nenhum resultado foi encontrado

  Scenario: Busca de rotas de um ônibus com resultado válido, mas sem rotas cadastradas
    Given que existem dados de rotas registrados no sistema
    And um ônibus com a placa "XYZ-7890" não percorreu nenhuma rota
    When eu informo a placa do ônibus com placa "XYZ-7890"
    Then o sistema exibe uma mensagem informando que o ônibus não possui rotas cadastradas

  Scenario: Busca de rotas de um ônibus com resultado válido, com mais de duas rotas cadastradas
    Given que existem dados de rotas registrados no sistema
    And um ônibus com a placa "DEF-5678" já percorreu várias rotas
    When eu informo a placa do ônibus com placa "DEF-5678"
    Then o sistema exibe a lista de todas as rotas percorridas pelo ônibus

  Scenario: Busca de rotas de um ônibus com resultado válido, com apenas uma rota cadastrada
    Given que existem dados de rotas registrados no sistema
    And um ônibus com a placa "GHI-9012" já percorreu uma única rota
    When eu informo a placa do ônibus com placa "GHI-9012"
    Then o sistema exibe a lista com os detalhes da rota percorrida pelo ônibus