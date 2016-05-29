require 'test_helper'

class ProjetoTest < ActiveSupport::TestCase
  
  test 'project_count' do
    assert_equal 2, Projeto.count
  end

  test 'assert_tdecis_project' do
    project = Projeto.where(:nome => 'Trata Decisões').first
    assert_not_nil project

    assert_equal 'Trata Decisões', project.nome
    assert_equal 'Módulo para tratamento de débitos do macroprocesso do crédito público.', project.descricao
    assert_equal 'tdecis/', project.integracao_continua
  end

  test 'assert_pre_cadin_project' do
    project = Projeto.where(:nome => 'Pré Cadin').first
    assert_not_nil project

    assert_equal 'Pré Cadin', project.nome
    assert_equal 'Módulo de inserção de contribuintes no cadastro de inadimplentes.', project.descricao
    assert_equal 'precadin/', project.integracao_continua
  end

end