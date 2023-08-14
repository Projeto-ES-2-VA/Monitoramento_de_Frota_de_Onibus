Feature: Busca de onibus
  As a Usuario do sistema
  I want to buscar um onibus pela sua placa, modelo ou chassi
  So that eu encontre um onibus ideal para uma rota

  Scenario: buscar onibus por placa
    Given o onibus de placa: "ABC-1234", chassi: "9BWGD21JX22512345", modelo: "Marcopolo Paradiso 1800 DD", capacidade: 50, status: "em operação" foi criado
    And o usuario esta na pagina de busca de onibus
    And digita a placa do onibus que deseja buscar
    When seleciona a caracteristica placa para buscar
    And clica em buscar
    Then aparece o onibus desejado
    
  Scenario: buscar onibus por modelo
    Given o onibus de placa: "ABC-1234", chassi: "9BWGD21JX22512345", modelo: "Marcopolo Paradiso 1800 DD", capacidade: 50, status: "em operação" foi criado
    And o usuario esta na pagina de busca de onibus
    And digita o modelo do onibus que deseja buscar
    When seleciona a caracteristica modelo para buscar
    And clica em buscar
    Then aparece o onibus desejado

  Scenario: buscar onibus por chassi
    Given o onibus de placa: "ABC-1234", chassi: "9BWGD21JX22512345", modelo: "Marcopolo Paradiso 1800 DD", capacidade: 50, status: "em operação" foi criado
    And o usuario esta na pagina de busca de onibus
    And digita o chassi do onibus que deseja buscar
    When seleciona a caracteristica chassi para buscar
    And clica em buscar
    Then aparece o onibus desejado

  Scenario: buscar onibus por placa inexistente
    Given o onibus de placa: "ABC-1234", chassi: "9BWGD21JX22512345", modelo: "Marcopolo Paradiso 1800 DD", capacidade: 50, status: "em operação" foi criado
    And o usuario esta na pagina de busca de onibus
    And digita uma placa da qual nao existe no banco de dados
    When seleciona a caracteristica placa para buscar
    And clica em buscar
    Then aparece a mensagem de que nenhum onibus foi encontrado


  Scenario: buscar onibus por modelo inexistente
    Given o onibus de placa: "ABC-1234", chassi: "9BWGD21JX22512345", modelo: "Marcopolo Paradiso 1800 DD", capacidade: 50, status: "em operação" foi criado
    And o usuario esta na pagina de busca de onibus
    And digita um modelo da qual nao existe no banco de dados
    When seleciona a caracteristica modelo para buscar
    And clica em buscar
    Then aparece a mensagem de que nenhum onibus foi encontrado

  Scenario: buscar onibus por chassi inexistente
    Given o onibus de placa: "ABC-1234", chassi: "9BWGD21JX22512345", modelo: "Marcopolo Paradiso 1800 DD", capacidade: 50, status: "em operação" foi criado
    And o usuario esta na pagina de busca de onibus
    And digita um chassi no qual nao existe no banco de dados
    When seleciona a caracteristica chassi para buscar
    And clica em buscar
    Then aparece a mensagem de que nenhum onibus foi encontrado
