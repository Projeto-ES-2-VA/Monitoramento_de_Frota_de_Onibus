class Onibus < ApplicationRecord
  has_many :rotum, dependent: :destroy

  validates :placa, presence: true, length: {   is:8 }, format: { with: /\A[A-Z]{3}-\d{4}\z/ }, uniqueness: true
  validates :chassi, presence: true, length: { minimum: 17, maximum: 18}, uniqueness: { case_sensitive: false }
  validates :modelo, presence: true, length: { maximum: 250 }, uniqueness: false
  validates :capacidade, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 24 }
  validates :status, presence: true, inclusion: { in: ["em operação", "indisponível", "em manutenção"] }
end
