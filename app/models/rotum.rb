class Rotum < ApplicationRecord
  belongs_to :onibus

  class Rotum < ApplicationRecord
    belongs_to :onibus

    validates :nome, presence: { message: "O nome deve ser preenchido" }
    validates :valor, numericality: { greater_than_or_equal_to: 0, message: "O valor deve ser maior ou igual a zero" }
    validates :distancia, numericality: { greater_than_or_equal_to: 0, message: "A distância deve ser maior ou igual a zero" }
    validates :duracao, numericality: { greater_than_or_equal_to: 0, message: "A duração deve ser maior ou igual a zero" }
    validates :inicio, presence: { message: "O horário de início deve ser preenchido" }
    validates :fim, presence: { message: "O horário de fim deve ser preenchido" }
    validate :horario_valido
    validates :origem, presence: { message: "A origem deve ser preenchida" }, length: { maximum: 255, message: "A origem deve ter no máximo 255 caracteres" }
    validates :destino, presence: { message: "O destino deve ser preenchido" }, length: { maximum: 255, message: "O destino deve ter no máximo 255 caracteres" }

    private

    def horario_valido
      if inicio.present? && fim.present? && inicio >= fim
        errors.add(:fim, 'deve ser posterior ao horário de início')
      end
    end

    validate :horario_conflitante

    private

    def horario_conflitante
      if Rotum.exists?(['onibus_id = ? AND ((inicio BETWEEN ? AND ?) OR (fim BETWEEN ? AND ?))', onibus_id, inicio, fim, inicio, fim])
        errors.add(:base, 'Conflito de horários com outra rota do mesmo ônibus')
      end
    end
  end
end