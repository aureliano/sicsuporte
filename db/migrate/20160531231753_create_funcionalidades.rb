class CreateFuncionalidades < ActiveRecord::Migration
  def change
    create_table :funcionalidades do |t|
      t.string :identificador
      t.string :nome
      t.string :descricao

      t.timestamps null: false
    end
  end
end
