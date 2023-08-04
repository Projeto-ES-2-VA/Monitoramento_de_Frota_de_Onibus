Feature: Gerenciamento de rotas
  As a Usuario do sistema
  I want to registrar, editar e remover uma rota de viagem de um onibus
  So that eu saiba qual veiculo e motorista estao em uma rota

  Scenario: registrar rota com informacoes validas
    Given o onibus de placa: "ABC-1234", chassi: "9BWGD21JX22512345", modelo: "Marcopolo Paradiso 1800 DD", capacidade: 50, status: "em operação" existe
    And que eu estou na pagina de cadastro de rota
    When eu preencho os campos obrigatorios com os seguintes dados, nome: "Rota do Agreste", valor: 50.00, distancia: 120.5, duracao: 2.5, inicio: "08:30", fim: "10:00", origem: "Garanhuns", destino: "Caruaru", onibus: "ABC-1234"
    And clico em criar uma rota
    Then eu devo ser redirecionado para a pagina de rota que foi criada e vejo a mensagem "Rotum was successfully created."

  Scenario: registrar rota com o campo nome em branco
    Given o onibus de placa: "ABC-1234", chassi: "9BWGD21JX22512345", modelo: "Marcopolo Paradiso 1800 DD", capacidade: 50, status: "em operação" existe
    And que eu estou na pagina de cadastro de rota
    When eu preencho os campos obrigatorios com os seguintes dados, nome: "", valor: 50.00, distancia: 120.5, duracao: 2.5, inicio: "08:30", fim: "10:00", origem: "Garanhuns", destino: "Caruaru", onibus: "ABC-1234"
    And clico em criar uma rota
#    Then eu vejo a mensagem "O nome não pode ficar em branco"

  Scenario: registrar rota com o campo origem em branco
    Given o onibus de placa: "ABC-1234", chassi: "9BWGD21JX22512345", modelo: "Marcopolo Paradiso 1800 DD", capacidade: 50, status: "em operação" existe
    And que eu estou na pagina de cadastro de rota
    When eu preencho os campos obrigatorios com os seguintes dados, nome: "Rota do Agreste", valor: 50.00, distancia: 120.5, duracao: 2.5, inicio: "08:30", fim: "10:00", origem: "", destino: "Caruaru", onibus: "ABC-1234"
    And clico em criar uma rota
#    Then eu vejo a mensagem "A origem não pode ficar em branco"

  Scenario: editar rota com sucesso
    Given o onibus de placa: "ABC-1234", chassi: "9BWGD21JX22512345", modelo: "Marcopolo Paradiso 1800 DD", capacidade: 50, status: "em operação" existe
    And a rota de nome: "Rota do Agreste", valor: 50.00, distancia: 120.5, duracao: 2.5, inicio: "08:30", fim: "10:00", origem: "Garanhuns", destino: "Caruaru", onibus: "ABC-1234" existe
    And eu estou na pagina de listagem de rotas
    When eu acesso uma rota em especifico
    And eu clico para editar rota
    And eu altero o campo inicio com "05:00" e fim com "08:00"
    And clico para atualizar rota
    Then aparece uma mensagem dizendo que a rota foi atualizada com sucesso

  Scenario: remover rota com sucesso
    Given o onibus de placa: "ABC-1234", chassi: "9BWGD21JX22512345", modelo: "Marcopolo Paradiso 1800 DD", capacidade: 50, status: "em operação" existe
    And a rota de nome: "Rota do Agreste", valor: 50.00, distancia: 120.5, duracao: 2.5, inicio: "08:30", fim: "10:00", origem: "Garanhuns", destino: "Caruaru", onibus: "ABC-1234" existe
    And eu estou na pagina de listagem de rotas
    When eu acesso uma rota em especifico
    And eu clico para excluir rota
    Then aparece uma mensagem dizendo que a rota foi excluida com sucesso






