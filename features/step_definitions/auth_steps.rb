Given('sou um usuario autenticado do sistema com email {string} e senha {string}') do |email, senha|
    visit '/users/sign_up'
    fill_in 'user_email', with: email
    fill_in 'user_password', with: senha
    fill_in 'user_password_confirmation', with: senha
    click_link_or_button 'Sign up'
    expect(page).to have_content('Welcome! You have signed up successfully.')
end

Given('estou na pagina de login') do
    visit '/users/sign_in'
end

And('entao clico em {string}') do |botao|
    click_link_or_button botao
end

When('estou na pagina de cadastro') do
    expect(page).to have_content('Sign up')
end

And('entao eu preencho  {string} com {string}') do |campo, valor|
    fill_in "user_#{campo}", with: valor
end

Then('sou redirecionado para a pagina de {string}') do |pagina|
    case pagina
    when 'login'
        expect(page).to have_content('Log in')
    end
end

And('entao vejo a mensagem {string}') do |mensagem|
    expect(page).to have_content(mensagem)
end
