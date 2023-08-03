require "test_helper"

class OnibusesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @onibus = onibuses(:one)
  end

  def skip_test_should_get_index
    get onibuses_url
    assert_response :success
  end

  def skip_test_should_get_new
    get new_onibus_url
    assert_response :success
  end

  def skip_test_should_create_onibus
    assert_difference("Onibus.count") do
      post onibuses_url, params: { onibus: { capacidade: @onibus.capacidade, chassi: @onibus.chassi, modelo: @onibus.modelo, placa: @onibus.placa, status: @onibus.status } }
    end

    assert_redirected_to onibus_url(Onibus.last)
  end

  def skip_test_should_show_onibus
    get onibus_url(@onibus)
    assert_response :success
  end

  def skip_test_should_get_edit
    get edit_onibus_url(@onibus)
    assert_response :success
  end

  def skip_test_should_update_onibus
    patch onibus_url(@onibus), params: { onibus: { capacidade: @onibus.capacidade, chassi: @onibus.chassi, modelo: @onibus.modelo, placa: @onibus.placa, status: @onibus.status } }
    assert_redirected_to onibus_url(@onibus)
  end

  def skip_should_destroy_onibus
    assert_difference("Onibus.count", -1) do
      delete onibus_url(@onibus)
    end

    assert_redirected_to onibuses_url
  end
end
