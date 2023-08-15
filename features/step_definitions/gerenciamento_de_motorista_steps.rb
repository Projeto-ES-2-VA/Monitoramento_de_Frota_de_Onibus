Given('eu que sou um usuario do sistema') do
  visit "motorista"
  expect(page).to have_content("Motorista")
end

When('eu acesso a pagina de registro do motorista') do
  visit "motorista/new"
  expect(page).to have_content("New motoristum")
end

And('preencho {string} com {string}') do |campo, valor|
  fill_in "motoristum[#{campo}]", with: valor
end

When('clico no botao para cadastrar o motorista') do
  click_button "Create Motoristum"
end

#REGISTRAR COM DADOS INVALIDOS
Given('existe um motorista registrado com cpf {string}') do |cpf|
  visit '/motorista/new'
  fill_in 'Nome', with: 'Henrique Almeida'
  fill_in 'Cpf', with: cpf
  fill_in 'Email', with: 'almeida@gmail.com'
  fill_in 'Senha', with: '12345@'
  fill_in 'Telefone', with: '11123456789'
  fill_in 'Cnh', with: '0123456789'
  click_button 'Create Motoristum'
end

#REMOVER MOTORISTA
Given('eu estou na pagina de listagem de motorista') do
  visit 'motorista'
end

When('eu acesso um motorista em especifico') do
  click_on 'Show this motoristum'
end

When('eu clico para excluir o motorista') do
  click_button 'Destroy this motoristum'
end

#EDITAR MOTORISTA
Given('o motorista de nome: {string}, cpf: {string}, email: {string}, senha: {string}, telefone: {string} , e cnh: {string}') do |nome, cpf, email, senha, telefone, cnh|
  fill_in "motoristum[nome]", with: nome
  fill_in "motoristum[cpf]", with: cpf
  fill_in "motoristum[email]", with: email
  fill_in "motoristum[senha]", with: senha
  fill_in "motoristum[telefone]", with: telefone
  fill_in "motoristum[cnh]", with: cnh
  end

When('eu clico para editar motorista') do
  click_on 'Edit this motoristum'
end

When('clico para atualizar o motorista') do
  click_button 'Update Motoristum'
end

Then('aparece a mensagem {string}') do |mensagem|
  expect(page).to have_content(mensagem)
end

Then('eu vejo os detalhes do motorista com o cpf: {string} e vejo os campos do mesmo') do |cpf|
  motorista = Motoristum.find_by(cpf: cpf)
  expect(page).to have_content("Nome: #{motorista.nome}")
  expect(page).to have_content("Cpf: #{motorista.cpf}")
  expect(page).to have_content("Email: #{motorista.email}")
  expect(page).to have_content("Telefone: #{motorista.telefone}")
  expect(page).to have_content("Cnh: #{motorista.cnh}")
end