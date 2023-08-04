Feature: Busca de rotas
  Como um usuario do sistema
  Eu quero buscar as rotas que um onibus ja percorreu informando sua placa
  Para que eu saiba por onde cada onibus da frota ja passou

  Scenario: Busca de rotas de um onibus com resultado valido
    Given dado que existe um onibus com placa "ABC-1234"
    And que existem duas rotas registrados no sistema para a placa "ABC-1234"
    And eu visito a pagina de busca de rotas por onibus
    When eu informo a placa "ABC-1234" do onibus
    Then o sistema exibe a lista de rotas percorridas pelo onibus

  Scenario: Busca de rotas de um onibus com resultado invalido
    Given um onibus com a placa "ABC-4321" nao percorreu nenhuma rota
    When eu informo a placa do onibus cadastrado com a placa "ABC-4321"
    Then o sistema exibe uma mensagem que nenhum resultado foi encontrado

  Scenario: Busca de rotas de um onibus com resultado valido, mas sem rotas cadastradas
    Given que existem dados de rotas registrados no sistema
    And um onibus com a placa "XYZ-7890" nao percorreu nenhuma rota
    When eu informo a placa do onibus com placa "XYZ-7890"
    Then o sistema exibe uma mensagem informando que o onibus nao possui rotas cadastradas

  Scenario: Busca de rotas de um onibus com resultado valido, com mais de duas rotas cadastradas
    Given que existem dados de rotas registrados no sistema
    And um onibus com a placa "DEF-5678" ja percorreu várias rotas
    When eu informo a placa do onibus com placa "DEF-5678"
    Then o sistema exibe a lista de todas as rotas percorridas pelo onibus

  Scenario: Busca de rotas de um onibus com resultado valido, com apenas uma rota cadastrada
    Given que existem dados de rotas registrados no sistema
    And um onibus com a placa "GHI-9012" ja percorreu uma unica rota
    When eu informo a placa do onibus com placa "GHI-9012"
    Then o sistema exibe a lista com os detalhes da rota percorrida pelo onibus
