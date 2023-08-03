Given('eu estou na pagina de onibus') do
  visit "onibus"
end

When('eu acesso a pagina de cadastro de onibus') do
  visit "onibus/new"
  expect(page).to have_content("Novo onibus")
end

When('eu preencho a placa {string}, modelo {string}, ano {string}, capacidade {string}') do |placa, modelo, ano, capacidade|
  fill_in "onibus[placa]", with: placa
  fill_in "onibus[modelo]", with: modelo
  fill_in "onibus[ano]", with: ano
  fill_in "onibus[capacidade]", with: capacidade
end

When('clico no botao para cadastrar o onibus') do
  click_button "Criar Onibus"
end

Then('vejo os detalhes do onibus que foi criado') do
  expect(page).to have_content("Onibus criado com sucesso.")
end

Then('vejo a mensagem de erro de placa invalida') do
  expect(page).to have_content("Placa invalida")
end
