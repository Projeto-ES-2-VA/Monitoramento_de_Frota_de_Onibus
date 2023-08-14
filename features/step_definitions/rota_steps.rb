require 'rspec/expectations'

Given('dado um motorista registrado com nome {string}') do |nome|
  visit '/motorista/new'
  fill_in 'Nome', with: nome
  fill_in 'Cpf', with: '12345098761'
  fill_in 'Email', with: 'claudinho@gmail.com'
  fill_in 'Senha', with: '12345@'
  fill_in 'Telefone', with: '11123456789'
  fill_in 'Cnh', with: '0123456789'
  click_button 'Create Motoristum'
  expect(page).to have_content(nome)
end


And('existe um onibus com placa {string}') do |placa|
  visit '/onibuses/new'
  fill_in 'Placa', with: placa
  fill_in 'Chassi', with: "11111111111111111"
  fill_in 'Modelo', with: "modelo"
  fill_in 'Capacidade', with: 50
  select("em operação", from: 'Status')
  click_button 'Create Onibus'
  expect(page).to have_content(placa)
end

And('que existem duas rotas registrados no sistema para a placa {string}, e motorista de nome {string}') do |placa, motorista|
  visit '/rota/new'
  fill_in 'Nome', with: "nome 1"
  fill_in 'Valor', with: 10
  fill_in 'Distancia', with: 10
  fill_in 'Duracao', with: 10
  fill_in 'Inicio', with: "7:00"
  fill_in 'Fim', with: "10:00"
  fill_in 'Origem', with: "origem"
  fill_in 'Destino', with: "destino"
  select(placa, from: 'Onibus')
  select(motorista, from: 'Motoristum')
  click_button 'Create Rotum'

  visit '/rota/new'
  fill_in 'Nome', with: "nome 2"
  fill_in 'Valor', with: 10
  fill_in 'Distancia', with: 10
  fill_in 'Duracao', with: 10
  fill_in 'Inicio', with: "11:00"
  fill_in 'Fim', with: "14:00"
  fill_in 'Origem', with: "origem 2"
  fill_in 'Destino', with: "destino 2"
  select(placa, from: 'Onibus')
  select(motorista, from: 'Motoristum')
  click_button 'Create Rotum'

  visit '/rota'
  expect(page).to have_content("nome 2")
end

Given("eu visito a pagina de buscar rotas por onibus") do
  visit buscar_por_onibus_path
  expect(page).to have_content("Buscar")
end

And('eu seleciono a placa {string} do onibus') do |placa|
  select placa, from: 'placa'
end

Then('o sistema exibe a lista de rotas percorridas pelo onibus') do
  expect(page).to have_content('Resultados')
  expect(page).to have_content('nome 1')
  expect(page).to have_content('nome 2')
end

Then('o sistema exibe a mensagem {string}') do |mensagem|
  expect(page).to have_content(mensagem)
end

And('eu clico no botao buscar') do
  click_button 'Buscar'
end