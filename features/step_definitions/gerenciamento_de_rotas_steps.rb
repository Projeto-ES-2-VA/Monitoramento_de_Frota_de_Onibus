# Criar rota com sucesso
Given('o onibus de placa: {string}, chassi: {string}, modelo: {string}, capacidade: {int}, status: {string} existe') do |placa, chassi, modelo, capacidade, status|

  visit '/onibuses/new'
  fill_in 'Placa', with: placa
  fill_in 'Chassi', with: chassi
  fill_in 'Modelo', with: modelo
  fill_in 'Capacidade', with: capacidade
  select(status, from: 'Status')
  click_button 'Create Onibus'
end

And('que eu estou na pagina de cadastro de rota') do
  visit '/rota/new'
end

When("eu preencho os campos obrigatorios com os seguintes dados, nome: {string}, valor: {float}, distancia: {float}, duracao: {float}, inicio: {string}, fim: {string}, origem: {string}, destino: {string}, onibus: {string}") do |nome, valor, distancia, duracao, inicio, fim, origem, destino, onibus|
  fill_in 'Nome', with: nome
  fill_in 'Valor', with: valor
  fill_in 'Distancia', with: distancia
  fill_in 'Duracao', with: duracao
  fill_in 'Inicio', with: inicio
  fill_in 'Fim', with: fim
  fill_in 'Origem', with: origem
  fill_in 'Destino', with: destino
  select(onibus, from: 'Onibus')
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
  expect(page).to have_current_path(rotum_path(Rotum.last))
  expect(page).to have_content(mensagem)
end

# Editar rota
Given("a rota de nome: {string}, valor: {float}, distancia: {float}, duracao: {float}, inicio: {string}, fim: {string}, origem: {string}, destino: {string}, onibus: {string} existe") do |nome, valor, distancia, duracao, inicio, fim, origem, destino, onibus|
  visit '/rota/new'
  fill_in 'Nome', with: nome
  fill_in 'Valor', with: valor
  fill_in 'Distancia', with: distancia
  fill_in 'Duracao', with: duracao
  fill_in 'Inicio', with: inicio
  fill_in 'Fim', with: fim
  fill_in 'Origem', with: origem
  fill_in 'Destino', with: destino
  select(onibus, from: 'Onibus')
  click_button 'Create Rotum'
end

And("eu estou na pagina de listagem de rotas") do
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
