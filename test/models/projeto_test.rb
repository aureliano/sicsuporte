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

  test 'validate_name_presence' do
    project = Projeto.new do |p|
      p.descricao = 'descrição'
      p.integracao_continua = 'link'
    end

    assert project.invalid?

    errors = project.errors.messages
    assert_equal 2, errors[:nome].size
    assert_equal "não pode ficar em branco", errors[:nome].first
  end

  test 'validate_name_minimum' do
    project = Projeto.new do |p|
      p.nome = 'name'
      p.descricao = 'descrição'
      p.integracao_continua = 'link'
    end

    assert project.invalid?

    errors = project.errors.messages
    assert_equal 1, errors[:nome].size
    assert_equal "é muito curto (mínimo: 5 caracteres)", errors[:nome].first
  end

  test 'validate_name_maximum' do
    project = Projeto.new do |p|
      p.nome = ('*' * 51)
      p.descricao = 'descrição'
      p.integracao_continua = 'link'
    end

    assert project.invalid?

    errors = project.errors.messages
    assert_equal 1, errors[:nome].size
    assert_equal "é muito longo (máximo: 50 caracteres)", errors[:nome].first
  end

  test 'validate_descricao_presence' do
    project = Projeto.new do |p|
      p.nome = 'project'
      p.integracao_continua = 'link'
    end

    assert project.invalid?

    errors = project.errors.messages
    assert_equal 2, errors[:descricao].size
    assert_equal "não pode ficar em branco", errors[:descricao].first
  end

  test 'validate_descricao_minimum' do
    project = Projeto.new do |p|
      p.nome = 'project'
      p.descricao = '1234'
      p.integracao_continua = 'link'
    end

    assert project.invalid?

    errors = project.errors.messages
    assert_equal 1, errors[:descricao].size
    assert_equal "é muito curto (mínimo: 5 caracteres)", errors[:descricao].first
  end

  test 'validate_descricao_maximum' do
    project = Projeto.new do |p|
      p.nome = 'project'
      p.descricao = ('*' * 301)
      p.integracao_continua = 'link'
    end

    assert project.invalid?

    errors = project.errors.messages
    assert_equal 1, errors[:descricao].size
    assert_equal "é muito longo (máximo: 300 caracteres)", errors[:descricao].first
  end

  test 'validate_integracao_continua_presence' do
    project = Projeto.new do |p|
      p.nome = 'project'
      p.descricao = 'description'
    end

    assert project.invalid?

    errors = project.errors.messages
    assert_equal 1, errors[:integracao_continua].size
    assert_equal "não pode ficar em branco", errors[:integracao_continua].first
  end
end