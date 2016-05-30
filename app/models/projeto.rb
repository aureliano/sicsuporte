class Projeto < ActiveRecord::Base
  validates :nome, presence: true
  validates :nome, length: { minimum: 5, maximum: 50 }

  validates :descricao, presence: true
  validates :descricao, length: { minimum: 5, maximum: 300 }

  validates :integracao_continua, presence: true
end