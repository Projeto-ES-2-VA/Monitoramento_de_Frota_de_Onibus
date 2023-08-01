class Rotum < ApplicationRecord
    validates :nome, presence: { message: "O nome não pode ficar em branco" },
                     length: { minimum: 3, message: "O nome deve ter no mínimo 3 caracteres" },
                     uniqueness: { case_sensitive: false, message: "Este nome já está em uso" }
  
    validates :valor, numericality: { greater_than_or_equal_to: 0, message: "O valor deve ser um número não negativo" },
                      presence: { message: "O valor não pode ficar em branco" }
  
    validates :distancia, numericality: { greater_than_or_equal_to: 0, message: "A distância deve ser um número não negativo" },
                          presence: { message: "A distância não pode ficar em branco" }
  
    validates :duracao, numericality: { greater_than_or_equal_to: 0, message: "A duração deve ser um número não negativo" },
                         presence: { message: "A duração não pode ficar em branco" }
  
    validates :inicio, presence: { message: "O campo de início não pode ficar em branco" },
                       length: { minimum: 3, message: "O início deve ter no mínimo 3 caracteres" }
  
    validates :fim, presence: { message: "O campo de fim não pode ficar em branco" },
                    length: { minimum: 3, message: "O fim deve ter no mínimo 3 caracteres" }
  end
  