Given('que eu estou na pagina de cadastro de motorista ') do
  visit '/motorista/new'
end

And('eu preencho {string} com {string}') do |campo, valor|
  fill_in "motoristum[#{campo}]", with: valor
end

When('eu estou na pagina de busca de motorista') do
  visit '/motorista/buscar_motorista'
end

And('digito {string} no campo de busca') do |valor|
  fill_in 'Digite o nome, CPF ou email do motorista', with: valor
end

And("clico em {string}") do |botao|
  click_button botao
end

Then('como resultado aparece o motorista de {string} de {string}') do |campo, valor|
  expect(page).to have_content("#{campo}: #{valor}")
end

And('eu preencho a busca com {string}') do |valor|
  fill_in "query", with: valor
end

Then('como resultado aparece a mensagem de que nenhum motorista foi encontrado') do
  expect(page).to have_content('Nenhum motorista encontrado.')
end
