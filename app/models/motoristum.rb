class Motoristum < ApplicationRecord
  include PgSearch::Model

  validates :nome, presence: true, length: { minimum: 10, maximum: 255 }, format: { with: /\A[a-zA-Z\s]+\z/ }
  validates :cpf, presence: true, uniqueness: true, length: { is: 11 }, numericality: { only_integer: true }
  validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :senha, presence: true, length: { minimum: 6 }
  validates :telefone, presence: true, format: { with: /\A\d{10,11}\z/, message: "deve conter 10 ou 11 dígitos numéricos" }
  validates :cnh, presence: true, uniqueness: true, length: { is: 10 }, numericality: { only_integer: true }

  pg_search_scope :search,
                  against: [:cpf, :nome, :email],
                  using: {
                    tsearch: { prefix: true, any_word: true }
                  }

end
