#REGISTRAR COM DADOS VALIDOS
Given('eu que sou um usuario do sistema') do
  visit "motorista"
  expect(page).to have_content("Motorista")
end

When('eu acesso a pagina de registro do motorista') do
  visit "motorista/new"
  expect(page).to have_content("New motoristum")
end

When('o motorista de nome: {string}, cpf: {string}, email: {string}, senha: {string}, telefone: {string} , e cnh: {string}, existe') do |nome, cpf, email, senha, telefone, cnh|
  fill_in "motoristum[nome]", with: nome
  fill_in "motoristum[cpf]", with: cpf
  fill_in "motoristum[email]", with: email
  fill_in "motoristum[senha]", with: senha
  fill_in "motoristum[telefone]", with: telefone
  fill_in "motoristum[cnh]", with: cnh
end

When('clico no botao para cadastrar o motorista') do
  click_button "Create Motoristum"
end

Then('vejo uma mensagem de confirmacao de registro do motorista') do
  expect(page).to have_content('Motoristum was successfully created.')
end

Then('vejo uma mensagem informando que nao e possivel cadastrar o motorista') do
  expect(page).to have_content('16 errors prohibited this motoristum from being saved:')
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

When('eu acesso a pagina de visualizacao do motorista com o cpf {string}') do |cpf|
  visit "/motorista/#{Motoristum.find_by(cpf: cpf).id}"
end

When('eu clico para excluir o motorista') do
  click_button 'Destroy this motoristum'
end

Then('aparece uma mensagem dizendo que o motorista foi excluido com sucesso') do
  expect(page).to have_content('Motoristum was successfully destroyed.')
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

When('eu acesso a pagina de edicao do motorista com o cpf {string}') do |cpf|
  visit "/motorista/#{Motoristum.find_by(cpf: cpf).id}/edit"
end

And('eu atualizo o email do motorista para {string}') do |email|
  fill_in 'Email', with: email
end

And('atualizo o telefone do motorista para {string}') do |telefone|
  fill_in 'Telefone', with: telefone
end

When('clico para atualizar o motorista') do
  click_button 'Update Motoristum'
end

Then('vejo uma mensagem de falha ao tentar atualizar o telefone') do
  expect(page).to have_content('1 error prohibited this motoristum from being saved')
end

Then('aparece uma mensagem dizendo que a motorista foi atualizado com sucesso') do
  expect(page).to have_content('Motoristum was successfully updated.')
end
