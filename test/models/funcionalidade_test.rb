require 'test_helper'

class FuncionalidadeTest < ActiveSupport::TestCase

  test 'funcionalidade_count' do
    assert_equal 2, Funcionalidade.count
  end

  test 'assert_funcionalidade_manter_projeto' do
    funcionalidade = Funcionalidade.where(:identificador => 'MANTER_PROJETO').first
    assert_not_nil funcionalidade

    assert_equal 'MANTER_PROJETO', funcionalidade.identificador
    assert_equal 'Manter Projeto', funcionalidade.nome
    assert_equal 'Permite criar, atualizar, excluir e listar projetos.', funcionalidade.descricao
  end

  test 'assert_funcionalidade_manter_perfil' do
    funcionalidade = Funcionalidade.where(:identificador => 'MANTER_PERFIL').first
    assert_not_nil funcionalidade

    assert_equal 'MANTER_PERFIL', funcionalidade.identificador
    assert_equal 'Manter Perfil', funcionalidade.nome
    assert_equal 'Permite criar, atualizar, excluir e listar perfis.', funcionalidade.descricao
  end

  test 'validate_identificador_presence' do
    funcionalidade = Funcionalidade.new do |f|
      f.nome = 'funcionalidade'
      f.descricao = 'descrição'
    end

    assert funcionalidade.invalid?

    errors = funcionalidade.errors.messages
    assert_equal 2, errors[:identificador].size
    assert_equal "não pode ficar em branco", errors[:identificador].first
  end

  test 'validate_identificador_minimum' do
    funcionalidade = Funcionalidade.new do |f|
      f.identificador = 'id'
      f.nome = 'funcionalidade'
      f.descricao = 'descrição'
    end

    assert funcionalidade.invalid?

    errors = funcionalidade.errors.messages
    assert_equal 1, errors[:identificador].size
    assert_equal "é muito curto (mínimo: 5 caracteres)", errors[:identificador].first
  end

  test 'validate_identificador_maximum' do
    funcionalidade = Funcionalidade.new do |f|
      f.identificador = ('*' * 101)
      f.nome = 'funcionalidade'
      f.descricao = 'descrição'
    end

    assert funcionalidade.invalid?

    errors = funcionalidade.errors.messages
    assert_equal 1, errors[:identificador].size
    assert_equal "é muito longo (máximo: 100 caracteres)", errors[:identificador].first
  end

  test 'validate_nome_presence' do
    funcionalidade = Funcionalidade.new do |f|
      f.identificador = 'identificador'
      f.descricao = 'descrição'
    end

    assert funcionalidade.invalid?

    errors = funcionalidade.errors.messages
    assert_equal 2, errors[:nome].size
    assert_equal "não pode ficar em branco", errors[:nome].first
  end

  test 'validate_nome_minimum' do
    funcionalidade = Funcionalidade.new do |f|
      f.identificador = 'identificador'
      f.nome = 'nome'
      f.descricao = 'descrição'
    end

    assert funcionalidade.invalid?

    errors = funcionalidade.errors.messages
    assert_equal 1, errors[:nome].size
    assert_equal "é muito curto (mínimo: 5 caracteres)", errors[:nome].first
  end

  test 'validate_nome_maximum' do
    funcionalidade = Funcionalidade.new do |f|
      f.identificador = 'identificador'
      f.nome = ('*' * 101)
      f.descricao = 'descrição'
    end

    assert funcionalidade.invalid?

    errors = funcionalidade.errors.messages
    assert_equal 1, errors[:nome].size
    assert_equal "é muito longo (máximo: 100 caracteres)", errors[:nome].first
  end

  test 'validate_descricao_presence' do
    funcionalidade = Funcionalidade.new do |f|
      f.identificador = 'identificador'
      f.nome = 'funcionalidade'
    end

    assert funcionalidade.invalid?

    errors = funcionalidade.errors.messages
    assert_equal 2, errors[:descricao].size
    assert_equal "não pode ficar em branco", errors[:descricao].first
  end

  test 'validate_descricao_minimum' do
    funcionalidade = Funcionalidade.new do |f|
      f.identificador = 'identificador'
      f.nome = 'funcionalidade'
      f.descricao = '1234'
    end

    assert funcionalidade.invalid?

    errors = funcionalidade.errors.messages
    assert_equal 1, errors[:descricao].size
    assert_equal "é muito curto (mínimo: 5 caracteres)", errors[:descricao].first
  end

  test 'validate_descricao_maximum' do
    funcionalidade = Funcionalidade.new do |f|
      f.identificador = 'identificador'
      f.nome = 'funcionalidade'
      f.descricao = ('*' * 301)
    end

    assert funcionalidade.invalid?

    errors = funcionalidade.errors.messages
    assert_equal 1, errors[:descricao].size
    assert_equal "é muito longo (máximo: 300 caracteres)", errors[:descricao].first
  end

end