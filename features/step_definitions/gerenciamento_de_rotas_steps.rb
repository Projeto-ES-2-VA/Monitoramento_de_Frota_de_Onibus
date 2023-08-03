# Criar rota com sucesso
Given('o onibus de placa: {string}, chassi: {string}, modelo: {string}, capacidade: {int}, status: {string} existe') do |placa, chassi, modelo, capacidade, status|

  # Nao consegui colocar o status como boolean, ta dando problema no .feature
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
  click_on 'Create Rotum'
end

Then('eu devo ser redirecionado para a pagina de rota que foi criada e vejo a mensagem {string}') do |mensagem|
  expect(page).to have_current_path(rotum_path(Rotum.last))
  expect(page).to have_content(mensagem)
end


# Criar rota com nome em branco
# ou
# Criar rota com origem em branco
# Then('eu vejo a mensagem {string}') do |mensagem|
#   expect(page).to have_current_path(rotum_path(Rotum.last))
#   expect(page).to have_content(mensagem)
# end

# Editar rota
Given(/^a rota de nome: "([^"]*)", valor: ([\d.]+), distancia: ([\d.]+), duracao: ([\d.]+), inicio: "([^"]*)", fim: "([^"]*)", horario: "([^"]*)"$/) do |nome, valor, distancia, duracao, inicio, fim, horario|

  visit '/rota/new'
  fill_in 'Nome', with: nome
  fill_in 'Valor', with: valor.to_f
  fill_in 'Distancia', with: distancia.to_f
  fill_in 'Duracao', with: duracao.to_f
  fill_in 'Inicio', with: inicio
  fill_in 'Fim', with: fim
  fill_in 'Horario', with: horario
  click_on 'Create Rotum'
end

And(/^eu estou na pagina de listagem de rotas$/) do
  visit '/rota'
  expect(page).to have_content('Show this rotum')
end

When(/^eu acesso uma rota em especifico$/) do
  # Implemente aqui a lógica para acessar uma rota específica na lista de rotas
  # Por exemplo, clique em um link para acessar a página de edição da rota
end

And(/^eu clico para editar rota$/) do
  # Implemente aqui a lógica para clicar no botão ou link que leva à página de edição da rota
end

And(/^eu altero o campo nome com "([^"]*)"$/) do |novo_nome|
  fill_in 'Nome', with: novo_nome # Certifique-se de que o campo 'Nome' seja o correto no formulário de edição de rota
end

And(/^clico para atualizar rota$/) do
  click_on 'Update Rotum'
end

Then(/^aparece uma mensagem dizendo que a rota foi atualizada com sucesso$/) do
  expect(page).to have_content('Rotum was successfully updated.')
end
