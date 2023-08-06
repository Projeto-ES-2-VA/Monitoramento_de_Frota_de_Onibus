require 'rspec/expectations'

Given('dado que existe um onibus com placa {string}') do |placa|
  visit '/onibuses/new'
  fill_in 'Placa', with: placa
  fill_in 'Chassi', with: "11111111111111111"
  fill_in 'Modelo', with: "modelo"
  fill_in 'Capacidade', with: 50
  select("em operação", from: 'Status')
  click_button 'Create Onibus'
  expect(page).to have_content(placa)
end

Given('que existem duas rotas registrados no sistema para a placa {string}') do |placa|
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

  click_button 'Create Rotum'

  visit '/rota'
  expect(page).to have_content("nome 2")
end

# And("eu visito a pagina de buscar rotas por onibus") do
#   visit buscar_por_onibus_path
#   expect(page).to have_content("Buscar")
# end

Given("eu visito a pagina de buscar rotas por onibus") do
  visit buscar_por_onibus_path
  expect(page).to have_content("Buscar")
end

When('eu informo a placa {string} do onibus') do |placa|
  select placa, from: 'placa'
  click_button 'Buscar'
end

Then('o sistema exibe a lista de rotas percorridas pelo onibus') do
  expect(page).to have_content('Resultados')
  expect(page).to have_content('nome 1')
  expect(page).to have_content('nome 2')
end

Given ("um onibus com a placa {string} nao percorreu nenhuma rota") do |placa|           # features/rota.feature:13
  fill_in "Field",	with: "sometext"
end


Given('um onibus com a placa {string} nao percorreu nenhuma rota') do |placa|
  Onibus.create(placa: placa, chassi: '12121212121212126', modelo: 'Modelo A', capacidade: 50, status: 'em operação')
end

When('eu informo a placa do onibus cadastrado com a placa {string}') do |placa|
  visit buscar_por_onibus_path
  select placa, from: 'placa'
  click_button 'Buscar'
end

Then('o sistema exibe uma mensagem informando que nenhum resultado foi encontrado') do
  expect(page).to have_content('Nenhum resultado encontrado.')
end

And ('eu clico no botao buscar') do
  click_button 'Buscar'
end
