Given('que eu sou um usuario do sistema') do
  visit "onibuses"
  expect(page).to have_content("Onibuses")
end

Given('eu acesso a pagina de registro de onibus') do
  visit "onibuses/new"
  expect(page).to have_content("New onibus")
end

When('preencho as informacoes do onibus placa {string}, modelo {string}, chassi {string}, capacidade {string}, status {string}') do |placa, modelo, chassi, capacidade, status|
  fill_in "onibus[placa]", with: placa
  fill_in "onibus[modelo]", with: modelo
  fill_in "onibus[chassi]", with: chassi
  fill_in "onibus[capacidade]", with: capacidade
  select status, from: "onibus[status]"
end

When('clico no botao para cadastrar o onibus') do
  click_button "Create Onibus"
end

Then('vejo uma mensagem de confirmacao de registro do onibus') do
  expect(page).to have_content('Onibus was successfully created.')
end

Given('existe um onibus registrado com placa {string}') do |placa|
  visit '/onibuses/new'
  fill_in 'Placa', with: placa
  fill_in 'Chassi', with: '7y6JXw8Kbj38k4700'
  fill_in 'Modelo', with: 'modelo'
  fill_in 'Capacidade', with: 40
  select('em operação', from: 'Status')
  click_button 'Create Onibus'
end

When('atualizo as informacoes do onibus modelo {string}') do |modelo|
  fill_in 'Modelo', with: modelo
end

When('clico no botao de atualizacao') do
  click_button 'Update Onibus'
end

Then('vejo uma mensagem de confirmacao de atualizacao das informacoes do onibus') do
  expect(page).to have_content('Onibus was successfully updated.')
end

When('eu acesso a pagina de edicao do onibus com a placa {string}') do |placa|
  visit "/onibuses/#{Onibus.find_by(placa: placa).id}/edit"
end

When('eu acesso a pagina de visualizacao do onibus com a placa {string}') do |placa|
  visit "/onibuses/#{Onibus.find_by(placa: placa).id}"
end

Then('vejo uma mensagem informando que nao e possivel cadastrar o onibus') do
  expect(page).to have_content('8 errors prohibited this onibus from being saved:')
end

And('atualizo as informacoes do onibus para a placa {string}') do |placa|
  fill_in 'Placa', with: placa
end

Then('vejo uma mensagem de falha ao tentar atualizar a placa') do
  expect(page).to have_content('Placa is invalid')
end

When('eu clico para excluir o onibus') do
  click_button 'Destroy this onibus'
end

Then('aparece uma mensagem dizendo que o onibus foi excluido com sucesso') do
  expect(page).to have_content('Onibus was successfully destroyed.')
end



