# arquivo: features/step_definitions/busca_rotas_steps.rb

Given('que existem dados de rotas registrados no sistema') do
  # Aqui você pode criar dados de rotas no banco de dados ou utilizar alguma biblioteca para isso.
  # Por exemplo, você pode usar FactoryBot para criar registros de rotas fictícias.
  FactoryBot.create_list(:rota, 5) # Exemplo: Cria 5 registros fictícios de rotas
end

Given('um ônibus com a placa {string} já percorreu algumas rotas') do |placa|
  # Aqui você pode criar um ônibus com a placa informada e associar algumas rotas a ele.
  # Por exemplo, supondo que você tenha um modelo Bus e um modelo Rota, você pode fazer algo como:
  bus = FactoryBot.create(:bus, placa: placa)
  FactoryBot.create_list(:rota, 3, buses: [bus]) # Exemplo: Cria 3 registros fictícios de rotas e associa ao ônibus criado
end

When('eu informo a placa do ônibus como {string}') do |placa|
  # Aqui você pode implementar a lógica para informar a placa do ônibus na sua aplicação.
  # Por exemplo, supondo que você tenha um formulário para inserir a placa, você pode fazer algo como:
  fill_in 'placa_do_onibus', with: placa
  click_button 'Buscar'
end

Then('o sistema exibe a lista de rotas percorridas pelo ônibus') do
  # Aqui você pode implementar a verificação de que a lista de rotas do ônibus é exibida na tela.
  # Por exemplo, supondo que você tenha uma página de exibição das rotas do ônibus, você pode fazer algo como:
  expect(page).to have_content('Rota 1')
  expect(page).to have_content('Rota 2')
  expect(page).to have_content('Rota 3')
  # Verifique se as rotas exibidas correspondem às rotas associadas ao ônibus informado.
end

Then('o sistema exibe uma mensagem de erro informando que a placa é inválida') do
  # Aqui você pode implementar a verificação de que uma mensagem de erro é exibida na tela.
  # Por exemplo, supondo que você tenha um formulário de busca e um campo de placa inválida, você pode fazer algo como:
  expect(page).to have_content('Placa inválida. Por favor, insira uma placa válida.')
end

Given('um ônibus com a placa {string} ainda não percorreu nenhuma rota') do |placa|
  # Neste passo, você pode criar um ônibus com a placa informada sem associar nenhuma rota a ele.
  # Por exemplo, supondo que você tenha um modelo Bus, você pode fazer algo como:
  FactoryBot.create(:bus, placa: placa)
end

Then('o sistema exibe uma mensagem informando que o ônibus ainda não possui rotas registradas') do
  # Aqui você pode implementar a verificação de que uma mensagem é exibida na tela.
  # Por exemplo, supondo que você tenha uma página de exibição das rotas do ônibus, você pode fazer algo como:
  expect(page).to have_content('Esse ônibus ainda não possui rotas registradas.')
end

When('eu informo a placa do ônibus em branco') do
  # Aqui você pode implementar a lógica para informar uma placa em branco na sua aplicação.
  # Por exemplo, supondo que você tenha um formulário para inserir a placa, você pode fazer algo como:
  fill_in 'placa_do_onibus', with: ''
  click_button 'Buscar'
end

Then('o sistema exibe uma mensagem de erro informando que a placa deve ser preenchida') do
  # Aqui você pode implementar a verificação de que uma mensagem de erro é exibida na tela.
  # Por exemplo, supondo que você tenha um formulário de busca e um campo de placa vazio, você pode fazer algo como:
  expect(page).to have_content('Por favor, preencha a placa do ônibus.')
end

Given('não há registros de um ônibus com a placa {string}') do |placa|
  # Neste passo, você pode verificar se não há registros de um ônibus com a placa informada no banco de dados.
  # Por exemplo, supondo que você tenha um modelo Bus, você pode fazer algo como:
  bus = Bus.find_by(placa: placa)
  expect(bus).to be_nil
end

Then('o sistema exibe uma mensagem informando que o ônibus com essa placa não foi encontrado') do
  # Aqui você pode implementar a verificação de que uma mensagem é exibida na tela.
  # Por exemplo, supondo que você tenha um formulário de busca e nenhum ônibus é encontrado com a placa informada, você pode fazer algo como:
  expect(page).to have_content('Nenhum ônibus encontrado com a placa informada.')
end
