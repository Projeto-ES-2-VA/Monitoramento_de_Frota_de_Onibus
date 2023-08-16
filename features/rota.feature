Feature: Buscar rotas
  Como um usuario do sistema
  Eu quero Buscar as rotas que um onibus ja percorreu informando sua placa
  Para que eu saiba por onde cada onibus da frota ja passou

  Scenario: Buscar rotas sem nenhum onibus cadastrado
    Given eu visito a pagina de buscar rotas por onibus
    And eu clico no botao buscar
    Then o sistema exibe a mensagem 'Nenhum resultado encontrado.'

  Scenario: Buscar rotas de um onibus
    Given dado um motorista registrado com nome 'Claudierio Baltazar'
    And existe um onibus com placa "ABC-1234"
    And que existe uma rota registrada no sistema para a placa "ABC-1234", e motorista de nome 'Claudierio Baltazar'
    When eu visito a pagina de buscar rotas por onibus
    And eu seleciono a placa "ABC-1234" do onibus
    And eu clico no botao buscar
    Then o sistema exibe a lista de rotas percorridas pelo onibus

  Scenario: Buscar rotas de um onibus que nao possui rotas
    Given eu visito a pagina de buscar rotas por onibus
    And existe um onibus com placa "XYZ-7890"
    When eu visito a pagina de buscar rotas por onibus
    And eu seleciono a placa "XYZ-7890" do onibus
    And eu clico no botao buscar
    Then o sistema exibe a mensagem 'Nenhum resultado encontrado.'