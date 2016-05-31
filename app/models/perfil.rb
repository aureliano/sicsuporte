class Perfil < ActiveRecord::Base
  validates :identificador, presence: true
  validates :identificador, length: { minimum: 5, maximum: 100 }

  validates :nome, presence: true
  validates :nome, length: { minimum: 5, maximum: 100 }
end