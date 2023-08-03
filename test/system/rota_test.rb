require "application_system_test_case"

class RotaTest < ApplicationSystemTestCase
  setup do
    @rotum = rota(:one)
  end

  test "visiting the index" do
    visit rota_url
    assert_selector "h1", text: "Rota"
  end

  test "should create rotum" do
    visit rota_url
    click_on "New rotum"

    fill_in "Destino", with: @rotum.destino
    fill_in "Distancia", with: @rotum.distancia
    fill_in "Duracao", with: @rotum.duracao
    fill_in "Fim", with: @rotum.fim
    fill_in "Inicio", with: @rotum.inicio
    fill_in "Nome", with: @rotum.nome
    fill_in "Onibus", with: @rotum.onibus_id
    fill_in "Origem", with: @rotum.origem
    fill_in "Valor", with: @rotum.valor
    click_on "Create Rotum"

    assert_text "Rotum was successfully created"
    click_on "Back"
  end

  test "should update Rotum" do
    visit rotum_url(@rotum)
    click_on "Edit this rotum", match: :first

    fill_in "Destino", with: @rotum.destino
    fill_in "Distancia", with: @rotum.distancia
    fill_in "Duracao", with: @rotum.duracao
    fill_in "Fim", with: @rotum.fim
    fill_in "Inicio", with: @rotum.inicio
    fill_in "Nome", with: @rotum.nome
    fill_in "Onibus", with: @rotum.onibus_id
    fill_in "Origem", with: @rotum.origem
    fill_in "Valor", with: @rotum.valor
    click_on "Update Rotum"

    assert_text "Rotum was successfully updated"
    click_on "Back"
  end

  test "should destroy Rotum" do
    visit rotum_url(@rotum)
    click_on "Destroy this rotum", match: :first

    assert_text "Rotum was successfully destroyed"
  end
end
