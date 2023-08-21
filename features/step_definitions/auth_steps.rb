Given('estou na pagina de login') do
    visit '/users/sign_in'
end

And('entao clico em {string}') do |botao|
    click_link_or_button botao
end

When('estou na pagina de cadastro') do
    expect(page).to have_content('Sign up')
end

And('entao eu preencho {string} com {string}') do |campo, valor|
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
