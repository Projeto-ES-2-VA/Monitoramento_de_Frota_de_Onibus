require "test_helper"

class RotumTest < ActiveSupport::TestCase
  test "cadastro de rota com dados invalidos" do
    rota = Rotum.new(
      nome: "Rota",
      valor: 1.2,
      distancia:1.5,
      duracao: 24,
      inicio: Time.new(2000,01,01,15,0,0),
      fim: Time.new(2000,01,01,16,0,0),
      origem: "Cidade1",
      destino: "Cidade2",
      onibus: onibuses(:one)
    )
    assert rota.save, "Falha ao salvar rota"
  end

  test "excluir rota" do
    rota = rota(:one)
    assert rota.destroy, "Falha ao excluir rota"
  end

  test "atualizacao de inicio e fim de uma rota" do
    rota = rota(:one)
    rota.inicio = "Ubatuba"
    rota.fim = "Jacarepagua"
    assert rota.save, "Falha ao salvar rota"
  end
end
