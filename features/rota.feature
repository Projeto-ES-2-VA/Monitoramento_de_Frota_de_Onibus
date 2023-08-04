Feature: Buscar rotas
  Como um usuario do sistema
  Eu quero Buscar as rotas que um onibus ja percorreu informando sua placa
  Para que eu saiba por onde cada onibus da frota ja passou

  Scenario: Buscar rotas de um onibus
    Given dado que existe um onibus com placa "ABC-1234"
    Given que existem duas rotas registrados no sistema para a placa "ABC-1234"
    And eu visito a pagina de buscar rotas por onibus
    When eu informo a placa "ABC-1234" do onibus
    Then o sistema exibe a lista de rotas percorridas pelo onibus

  Scenario: Buscar rotas sem nenhum onibus cadastrado
    Given eu visito a pagina de buscar rotas por onibus
    And eu clico no botao buscar
    Then o sistema exibe uma mensagem informando que nenhum resultado foi encontrado

  Scenario: Buscar rotas de um onibus que nao possui rotas
    Given dado que existe um onibus com placa "XYZ-7890"
    Given eu visito a pagina de buscar rotas por onibus
    When eu informo a placa "XYZ-7890" do onibus
    Then o sistema exibe uma mensagem informando que nenhum resultado foi encontrado

