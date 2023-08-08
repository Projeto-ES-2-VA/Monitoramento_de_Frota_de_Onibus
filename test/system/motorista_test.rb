require "application_system_test_case"

class MotoristaTest < ApplicationSystemTestCase
  setup do
    @motoristum = motorista(:one)
  end

  test "visiting the index" do
    visit motorista_url
    assert_selector "h1", text: "Motorista"
  end

  test "should create motoristum" do
    visit motorista_url
    click_on "New motoristum"

    fill_in "Cnh", with: @motoristum.cnh
    fill_in "Cpf", with: @motoristum.cpf
    fill_in "Email", with: @motoristum.email
    fill_in "Nome", with: @motoristum.nome
    fill_in "Senha", with: @motoristum.senha
    fill_in "Telefone", with: @motoristum.telefone
    click_on "Create Motoristum"

    assert_text "Motoristum was successfully created"
    click_on "Back"
  end

  test "should update Motoristum" do
    visit motoristum_url(@motoristum)
    click_on "Edit this motoristum", match: :first

    fill_in "Cnh", with: @motoristum.cnh
    fill_in "Cpf", with: @motoristum.cpf
    fill_in "Email", with: @motoristum.email
    fill_in "Nome", with: @motoristum.nome
    fill_in "Senha", with: @motoristum.senha
    fill_in "Telefone", with: @motoristum.telefone
    click_on "Update Motoristum"

    assert_text "Motoristum was successfully updated"
    click_on "Back"
  end

  test "should destroy Motoristum" do
    visit motoristum_url(@motoristum)
    click_on "Destroy this motoristum", match: :first

    assert_text "Motoristum was successfully destroyed"
  end
end
