# Criar rota com sucesso
Given('que eu estou na pagina de cadastro de onibus') do
  visit '/onibuses/new'
end

And('preencho a placa: {string}') do |placa|
  fill_in 'Placa', with: placa
end

And('preencho o chassi: {string}') do |chassi|
  fill_in 'Chassi', with: chassi
end

And('preencho o modelo: {string}') do |modelo|
  fill_in 'Modelo', with: modelo
end

And('preencho a capacidade: {int}') do |capacidade|
  fill_in 'Capacidade', with: capacidade
end

And('preencho o status: {string}') do |status|
  select(status, from: 'Status')
end

And('clico em criar onibus') do
  click_button 'Create Onibus'
end

Given('que eu estou na pagina de cadastro de motorista') do
  visit '/motorista/new'
end

And('preencho o nome: {string}') do |nome|
  fill_in "motoristum[nome]", with: nome
end

And('preencho o cpf: {string}') do |cpf|
  fill_in "motoristum[cpf]", with: cpf
end

And('preencho o email: {string}') do |email|
  fill_in "motoristum[email]", with: email
end

And('preencho a senha: {string}') do |senha|
  fill_in "motoristum[senha]", with: senha
end

And('preencho o telefone: {string}') do |telefone|
  fill_in "motoristum[telefone]", with: telefone
end

And('preencho o cnh: {string}') do |cnh|
  fill_in "motoristum[cnh]", with: cnh
end

And('clico em criar motorista') do
  click_button "Create Motoristum"
  expect(page).to have_content("Motoristum was successfully created.")
end

When('que eu estou na pagina de cadastro de rota') do
  visit '/rota/new'
end

And('preencho o nome da rota: {string}') do |nome|
  fill_in 'Nome', with: nome
end

And('preencho o valor: {float}') do |valor|
  fill_in 'Valor', with: valor
end

And('preencho a distancia: {float}') do |distancia|
  fill_in 'Distancia', with: distancia
end

And('preencho a duracao: {float}') do |duracao|
  fill_in 'Duracao', with: duracao
end

And('preencho o inicio: {string}') do |inicio|
  fill_in 'Inicio', with: inicio
end

And('preencho o fim: {string}') do |fim|
  fill_in 'Fim', with: fim
end

And('preencho a origem: {string}') do |origem|
  fill_in 'Origem', with: origem
end

And('preencho o destino: {string}') do |destino|
  fill_in 'Destino', with: destino
end

And('preencho o onibus: {string}') do |onibus|
  select(onibus, from: 'Onibus')
end

And('preencho o motorista: {string}') do |motorista|
  select(motorista, from: 'Motoristum')
end

And('clico em criar uma rota') do
  click_button 'Create Rotum'
end

Then('eu devo ser redirecionado para a pagina de rota que foi criada e vejo a mensagem {string}') do |mensagem|
  expect(page).to have_current_path(rotum_path(Rotum.last))
  expect(page).to have_content(mensagem)
end


# Criar rota com nome em branco
# ou
# Criar rota com origem em branco
Then('eu vejo a mensagem {string}') do |mensagem|
  expect(page).to have_content(mensagem)
end

# Editar rota
When("eu estou na pagina de listagem de rotas") do
  visit '/rota'
  expect(page).to have_content('Rota do Agreste')
end

When("eu acesso uma rota em especifico") do
  click_on 'Show this rotum'
end

And("eu clico para editar rota") do
  click_on 'Edit this rotum'
end

And("eu altero o campo inicio com {string} e fim com {string}") do |novo_inicio, novo_fim|
  fill_in 'Inicio', with: novo_inicio
  fill_in 'Fim', with: novo_fim
end

And("clico para atualizar rota") do
  click_button 'Update Rotum'
end

Then("aparece uma mensagem dizendo que a rota foi atualizada com sucesso") do
  expect(page).to have_content('Rotum was successfully updated.')
end


#Excluir rota
And("eu clico para excluir rota") do
  click_on 'Destroy this rotum'
end

Then("aparece uma mensagem dizendo que a rota foi excluida com sucesso") do
  expect(page).to have_content('Rotum was successfully destroyed.')
end