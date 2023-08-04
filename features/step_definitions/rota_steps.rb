require 'rspec/expectations'

Given('que existem dados de rotas registrados no sistema') do
  onibus1 = Onibus.create(placa: 'ABC-1235', chassi: '12121212121212122', modelo: 'Modelo A', capacidade: 50, status: 'em operação')
  onibus2 = Onibus.create(placa: 'DEF-5678', chassi: '12121212121212123', modelo: 'Modelo B', capacidade: 40, status: 'em operação')

  Rotum.create(nome: 'Rota 1', valor: 10.0, distancia: 100.0, duracao: 120, inicio: Time.now, fim: Time.now + 2.hours, origem: 'Origem 1', destino: 'Destino 1', onibus: onibus1)
  Rotum.create(nome: 'Rota 2', valor: 15.0, distancia: 150.0, duracao: 180, inicio: Time.now, fim: Time.now + 3.hours, origem: 'Origem 2', destino: 'Destino 2', onibus: onibus2)
end


Given('um ônibus com a placa {string} já percorreu algumas rotas') do |placa|
  @onibus = Onibus.create(placa: placa, chassi: '12121212121212121', modelo: 'Modelo A', capacidade: 50, status: 'em operação')

  Rotum.create(nome: 'Rota 1', valor: 10.0, distancia: 100.0, duracao: 120, inicio: Time.now, fim: Time.now + 2.hours, origem: 'Origem 1', destino: 'Destino 1', onibus: @onibus)
  Rotum.create(nome: 'Rota 2', valor: 15.0, distancia: 150.0, duracao: 180, inicio: Time.now, fim: Time.now + 3.hours, origem: 'Origem 2', destino: 'Destino 2', onibus: @onibus)
end

When('eu informo a placa do ônibus com placa {string}') do |placa|

  visit buscar_por_onibus_path
  select placa, from: 'placa'
  click_button 'Buscar'
end

Then('o sistema exibe a lista de rotas percorridas pelo ônibus') do

  expect(page).to have_content('Resultados:')


end

#####################################################################################################################


Given('não existe dados de rotas registrados no sistema') do
end

Given('um ônibus com a placa {string} não percorreu nenhuma rota') do |placa|
  Onibus.create(placa: placa, chassi: '12121212121212126', modelo: 'Modelo A', capacidade: 50, status: 'em operação')
end

When('eu informo a placa do ônibus cadastrado com a placa {string}') do |placa|

  visit buscar_por_onibus_path
  select placa, from: 'placa'
  click_button 'Buscar'
end



Then('o sistema exibe uma mensagem que nenhum resultado foi encontrado') do
  expect(page).to have_content('Nenhum resultado encontrado.')
end

#####################################

Then('o sistema exibe uma mensagem informando que o ônibus não possui rotas cadastradas') do
  pending # Write code here that turns the phrase above into concrete actions
end

Given('um ônibus com a placa {string} já percorreu várias rotas') do |string|
  pending # Write code here that turns the phrase above into concrete actions
end

Then('o sistema exibe a lista de todas as rotas percorridas pelo ônibus') do
  pending # Write code here that turns the phrase above into concrete actions
end

Given('um ônibus com a placa {string} já percorreu uma única rota') do |string|
  pending # Write code here that turns the phrase above into concrete actions
end

Then('o sistema exibe a lista com os detalhes da rota percorrida pelo ônibus') do
  pending # Write code here that turns the phrase above into concrete actions
end
