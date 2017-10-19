require 'test_helper'

class MovimentosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @movimento = movimentos(:one)
  end

  test "should get index" do
    get movimentos_url, as: :json
    assert_response :success
  end

  test "should create movimento" do
    assert_difference('Movimento.count') do
      post movimentos_url, params: { movimento: { categoria_id: @movimento.categoria_id, descricao: @movimento.descricao, fluxo_id: @movimento.fluxo_id, valor: @movimento.valor } }, as: :json
    end

    assert_response 201
  end

  test "should show movimento" do
    get movimento_url(@movimento), as: :json
    assert_response :success
  end

  test "should update movimento" do
    patch movimento_url(@movimento), params: { movimento: { categoria_id: @movimento.categoria_id, descricao: @movimento.descricao, fluxo_id: @movimento.fluxo_id, valor: @movimento.valor } }, as: :json
    assert_response 200
  end

  test "should destroy movimento" do
    assert_difference('Movimento.count', -1) do
      delete movimento_url(@movimento), as: :json
    end

    assert_response 204
  end
end
