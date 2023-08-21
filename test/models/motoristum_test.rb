require "test_helper"

class MotoristumTest < ActiveSupport::TestCase
  test 'Criando motorista com dados validos' do
    motorista = Motoristum.new(nome: 'Manoel Gomes', cpf: '12345678920', email: 'manoelgomes@gmail.com', telefone: '12345678910', cnh: '1234567894')
    assert motorista.save

  end
  test 'Criando motorista com nome invalido' do
    motorista = Motoristum.new(nome: 'Henrique', cpf: '12345678930', email: 'henrique@gmail.com', telefone: '12345678920', cnh: '1234567891')
    assert_not motorista.save
  end

  test 'Criando motorista' do
    motorista = Motoristum.new(nome: 'Pedro Almeida', cpf: '12345678950', email: 'pedroealmeida@gmail.com', telefone: '12345678930', cnh: '1234567892')
    assert motorista.save
  end
end
