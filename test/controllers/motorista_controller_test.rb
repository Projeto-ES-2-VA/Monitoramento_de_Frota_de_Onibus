require "test_helper"

class MotoristaControllerTest < ActionDispatch::IntegrationTest
  setup do
    @motoristum = motorista(:one)
  end

  test "should get index" do
    get motorista_url
    assert_response :success
  end

  test "should get new" do
    get new_motoristum_url
    assert_response :success
  end

  test "should create motoristum" do
    assert_difference("Motoristum.count") do
      post motorista_url, params: { motoristum: { cnh: @motoristum.cnh, cpf: @motoristum.cpf, email: @motoristum.email, nome: @motoristum.nome, senha: @motoristum.senha, telefone: @motoristum.telefone } }
    end

    assert_redirected_to motoristum_url(Motoristum.last)
  end

  test "should show motoristum" do
    get motoristum_url(@motoristum)
    assert_response :success
  end

  test "should get edit" do
    get edit_motoristum_url(@motoristum)
    assert_response :success
  end

  test "should update motoristum" do
    patch motoristum_url(@motoristum), params: { motoristum: { cnh: @motoristum.cnh, cpf: @motoristum.cpf, email: @motoristum.email, nome: @motoristum.nome, senha: @motoristum.senha, telefone: @motoristum.telefone } }
    assert_redirected_to motoristum_url(@motoristum)
  end

  test "should destroy motoristum" do
    assert_difference("Motoristum.count", -1) do
      delete motoristum_url(@motoristum)
    end

    assert_redirected_to motorista_url
  end
end
