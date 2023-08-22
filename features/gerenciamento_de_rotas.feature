Feature: Gerenciamento de rotas
  As a Usuario do sistema
  I want to registrar, editar e remover uma rota de viagem de um onibus
  So that eu saiba qual veiculo e motorista estao em uma rota

  Scenario: registrar rota com informacoes validas
    Given sou um usuario autenticado do sistema com email "email@email.com" e senha "12345678"
    Given que eu estou na pagina de cadastro de onibus
    And preencho "placa" de "onibus" com "ABC-1234"
    And preencho "chassi" de "onibus" com "9BWGD21JX22512345"
    And preencho "modelo" de "onibus" com "Marcopolo Paradiso 1800 DD"
    And preencho "capacidade" de "onibus" com  50
    And seleciono "em operação" como "status" de "onibus"
    And eu clico em "Create Onibus"
    Given que eu estou na pagina de cadastro de motorista
    And preencho "nome" de "motoristum" com "Jose Almeida"
    And preencho "cpf" de "motoristum" com "12345678910"
    And preencho "email" de "motoristum" com "jose@gmail.com"
    And preencho "telefone" de "motoristum" com "11123456789"
    And preencho "cnh" de "motoristum" com "1234567891"
    And eu clico em "Create Motoristum"
    When que eu estou na pagina de cadastro de rota
    And preencho "nome" de "rotum" com "Rota do Agreste"
    And preencho "valor" de "rotum" com 50.00
    And preencho "distancia" de "rotum" com 120.5
    And preencho "duracao" de "rotum" com 2.5
    And preencho "inicio" de "rotum" com "08:30"
    And preencho "fim" de "rotum" com "10:00"
    And preencho "origem" de "rotum" com "Garanhuns"
    And preencho "destino" de "rotum" com "Caruaru"
    And seleciono "ABC-1234" como "onibus_id" de "rotum" 
    And seleciono "Jose Almeida" como "motoristum_id" de "rotum"
    And eu clico em "Create Rotum"
    Then eu vejo a mensagem "Rotum was successfully created."




  Scenario: registrar rota com o campo nome em branco
    Given sou um usuario autenticado do sistema com email "email@email.com" e senha "12345678"
    Given que eu estou na pagina de cadastro de onibus
    And preencho "placa" de "onibus" com "ABC-1234"
    And preencho "chassi" de "onibus" com "9BWGD21JX22512345"
    And preencho "modelo" de "onibus" com "Marcopolo Paradiso 1800 DD"
    And preencho "capacidade" de "onibus" com  50
    And seleciono "em operação" como "status" de "onibus"
    And eu clico em "Create Onibus"
    Given que eu estou na pagina de cadastro de motorista
    And preencho "nome" de "motoristum" com "Jose Almeida"
    And preencho "cpf" de "motoristum" com "12345678910"
    And preencho "email" de "motoristum" com "jose@gmail.com"
    And preencho "telefone" de "motoristum" com "11123456789"
    And preencho "cnh" de "motoristum" com "1234567891"
    And eu clico em "Create Motoristum"
    When que eu estou na pagina de cadastro de rota
    And preencho "nome" de "rotum" com ""
    And preencho "valor" de "rotum" com 50
    And preencho "distancia" de "rotum" com 120.5
    And preencho "duracao" de "rotum" com 2.5
    And preencho "inicio" de "rotum" com "08:30"
    And preencho "fim" de "rotum" com "10:00"
    And preencho "origem" de "rotum" com "Garanhuns"
    And preencho "destino" de "rotum" com "Caruaru"
    And seleciono "ABC-1234" como "onibus_id" de "rotum"
    And seleciono "Jose Almeida" como "motoristum_id" de "rotum"
    And eu clico em "Create Rotum"
    Then eu vejo a mensagem "O nome deve ser preenchido"

  Scenario: registrar rota com o campo origem em branco
    Given sou um usuario autenticado do sistema com email "email@email.com" e senha "12345678"
    Given que eu estou na pagina de cadastro de onibus
    And preencho "placa" de "onibus" com "ABC-1234"
    And preencho "chassi" de "onibus" com "9BWGD21JX22512345"
    And preencho "modelo" de "onibus" com "Marcopolo Paradiso 1800 DD"
    And preencho "capacidade" de "onibus" com  50
    And seleciono "em operação" como "status" de "onibus"
    And eu clico em "Create Onibus"
    Given que eu estou na pagina de cadastro de motorista
    And preencho "nome" de "motoristum" com "Jose Almeida"
    And preencho "cpf" de "motoristum" com "12345678910"
    And preencho "email" de "motoristum" com "jose@gmail.com"
    And preencho "telefone" de "motoristum" com "11123456789"
    And preencho "cnh" de "motoristum" com "1234567891"
    And eu clico em "Create Motoristum"
    When que eu estou na pagina de cadastro de rota
    And preencho "nome" de "rotum" com "Rota do Agreste"
    And preencho "valor" de "rotum" com 50.00
    And preencho "distancia" de "rotum" com 120.5
    And preencho "duracao" de "rotum" com 2.5
    And preencho "inicio" de "rotum" com "08:30"
    And preencho "fim" de "rotum" com "10:00"
    And preencho "origem" de "rotum" com ""
    And preencho "destino" de "rotum" com "Caruaru"
    And seleciono "ABC-1234" como "onibus_id" de "rotum"
    And seleciono "Jose Almeida" como "motoristum_id" de "rotum"
    And eu clico em "Create Rotum"
    Then eu vejo a mensagem "A origem deve ser preenchida"

  Scenario: editar rota com sucesso
    Given sou um usuario autenticado do sistema com email "email@email.com" e senha "12345678"
    Given que eu estou na pagina de cadastro de onibus
    And preencho "placa" de "onibus" com "ABC-1234"
    And preencho "chassi" de "onibus" com "9BWGD21JX22512345"
    And preencho "modelo" de "onibus" com "Marcopolo Paradiso 1800 DD"
    And preencho "capacidade" de "onibus" com  50
    And seleciono "em operação" como "status" de "onibus"
    And eu clico em "Create Onibus"
    Given que eu estou na pagina de cadastro de motorista
    And preencho "nome" de "motoristum" com "Jose Almeida"
    And preencho "cpf" de "motoristum" com "12345678910"
    And preencho "email" de "motoristum" com "jose@gmail.com"
    And preencho "telefone" de "motoristum" com "11123456789"
    And preencho "cnh" de "motoristum" com "1234567891"
    And eu clico em "Create Motoristum"
    When que eu estou na pagina de cadastro de rota
    And preencho "nome" de "rotum" com "Rota do Agreste"
    And preencho "valor" de "rotum" com 50.00
    And preencho "distancia" de "rotum" com 120.5
    And preencho "duracao" de "rotum" com 2.5
    And preencho "inicio" de "rotum" com "08:30"
    And preencho "fim" de "rotum" com "10:00"
    And preencho "origem" de "rotum" com "Garanhuns"
    And preencho "destino" de "rotum" com "Caruaru"
    And seleciono "ABC-1234" como "onibus_id" de "rotum"
    And seleciono "Jose Almeida" como "motoristum_id" de "rotum"
    And eu clico em "Create Rotum"
    When eu clico em "Edit this rotum"
    And preencho "inicio" de "rotum" com "05:00"
    And preencho "fim" de "rotum" com "08:00"
    And eu clico em "Update Rotum"
    Then eu vejo a mensagem "Rotum was successfully updated."

  Scenario: remover rota com sucesso
    Given sou um usuario autenticado do sistema com email "email@email.com" e senha "12345678"
    Given que eu estou na pagina de cadastro de onibus
    And preencho "placa" de "onibus" com "ABC-1234"
    And preencho "chassi" de "onibus" com "9BWGD21JX22512345"
    And preencho "modelo" de "onibus" com "Marcopolo Paradiso 1800 DD"
    And preencho "capacidade" de "onibus" com  50
    And seleciono "em operação" como "status" de "onibus"
    And eu clico em "Create Onibus"
    Given que eu estou na pagina de cadastro de motorista
    And preencho "nome" de "motoristum" com "Jose Almeida"
    And preencho "cpf" de "motoristum" com "12345678910"
    And preencho "email" de "motoristum" com "jose@gmail.com"
    And preencho "telefone" de "motoristum" com "11123456789"
    And preencho "cnh" de "motoristum" com "1234567891"
    And eu clico em "Create Motoristum"
    When que eu estou na pagina de cadastro de rota
    And preencho "nome" de "rotum" com "Rota do Agreste"
    And preencho "valor" de "rotum" com 50.00
    And preencho "distancia" de "rotum" com 120.5
    And preencho "duracao" de "rotum" com 2.5
    And preencho "inicio" de "rotum" com "08:30"
    And preencho "fim" de "rotum" com "10:00"
    And preencho "origem" de "rotum" com "Garanhuns"
    And preencho "destino" de "rotum" com "Caruaru"
    And seleciono "ABC-1234" como "onibus_id" de "rotum"
    And seleciono "Jose Almeida" como "motoristum_id" de "rotum"
    And eu clico em "Create Rotum"
    And eu clico em "Destroy this rotum"
    Then eu vejo a mensagem "Rotum was successfully destroyed."