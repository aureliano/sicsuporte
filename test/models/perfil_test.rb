require 'test_helper'

class PerfilTest < ActiveSupport::TestCase

  test 'perfil_count' do
    assert_equal 2, Perfil.count
  end

  test 'assert_perfil_gcs_global' do
    perfil = Perfil.where(:identificador => 'GCS_GLOBAL').first
    assert_not_nil perfil

    assert_equal 'GCS_GLOBAL', perfil.identificador
    assert_equal 'Gestor de Configuração de Software Global', perfil.nome
  end

  test 'assert_perfil_gcs_local' do
    perfil = Perfil.where(:identificador => 'GCS_LOCAL').first
    assert_not_nil perfil

    assert_equal 'GCS_LOCAL', perfil.identificador
    assert_equal 'Gestor de Configuração de Software Local', perfil.nome
  end

  test 'validate_identificador_presence' do
    perfil = Perfil.new do |p|
      p.nome = 'perfil'
    end

    assert perfil.invalid?

    errors = perfil.errors.messages
    assert_equal 2, errors[:identificador].size
    assert_equal "não pode ficar em branco", errors[:identificador].first
  end

  test 'validate_identificador_minimum' do
    perfil = Perfil.new do |p|
      p.identificador = 'id'
      p.nome = 'perfil'
    end

    assert perfil.invalid?

    errors = perfil.errors.messages
    assert_equal 1, errors[:identificador].size
    assert_equal "é muito curto (mínimo: 5 caracteres)", errors[:identificador].first
  end

  test 'validate_identificador_maximum' do
    perfil = Perfil.new do |p|
      p.identificador = ('*' * 101)
      p.nome = 'perfil'
    end

    assert perfil.invalid?

    errors = perfil.errors.messages
    assert_equal 1, errors[:identificador].size
    assert_equal "é muito longo (máximo: 100 caracteres)", errors[:identificador].first
  end

  test 'validate_nome_presence' do
    perfil = Perfil.new do |p|
      p.identificador = 'perfil'
    end

    assert perfil.invalid?

    errors = perfil.errors.messages
    assert_equal 2, errors[:nome].size
    assert_equal "não pode ficar em branco", errors[:nome].first
  end

  test 'validate_nome_minimum' do
    perfil = Perfil.new do |p|
      p.identificador = 'perfil'
      p.nome = 'name'
    end

    assert perfil.invalid?

    errors = perfil.errors.messages
    assert_equal 1, errors[:nome].size
    assert_equal "é muito curto (mínimo: 5 caracteres)", errors[:nome].first
  end

  test 'validate_nome_maximum' do
    perfil = Perfil.new do |p|
      p.identificador = 'perfil'
      p.nome = ('*' * 101)
    end

    assert perfil.invalid?

    errors = perfil.errors.messages
    assert_equal 1, errors[:nome].size
    assert_equal "é muito longo (máximo: 100 caracteres)", errors[:nome].first
  end
end