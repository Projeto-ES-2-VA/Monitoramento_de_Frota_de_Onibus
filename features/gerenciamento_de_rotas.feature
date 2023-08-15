Feature: Gerenciamento de rotas
  As a Usuario do sistema
  I want to registrar, editar e remover uma rota de viagem de um onibus
  So that eu saiba qual veiculo e motorista estao em uma rota

  Scenario: registrar rota com informacoes validas
    Given que eu estou na pagina de cadastro de onibus
    And preencho a placa: "ABC-1234"
    And preencho o chassi: "9BWGD21JX22512345"
    And preencho o modelo: "Marcopolo Paradiso 1800 DD"
    And preencho a capacidade: 50
    And preencho o status: "em operação"
    And clico em criar onibus
    Given que eu estou na pagina de cadastro de motorista
    And preencho o nome: "Jose Almeida"
    And preencho o cpf: "12345678910"
    And preencho o email: "jose@gmail.com"
    And preencho a senha: "123456!"
    And preencho o telefone: "11123456789"
    And preencho o cnh: "1234567891"
    And clico em criar motorista
    When que eu estou na pagina de cadastro de rota
    And preencho o nome da rota: "Rota do Agreste"
    And preencho o valor: 50.00
    And preencho a distancia: 120.5
    And preencho a duracao: 2.5
    And preencho o inicio: "08:30"
    And preencho o fim: "10:00"
    And preencho a origem: "Garanhuns"
    And preencho o destino: "Caruaru"
    And preencho o onibus: "ABC-1234"
    And preencho o motorista: "Jose Almeida"
    And clico em criar uma rota
    Then eu devo ser redirecionado para a pagina de rota que foi criada e vejo a mensagem "Rotum was successfully created."

  Scenario: registrar rota com o campo nome em branco
    Given que eu estou na pagina de cadastro de onibus
    And preencho a placa: "ABC-1234"
    And preencho o chassi: "9BWGD21JX22512345"
    And preencho o modelo: "Marcopolo Paradiso 1800 DD"
    And preencho a capacidade: 50
    And preencho o status: "em operação"
    And clico em criar onibus
    Given que eu estou na pagina de cadastro de motorista
    And preencho o nome: "Jose Almeida"
    And preencho o cpf: "12345678910"
    And preencho o email: "jose@gmail.com"
    And preencho a senha: "123456!"
    And preencho o telefone: "11123456789"
    And preencho o cnh: "1234567891"
    And clico em criar motorista
    When que eu estou na pagina de cadastro de rota
    And preencho o nome da rota: ""
    And preencho o valor: 50.00
    And preencho a distancia: 120.5
    And preencho a duracao: 2.5
    And preencho o inicio: "08:30"
    And preencho o fim: "10:00"
    And preencho a origem: "Garanhuns"
    And preencho o destino: "Caruaru"
    And preencho o onibus: "ABC-1234"
    And preencho o motorista: "Jose Almeida"
    And clico em criar uma rota
    Then eu vejo a mensagem "O nome deve ser preenchido"

  Scenario: registrar rota com o campo origem em branco
    Given que eu estou na pagina de cadastro de onibus
    And preencho a placa: "ABC-1234"
    And preencho o chassi: "9BWGD21JX22512345"
    And preencho o modelo: "Marcopolo Paradiso 1800 DD"
    And preencho a capacidade: 50
    And preencho o status: "em operação"
    And clico em criar onibus
    Given que eu estou na pagina de cadastro de motorista
    And preencho o nome: "Jose Almeida"
    And preencho o cpf: "12345678910"
    And preencho o email: "jose@gmail.com"
    And preencho a senha: "123456!"
    And preencho o telefone: "11123456789"
    And preencho o cnh: "1234567891"
    And clico em criar motorista
    When que eu estou na pagina de cadastro de rota
    And preencho o nome da rota: "Rota do Agreste"
    And preencho o valor: 50.00
    And preencho a distancia: 120.5
    And preencho a duracao: 2.5
    And preencho o inicio: "08:30"
    And preencho o fim: "10:00"
    And preencho a origem: ""
    And preencho o destino: "Caruaru"
    And preencho o onibus: "ABC-1234"
    And preencho o motorista: "Jose Almeida"
    And clico em criar uma rota
    Then eu vejo a mensagem "A origem deve ser preenchida"

  Scenario: editar rota com sucesso
    Given que eu estou na pagina de cadastro de onibus
    And preencho a placa: "ABC-1234"
    And preencho o chassi: "9BWGD21JX22512345"
    And preencho o modelo: "Marcopolo Paradiso 1800 DD"
    And preencho a capacidade: 50
    And preencho o status: "em operação"
    And clico em criar onibus
    Given que eu estou na pagina de cadastro de motorista
    And preencho o nome: "Jose Almeida"
    And preencho o cpf: "12345678910"
    And preencho o email: "jose@gmail.com"
    And preencho a senha: "123456!"
    And preencho o telefone: "11123456789"
    And preencho o cnh: "1234567891"
    And clico em criar motorista
    When que eu estou na pagina de cadastro de rota
    And preencho o nome da rota: "Rota do Agreste"
    And preencho o valor: 50.00
    And preencho a distancia: 120.5
    And preencho a duracao: 2.5
    And preencho o inicio: "08:30"
    And preencho o fim: "10:00"
    And preencho a origem: "Garanhuns"
    And preencho o destino: "Caruaru"
    And preencho o onibus: "ABC-1234"
    And preencho o motorista: "Jose Almeida"
    And clico em criar uma rota
    When eu estou na pagina de listagem de rotas
    And eu acesso uma rota em especifico
    And eu clico para editar rota
    And eu altero o campo inicio com "05:00" e fim com "08:00"
    And clico para atualizar rota
    Then aparece uma mensagem dizendo que a rota foi atualizada com sucesso

  Scenario: remover rota com sucesso
    Given que eu estou na pagina de cadastro de onibus
    And preencho a placa: "ABC-1234"
    And preencho o chassi: "9BWGD21JX22512345"
    And preencho o modelo: "Marcopolo Paradiso 1800 DD"
    And preencho a capacidade: 50
    And preencho o status: "em operação"
    And clico em criar onibus
    Given que eu estou na pagina de cadastro de motorista
    And preencho o nome: "Jose Almeida"
    And preencho o cpf: "12345678910"
    And preencho o email: "jose@gmail.com"
    And preencho a senha: "123456!"
    And preencho o telefone: "11123456789"
    And preencho o cnh: "1234567891"
    And clico em criar motorista
    When que eu estou na pagina de cadastro de rota
    And preencho o nome da rota: "Rota do Agreste"
    And preencho o valor: 50.00
    And preencho a distancia: 120.5
    And preencho a duracao: 2.5
    And preencho o inicio: "08:30"
    And preencho o fim: "10:00"
    And preencho a origem: "Garanhuns"
    And preencho o destino: "Caruaru"
    And preencho o onibus: "ABC-1234"
    And preencho o motorista: "Jose Almeida"
    And clico em criar uma rota
    And eu estou na pagina de listagem de rotas
    When eu acesso uma rota em especifico
    And eu clico para excluir rota
    Then aparece uma mensagem dizendo que a rota foi excluida com sucesso