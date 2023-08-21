Given('que eu acesso a pagina de registro do motorista') do
  visit "motorista/new"
  expect(page).to have_content("New motoristum")
end

And('preencho {string} com {string}') do |campo, valor|
  fill_in "motoristum[#{campo}]", with: valor
end

And("clico no botao {string}") do |botao|
  click_button botao
end

And("clico no link {string}") do |link|
  click_on(link)
end

And('eu acesso a pagina de listagem de motorista') do
  visit 'motorista'
end

And('eu acesso a pagina de visualizacao de um motorista com cpf {string}') do |cpf|
  visit "/motorista/#{Motoristum.find_by(cpf: cpf).id}"
end

Then('aparece a mensagem {string}') do |mensagem|
  expect(page).to have_content(mensagem)
end

Then('eu vejo os detalhes do motorista com o cpf: {string}') do |cpf|
  expect(page).to have_content("Cpf: #{cpf}")
end
