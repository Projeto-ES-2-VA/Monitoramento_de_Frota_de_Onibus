Given('que eu sou um usuario do sistema') do
  visit "onibuses"
  expect(page).to have_content("Onibuses")
end

Given('eu acesso a pagina de registro de onibus') do
  visit "onibuses/new"
  expect(page).to have_content("New onibus")
end

When("preencho as informacoes do onibus placa {string}, modelo {string}, chassi {string}, capacidade {int}, status {string}") do |placa, modelo, chassi, capacidade, status|
  fill_in "onibus[placa]", with: placa
  fill_in "onibus[modelo]", with: modelo
  fill_in "onibus[chassi]", with: chassi
  fill_in "onibus[capacidade]", with: capacidade
  select status, from: "onibus[status]"
end

When('clico no botao para cadastrar o onibus') do
  click_button "Create Onibus"
end

When('eu acesso a pagina de edicao de onibus para a placa {string}') do |placa|
  click_link 'Edit this onibus'
  fill_in 'onibus[placa]', with: placa
  click_button 'Update Onibus'
  expect(page).to have_content("Onibus was successfully updated.")
end

Then('vejo os detalhes do onibus que foi criado') do
  expect(page).to have_content("Onibus was successfully created.")
end

Then('vejo a mensagem de erro de placa invalida') do
  expect(page).to have_content("Placa is invalid")
end

Then('vejo a mensagem que todos os campos precisam ser preenchidos') do
  expect(page).to have_content("8 errors prohibited this onibus from being saved:")
end


