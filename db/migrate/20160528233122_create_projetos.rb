class CreateProjetos < ActiveRecord::Migration
  def change
    create_table :projetos do |t|
      t.string :nome
      t.string :descricao
      t.string :integracao_continua

      t.timestamps null: false
    end
  end
end
