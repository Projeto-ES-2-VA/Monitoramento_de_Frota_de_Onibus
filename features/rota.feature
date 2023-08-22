Feature: Buscar rotas
  Como um usuario do sistema
  Eu quero Buscar as rotas que um onibus ja percorreu informando sua placa
  Para que eu saiba por onde cada onibus da frota ja passou

  Scenario: Buscar rotas sem nenhum onibus cadastrado
    Given sou um usuario autenticado do sistema com email "email@email.com" e senha "12345678"
    And eu visito a pagina de buscar rotas por onibus
    And entao clico no botao "Buscar"
    Then exibe a mensagem "Nenhum resultado encontrado."

  Scenario: Buscar rotas de um onibus
    Given sou um usuario autenticado do sistema com email "email@email.com" e senha "12345678"
    Given eu quem estou na pagina de cadastro de onibus
    And eu quem preencho "placa" de "onibus" com "ABC-1234"
    And eu quem preencho "chassi" de "onibus" com "9BWGD21JX22512345"
    And eu quem preencho "modelo" de "onibus" com "Marcopolo Paradiso 1800 DD"
    And eu quem preencho "capacidade" de "onibus" com 50
    And eu seleciono "em operação" como "status" de "onibus"
    And entao clico no botao "Create Onibus"
    Given eu quem estou na pagina de cadastro de motorista
    And eu quem preencho "nome" de "motoristum" com "Jose Almeida"
    And eu quem preencho "cpf" de "motoristum" com "12345678910"
    And eu quem preencho "email" de "motoristum" com "jose@gmail.com"
    And eu quem preencho "telefone" de "motoristum" com "11123456789"
    And eu quem preencho "cnh" de "motoristum" com "1234567891"
    And entao clico no botao "Create Motoristum"
    When eu quem estou na pagina de cadastro de rota
    And eu quem preencho "nome" de "rotum" com "Rota do Agreste"
    And eu quem preencho "valor" de "rotum" com  50.00
    And eu quem preencho "distancia" de "rotum" com  120.5
    And eu quem preencho "duracao" de "rotum" com  2.5
    And eu quem preencho "inicio" de "rotum" com "08:30"
    And eu quem preencho "fim" de "rotum" com "10:00"
    And eu quem preencho "origem" de "rotum" com "Garanhuns"
    And eu quem preencho "destino" de "rotum" com "Caruaru"
    And eu seleciono "ABC-1234" como "onibus_id" de "rotum"
    And eu seleciono "Jose Almeida" como "motoristum_id" de "rotum"
    And entao clico no botao "Create Rotum"
    When eu visito a pagina de buscar rotas por onibus
    And eu seleciono a placa "ABC-1234" do onibus
    And entao clico no botao "Buscar"
    Then o sistema exibe a rota de nome "Rota do Agreste"

  Scenario: Buscar rotas de um onibus que nao possui rotas
    Given sou um usuario autenticado do sistema com email "email@email.com" e senha "12345678"
    Given eu quem estou na pagina de cadastro de onibus
    And eu quem preencho "placa" de "onibus" com "XYZ-7890"
    And eu quem preencho "chassi" de "onibus" com "9BWGD21JX22512345"
    And eu quem preencho "modelo" de "onibus" com "Marcopolo Paradiso 1800 DD"
    And eu quem preencho "capacidade" de "onibus" com 50
    And eu seleciono "em operação" como "status" de "onibus"
    And entao clico no botao "Create Onibus"
    When eu visito a pagina de buscar rotas por onibus
    And eu seleciono a placa "XYZ-7890" do onibus
    And entao clico no botao "Buscar"
    Then exibe a mensagem "Nenhum resultado encontrado."
