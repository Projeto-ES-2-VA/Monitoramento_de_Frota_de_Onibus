Feature: Gerenciamento de onibus
  As a Usuario do sistema
  I want to registrar, editar e remover um onibus
  So that eu mantenha a frota de onibus atualizada

Scenario: Registro de onibus no sistema
  Given que eu sou um Usuario do sistema
  When eu acesso a pagina de registro de onibus
  And preencho as informacoes do onibus: placa 'ABC1234', modelo 'Volvo 9700', ano '2022', capacidade '50'
  And clico no botao de registro
  Then vejo uma mensagem de confirmacao de registro do onibus

Scenario: Edicao de informacoes de um onibus
  Given que eu sou um Usuario do sistema
  And existe um onibus registrado com placa 'XYZ5678'
  When eu acesso a pagina de edicao de onibus para a placa 'XYZ5678'
  And atualizo as informacoes do onibus: modelo 'Mercedes-Benz O500', ano '2023'
  And clico no botao de atualizacao
  Then vejo uma mensagem de confirmacao de atualizacao das informacoes do onibus

Scenario: Remocao de um onibus do sistema
  Given que eu sou um Usuario do sistema
  And existe um onibus registrado com placa 'JKL9012'
  When eu acesso a pagina de gerenciamento de onibus
  And seleciono a opcao de remover o onibus com placa 'JKL9012'
  And confirmo a remocao
  Then vejo uma mensagem de confirmacao de remocao do onibus
