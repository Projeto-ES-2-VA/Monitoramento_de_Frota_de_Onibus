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
  fill_in "#{classe}_#{campo}", with: valor
end

And('preencho {string} de {string} com  {int}') do |campo, classe, valor|
  fill_in "#{classe}_#{campo}", with: valor
  end

And('preencho {string} de {string} com {float}') do |campo, classe, valor|
  fill_in "#{classe}_#{campo}", with: valor
  end

And('seleciono {string} como {string} de {string}') do |valor, campo, classe|
  select(valor, from: "#{classe}_#{campo}")
end

And('eu clico em {string}') do |botao|
  click_link_or_button botao
end

Then('eu vejo a mensagem {string}') do |mensagem|
  expect(page).to have_content(mensagem)
end

