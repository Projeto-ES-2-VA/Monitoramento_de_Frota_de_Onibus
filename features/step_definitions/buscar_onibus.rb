And('que eu estou em cadastro de onibus') do
  visit '/onibuses/new'
end

When('estou em busca de onibus') do
  visit '/onibuses/busca'
end

And('entao  preencho {string} com {string}') do |campo, valor|
  fill_in "onibus[#{campo}]", with: valor
end

And('entao preencho busca com {string}') do |valor|
  fill_in "data", with: valor
end


And('entao  preencho {string} com {float}') do |campo, valor|
  fill_in "onibus[#{campo}]", with: valor
end

And('entao  preencho {string} com  {int}') do |campo, valor|
  fill_in "onibus[#{campo}]", with: valor
end

And('seleciono {string} como {string}') do |valor, campo|
  select(valor, from: "onibus[#{campo}]")
end

When('escolho a caracteristica {string}') do |param|
  choose(param)
end

And('clica em {string}') do |botao|
  click_link_or_button botao
end

Then('aparece o onibus de placa {string} buscado por {string}') do |placa, param|
  expect(page).to have_content("Resultados da Busca por #{param}")
  expect(page).to have_content("Placa: #{placa}")
end

Then('vejo aparecer a mensagem {string}') do |mensagem|
  expect(page).to have_content(mensagem)
end