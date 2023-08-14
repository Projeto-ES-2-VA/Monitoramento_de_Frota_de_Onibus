Feature: Gerenciamento de Motorista
  As a Usuario do sistema
  I want to registrar, editar, exibir e remover um motorista de onibus
  So that eu saiba qual veiculo e motorista estao em uma rota

  Scenario: Registro de motorista com informacoes validas
    Given eu que sou um usuario do sistema
    When eu acesso a pagina de registro do motorista
    And preencho do motorista o nome: "Jose Almeida", cpf: "12345678910", email: "jose@gmail.com", senha: "123456!", telefone: "11123456789" , e cnh: "1234567891"
    And clico no botao para cadastrar o motorista
    Then aparece a mensagem "Motoristum was successfully created."

  Scenario: Registro de motorista com informacoes invalidas
    Given eu que sou um usuario do sistema
    When eu acesso a pagina de registro do motorista
    And clico no botao para cadastrar o motorista
    Then aparece a mensagem "errors prohibited this motoristum from being saved"

  Scenario: editar motorista
    Given eu que sou um usuario do sistema
    And existe um motorista registrado com cpf '12345678911'
    And eu estou na pagina de listagem de motorista
    When eu acesso um motorista em especifico
    And eu clico para editar motorista
    And eu altero o campo email para "josealmeida@gmail.com"
    And clico para atualizar o motorista
    Then aparece a mensagem "Motoristum was successfully updated."

    Scenario: editar motorista com email invalido
    Given eu que sou um usuario do sistema
    And existe um motorista registrado com cpf '12345678911'
    And eu estou na pagina de listagem de motorista
    When eu acesso um motorista em especifico
    And eu clico para editar motorista
    And eu altero o campo email para "josealmeidagmail.com"
    And clico para atualizar o motorista
    Then aparece a mensagem "Email is invalid"

  Scenario: Remocao de um motorista do sistema
    Given eu que sou um usuario do sistema
    And existe um motorista registrado com cpf '12345678910'
    And eu estou na pagina de listagem de motorista
    When eu acesso um motorista em especifico
    And eu clico para excluir o motorista
    Then aparece a mensagem "Motoristum was successfully destroyed"

  Scenario: Exibir detalhes de um motorista
    Given eu que sou um usuario do sistema
    And existe um motorista registrado com cpf '12345678920'
    And eu estou na pagina de listagem de motorista
    When eu acesso um motorista em especifico
    Then eu vejo os detalhes do motorista com o cpf: '12345678920' e vejo os campos do mesmo
