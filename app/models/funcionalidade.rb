class Funcionalidade < ActiveRecord::Base
  has_and_belongs_to_many :perfis, autosave: true

  validates :identificador, presence: true
  validates :identificador, length: { minimum: 5, maximum: 100 }

  validates :nome, presence: true
  validates :nome, length: { minimum: 5, maximum: 100 }

  validates :descricao, presence: true
  validates :descricao, length: { minimum: 5, maximum: 300 }
end