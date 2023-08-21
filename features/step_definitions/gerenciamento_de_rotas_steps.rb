Given('que eu estou na pagina de cadastro de onibus') do
  visit '/onibuses/new'
end

When('que eu estou na pagina de cadastro de rota') do
  visit '/rota/new'
end

Given('que eu estou na pagina de cadastro de motorista') do
  visit '/motorista/new'
end

And('preencho {string} de {string} com {string}') do |campo, classe, valor|
  fill_in "#{classe}[#{campo}]", with: valor
end

And('preencho {string} de {string} com {float}') do |campo, classe, valor|
  fill_in "#{classe}[#{campo}]", with: valor
end

And('preencho {string} de {string} com  {int}') do |campo, classe, valor|
  fill_in "#{classe}[#{campo}]", with: valor
end

And('seleciono {string} como {string} de {string}') do |valor, campo, classe|
  select(valor, from: "#{classe}[#{campo}]")
end

And('eu clico em {string}') do |botao|
  click_link_or_button botao
end

Then('eu vejo a mensagem {string}') do |mensagem|
  expect(page).to have_content(mensagem)
end

Then('eu devo ser redirecionado para a pagina da rota que foi criada') do
  expect(page).to have_current_path(rotum_path(Rotum.last))
end

When("acesso a rota de nome {string}") do |nome|
  visit "/rota/#{Rotum.find_by(nome: nome).id}"
  expect(page).to have_content(nome)
end

Then("aparece uma mensagem {string}") do |mensagem|
  expect(page).to have_content(mensagem)
end