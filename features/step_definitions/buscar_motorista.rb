Given('que eu estou na pagina de cadastro de motorista ') do
  visit '/motorista/new'
end

And('preencho o nome do motorista: {string}') do |nome|
  fill_in "motoristum[nome]", with: nome
end

And('preencho o cpf do motorista: {string}') do |cpf|
  fill_in "motoristum[cpf]", with: cpf
end

And('preencho o email do motorista: {string}') do |email|
  fill_in "motoristum[email]", with: email
end

And('preencho a senha do motorista: {string}') do |senha|
  fill_in "motoristum[senha]", with: senha
end

And('preencho o telefone do motorista: {string}') do |telefone|
  fill_in "motoristum[telefone]", with: telefone
end

And('preencho o cnh do motorista: {string}') do |cnh|
  fill_in "motoristum[cnh]", with: cnh
end

And('clico em criar um motorista') do
  click_button 'Create Motoristum'
end

When('o usuario esta na pagina de busca de motorista') do
  visit '/motorista/buscar_motorista'
end

And('digita o nome {string} do motorista que deseja buscar') do |nome|
  fill_in 'Digite o nome, CPF ou email do motorista', with: nome
end

And('digita o cpf {string} do motorista que deseja buscar') do |cpf|
  fill_in 'Digite o nome, CPF ou email do motorista', with: cpf
end

And('digita o email {string} do motorista que deseja buscar') do |email|
  fill_in 'Digite o nome, CPF ou email do motorista', with: email
end

And("clica no botao buscar") do
  click_button "Buscar"
end

Then('como resultado aparece o motorista de nome {string}') do |nome|
  expect(page).to have_content(nome)
end

Then('como resultado aparece o motorista de cpf {string}') do |cpf|
  expect(page).to have_content(cpf)
end

Then('como resultado aparece o motorista de email {string}') do |email|
  expect(page).to have_content(email)
end

And('digita um cpf {string} que nao existe no banco de dados') do |cpf|
  fill_in 'Digite o nome, CPF ou email do motorista', with: cpf
end

And('digita um email {string} que nao existe no banco de dados') do |email|
  fill_in 'Digite o nome, CPF ou email do motorista', with: email
end

Then('como resultado aparece a mensagem de que nenhum motorista foi encontrado') do
  expect(page).to have_content('Nenhum motorista encontrado.')
end
