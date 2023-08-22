Given('eu quem estou na pagina de cadastro de onibus') do
  visit '/onibuses/new'
end

Given('eu quem estou na pagina de cadastro de motorista') do
  visit '/motorista/new'
end

When('eu quem estou na pagina de cadastro de rota') do
  visit '/rota/new'
end

And('eu quem preencho {string} de {string} com {string}') do |campo, classe, valor|
  fill_in "#{classe}_#{campo}", with: valor
end

And('eu quem preencho {string} de {string} com {int}') do |campo, classe, valor|
  fill_in "#{classe}_#{campo}", with: valor
end

And('eu quem preencho {string} de {string} com  {float}') do |campo, classe, valor|
  fill_in "#{classe}_#{campo}", with: valor
end

And('eu seleciono {string} como {string} de {string}') do |valor, campo, classe|
  select(valor, from: "#{classe}_#{campo}")
end

And("eu visito a pagina de buscar rotas por onibus") do
  visit buscar_por_onibus_path
  expect(page).to have_content("Buscar")
end

And('eu seleciono a placa {string} do onibus') do |placa|
  select placa, from: 'placa'
end

Then('o sistema exibe a rota de nome {string}') do |nome|
  expect(page).to have_content('Resultados')
  expect(page).to have_content(nome)
end

Then('exibe a mensagem {string}') do |mensagem|
  expect(page).to have_content(mensagem)
end

And('entao clico no botao {string}') do |botao|
  click_button botao
end
