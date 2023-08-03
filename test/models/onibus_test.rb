require "test_helper"

class OnibusTest < ActiveSupport::TestCase
  test 'Criando onibus com dados validos' do
    onibus = Onibus.new placa: 'JTZ-5544', chassi: '7y6JXw8Kbj38k4700',
                        modelo: 'Mercedes-Benz Bluetec 6', capacidade: '30', status: 'em operação'
    assert onibus.save
  end
  test 'Criando onibus com placa invalida' do
    onibus = Onibus.new placa: 'uuu-87', chassi: '1E05c04dueAWk1275',
                        modelo: 'Mercedes-Benz Bluetec 6', capacidade: '40', status: 'indisponível'
    assert_not onibus.save
  end
  test 'Criando onibus com chassi invalido' do
    onibus = Onibus.new placa: 'JVZ-5544', chassi: '1E05c04dueusd',
                        modelo: 'Mercedes-Benz Bluetec 6', capacidade: '35', status: 'em operação'
    assert_not onibus.save
  end
end

