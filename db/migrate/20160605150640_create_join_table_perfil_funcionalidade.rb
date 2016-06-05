class CreateJoinTablePerfilFuncionalidade < ActiveRecord::Migration
  def change
    create_join_table :Perfis, :Funcionalidades do |t|
      t.index [:perfil_id, :funcionalidade_id], name: 'index_perfil_id_funcionalidade_id'
      t.index [:funcionalidade_id, :perfil_id], name: 'index_funcionalidade_id_perfil_id'
    end
  end
end