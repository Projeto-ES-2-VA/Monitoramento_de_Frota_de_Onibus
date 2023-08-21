Given('que eu acesso a pagina de registro de onibus') do
  visit "onibuses/new"
  expect(page).to have_content("New onibus")
end

And('entao preencho {string} com {string}') do |campo, valor|
  fill_in "onibus[#{campo}]", with: valor
end

And('entao seleciono {string} como {string}') do |valor, campo|
  select(valor, from: "onibus[#{campo}]")
end

And('clico em um botao {string}') do |botao|
  click_button botao
end

Then('vejo a mensagem {string}') do |mensagem|
  expect(page).to have_content(mensagem)
end

When('eu acesso a pagina de visualizacao do onibus com a placa {string}') do |placa|
  visit "/onibuses/#{Onibus.find_by(placa: placa).id}"
end

And('eu clico no link {string}') do |link|
  click_on(link)
end
