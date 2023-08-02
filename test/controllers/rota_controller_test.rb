require "test_helper"

class RotaControllerTest < ActionDispatch::IntegrationTest
  setup do
    @rotum = rota(:one)
  end

  test "should get index" do
    get rota_url
    assert_response :success
  end

  test "should get new" do
    get new_rotum_url
    assert_response :success
  end

  test "should create rotum" do
    assert_difference("Rotum.count") do
      post rota_url, params: { rotum: { destino: @rotum.destino, distancia: @rotum.distancia, duracao: @rotum.duracao, fim: @rotum.fim, inicio: @rotum.inicio, nome: @rotum.nome, onibus_id: @rotum.onibus_id, origem: @rotum.origem, valor: @rotum.valor } }
    end

    assert_redirected_to rotum_url(Rotum.last)
  end

  test "should show rotum" do
    get rotum_url(@rotum)
    assert_response :success
  end

  test "should get edit" do
    get edit_rotum_url(@rotum)
    assert_response :success
  end

  test "should update rotum" do
    patch rotum_url(@rotum), params: { rotum: { destino: @rotum.destino, distancia: @rotum.distancia, duracao: @rotum.duracao, fim: @rotum.fim, inicio: @rotum.inicio, nome: @rotum.nome, onibus_id: @rotum.onibus_id, origem: @rotum.origem, valor: @rotum.valor } }
    assert_redirected_to rotum_url(@rotum)
  end

  test "should destroy rotum" do
    assert_difference("Rotum.count", -1) do
      delete rotum_url(@rotum)
    end

    assert_redirected_to rota_url
  end
end
