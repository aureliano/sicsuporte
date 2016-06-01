require 'test_helper'

class FuncionalidadesControllerTest < ActionController::TestCase
  setup do
    @funcionalidade = funcionalidades(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:funcionalidades)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create funcionalidade" do
    assert_difference('Funcionalidade.count') do
      post :create, funcionalidade: { descricao: @funcionalidade.descricao, identificador: @funcionalidade.identificador, nome: @funcionalidade.nome }
    end

    assert_redirected_to funcionalidade_path(assigns(:funcionalidade))
  end

  test "should show funcionalidade" do
    get :show, id: @funcionalidade
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @funcionalidade
    assert_response :success
  end

  test "should update funcionalidade" do
    patch :update, id: @funcionalidade, funcionalidade: { descricao: @funcionalidade.descricao, identificador: @funcionalidade.identificador, nome: @funcionalidade.nome }
    assert_redirected_to funcionalidade_path(assigns(:funcionalidade))
  end

  test "should destroy funcionalidade" do
    assert_difference('Funcionalidade.count', -1) do
      delete :destroy, id: @funcionalidade
    end

    assert_redirected_to funcionalidades_path
  end
end
