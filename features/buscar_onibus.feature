Feature: Busca de onibus
  As a Usuario do sistema
  I want to buscar um onibus pela sua placa, modelo ou chassi
  So that eu encontre um onibus ideal para uma rota

  Scenario: buscar onibus por placa
    Given sou um usuario autenticado do sistema com email "email@email.com" e senha "12345678"
    And que eu estou em cadastro de onibus
    And entao  preencho "placa" com "ABC-1234"
    And entao  preencho "chassi" com "9BWGD21JX22512345"
    And entao  preencho "modelo" com "Marcopolo Paradiso 1800 DD"
    And entao  preencho "capacidade" com  50
    And seleciono "em operação" como "status"
    And clica em "Create Onibus"
    When estou em busca de onibus
    And entao preencho busca com "ABC-1234"
    And escolho a caracteristica "Placa"
    And clica em "Buscar"
    Then aparece o onibus de placa "ABC-1234" buscado por "Placa"
    
  Scenario: buscar onibus por modelo
    Given sou um usuario autenticado do sistema com email "email@email.com" e senha "12345678"
    And que eu estou em cadastro de onibus
    And entao  preencho "placa" com "ABC-1234"
    And entao  preencho "chassi" com "9BWGD21JX22512345"
    And entao  preencho "modelo" com "Marcopolo Paradiso 1800 DD"
    And entao  preencho "capacidade" com  50
    And seleciono "em operação" como "status"
    And clica em "Create Onibus"
    When estou em busca de onibus
    And entao preencho busca com "Marcopolo Paradiso 1800 DD"
    And escolho a caracteristica "Modelo"
    And clica em "Buscar"
    Then aparece o onibus de placa "ABC-1234" buscado por "Modelo"

  Scenario: buscar onibus por chassi
    Given sou um usuario autenticado do sistema com email "email@email.com" e senha "12345678"
    And que eu estou em cadastro de onibus
    And entao  preencho "placa" com "ABC-1234"
    And entao  preencho "chassi" com "9BWGD21JX22512345"
    And entao  preencho "modelo" com "Marcopolo Paradiso 1800 DD"
    And entao  preencho "capacidade" com  50
    And seleciono "em operação" como "status"
    And clica em "Create Onibus"
    When estou em busca de onibus
    And entao preencho busca com "9BWGD21JX22512345"
    And escolho a caracteristica "Chassi"
    And clica em "Buscar"
    Then aparece o onibus de placa "ABC-1234" buscado por "Chassi"

  Scenario: buscar onibus por placa inexistente
    Given sou um usuario autenticado do sistema com email "email@email.com" e senha "12345678"
    And que eu estou em cadastro de onibus
    And entao  preencho "placa" com "ABC-1234"
    And entao  preencho "chassi" com "9BWGD21JX22512345"
    And entao  preencho "modelo" com "Marcopolo Paradiso 1800 DD"
    And entao  preencho "capacidade" com  50
    And seleciono "em operação" como "status"
    And clica em "Create Onibus"
    When estou em busca de onibus
    And entao preencho busca com "gsgs"
    And escolho a caracteristica "Placa"
    And clica em "Buscar"
    Then vejo aparecer a mensagem "Nenhum onibus encontrado."

  Scenario: buscar onibus por modelo inexistente
    Given sou um usuario autenticado do sistema com email "email@email.com" e senha "12345678"
    And que eu estou em cadastro de onibus
    And entao  preencho "placa" com "ABC-1234"
    And entao  preencho "chassi" com "9BWGD21JX22512345"
    And entao  preencho "modelo" com "Marcopolo Paradiso 1800 DD"
    And entao  preencho "capacidade" com  50
    And seleciono "em operação" como "status"
    And clica em "Create Onibus"
    When estou em busca de onibus
    And entao preencho busca com "gsgs"
    And escolho a caracteristica "Modelo"
    And clica em "Buscar"
    Then vejo aparecer a mensagem "Nenhum onibus encontrado."

  Scenario: buscar onibus por chassi inexistente
    Given sou um usuario autenticado do sistema com email "email@email.com" e senha "12345678"
    And que eu estou em cadastro de onibus
    And entao  preencho "placa" com "ABC-1234"
    And entao  preencho "chassi" com "9BWGD21JX22512345"
    And entao  preencho "modelo" com "Marcopolo Paradiso 1800 DD"
    And entao  preencho "capacidade" com  50
    And seleciono "em operação" como "status"
    And clica em "Create Onibus"
    When estou em busca de onibus
    And entao preencho busca com "gsgs"
    And escolho a caracteristica "Chassi"
    And clica em "Buscar"
    Then vejo aparecer a mensagem "Nenhum onibus encontrado."