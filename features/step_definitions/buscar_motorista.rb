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

And('digita o nome do motorista que deseja buscar') do
  fill_in 'Digite o nome, CPF ou email do motorista', with: "Maria Josefa"
end

And("clica no botao buscar") do
  click_button "Buscar"
end

Then('aparece o motorista desejado') do
  expect('/motorista/buscar_motorista?query=Maria+Josefa&commit=Buscar ')
end

And('digita o cpf do motorista que deseja buscar') do
  fill_in 'Digite o nome, CPF ou email do motorista', with: "11578944433"
end

Then('aparece o motorista desejado buscado por cpf') do
  expect('/motorista/buscar_motorista?query=11578944433&commit=Buscar ')
end

And('digita o email do motorista que deseja buscar') do
  fill_in 'Digite o nome, CPF ou email do motorista', with: "teste2@cucumber.com"
end

Then('aparece o motorista desejado buscado por email') do
  expect('/motorista/buscar_motorista?query=teste2%40cucumber.com&commit=Buscar ')
end

And('digita um cpf que nao existe no banco de dados') do
  fill_in 'Digite o nome, CPF ou email do motorista', with: "11578944400"
end

And('digita um email que nao existe no banco de dados') do
  fill_in 'Digite o nome, CPF ou email do motorista', with: "inesbrasil@cucumber.com"
end

Then('aparece a mensagem de que nenhum motorista foi encontrado') do
  expect(page).to have_content('Nenhum motorista encontrado.')
end
