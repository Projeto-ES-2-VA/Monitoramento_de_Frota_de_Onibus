Feature: Gerenciamento de Motorista
  As a Usuario do sistema
  I want to registrar, editar, exibir e remover um motorista de onibus
  So that eu saiba qual veiculo e motorista estao em uma rota

  Scenario: Registro de motorista com informacoes validas
    Given sou um usuario autenticado do sistema com email "email@email.com" e senha "12345678"
    Given que eu acesso a pagina de registro do motorista
    And preencho "nome" com "Jose Almeida"
    And preencho "cpf" com "12345678910"
    And preencho "email" com "jose@gmail.com"
    And preencho "telefone" com "11123456789"
    And preencho "cnh" com "1234567891"
    And clico no botao "Create Motoristum"
    Then aparece a mensagem "Motoristum was successfully created."

  Scenario: Registro de motorista com informacoes invalidas
    Given sou um usuario autenticado do sistema com email "email@email.com" e senha "12345678"
    Given que eu acesso a pagina de registro do motorista
    And preencho "nome" com "J"
    And preencho "cpf" com "120"
    And preencho "email" com "joseom"
    And preencho "telefone" com "1112"
    And preencho "cnh" com "127891"
    And clico no botao "Create Motoristum"
    Then aparece a mensagem "errors prohibited this motoristum from being saved"

  Scenario: editar motorista
    Given sou um usuario autenticado do sistema com email "email@email.com" e senha "12345678"
    Given que eu acesso a pagina de registro do motorista
    And preencho "nome" com "Jose Almeida"
    And preencho "cpf" com "12345678910"
    And preencho "email" com "jose@gmail.com"
    And preencho "telefone" com "11123456789"
    And preencho "cnh" com "1234567891"
    And clico no botao "Create Motoristum"
    When eu acesso a pagina de listagem de motorista
    And eu acesso a pagina de visualizacao de um motorista com cpf "12345678910"
    And clico no link "Edit this motoristum"
    And preencho "telefone" com "11123456780"
    And clico no botao "Update Motoristum"
    Then aparece a mensagem "Motoristum was successfully updated."

  Scenario: editar motorista com email invalido
    Given sou um usuario autenticado do sistema com email "email@email.com" e senha "12345678"
    Given que eu acesso a pagina de registro do motorista
    And preencho "nome" com "Jose Almeida"
    And preencho "cpf" com "12345678910"
    And preencho "email" com "jose@gmail.com"
    And preencho "telefone" com "11123456789"
    And preencho "cnh" com "1234567891"
    And clico no botao "Create Motoristum"
    When eu acesso a pagina de listagem de motorista
    And eu acesso a pagina de visualizacao de um motorista com cpf "12345678910"
    And clico no link "Edit this motoristum"
    And preencho "email" com "josealmeidagmail.com"
    And clico no botao "Update Motoristum"
    Then aparece a mensagem "Email is invalid"

  Scenario: Remocao de um motorista do sistema
    Given sou um usuario autenticado do sistema com email "email@email.com" e senha "12345678"
    Given que eu acesso a pagina de registro do motorista
    And preencho "nome" com "Jose Almeida"
    And preencho "cpf" com "12345678910"
    And preencho "email" com "jose@gmail.com"
    And preencho "telefone" com "11123456789"
    And preencho "cnh" com "1234567891"
    And clico no botao "Create Motoristum"
    When eu acesso a pagina de listagem de motorista
    And eu acesso a pagina de visualizacao de um motorista com cpf "12345678910"
    And clico no botao "Destroy this motoristum"
    Then aparece a mensagem "Motoristum was successfully destroyed"

  Scenario: Exibir detalhes de um motorista
    Given sou um usuario autenticado do sistema com email "email@email.com" e senha "12345678"
    Given que eu acesso a pagina de registro do motorista
    And preencho "nome" com "Jose Almeida"
    And preencho "cpf" com "12345678910"
    And preencho "email" com "jose@gmail.com"
    And preencho "telefone" com "11123456789"
    And preencho "cnh" com "1234567891"
    And clico no botao "Create Motoristum"
    When eu acesso a pagina de listagem de motorista
    And eu acesso a pagina de visualizacao de um motorista com cpf "12345678910"
    Then eu vejo os detalhes do motorista com o cpf: "12345678910"
