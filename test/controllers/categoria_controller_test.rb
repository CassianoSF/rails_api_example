require 'test_helper'

class CategoriaControllerTest < ActionDispatch::IntegrationTest
  setup do
    @categorium = categoria(:one)
  end

  test "should get index" do
    get categoria_url, as: :json
    assert_response :success
  end

  test "should create categorium" do
    assert_difference('Categorium.count') do
      post categoria_url, params: { categorium: { cor: @categorium.cor, nome: @categorium.nome, user_id: @categorium.user_id } }, as: :json
    end

    assert_response 201
  end

  test "should show categorium" do
    get categorium_url(@categorium), as: :json
    assert_response :success
  end

  test "should update categorium" do
    patch categorium_url(@categorium), params: { categorium: { cor: @categorium.cor, nome: @categorium.nome, user_id: @categorium.user_id } }, as: :json
    assert_response 200
  end

  test "should destroy categorium" do
    assert_difference('Categorium.count', -1) do
      delete categorium_url(@categorium), as: :json
    end

    assert_response 204
  end
end
