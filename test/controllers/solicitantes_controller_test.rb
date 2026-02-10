require "test_helper"

class SolicitantesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @solicitante = solicitantes(:one)
  end

  test "should get index" do
    get solicitantes_url
    assert_response :success
  end

  test "should get new" do
    get new_solicitante_url
    assert_response :success
  end

  test "should create solicitante" do
    assert_difference("Solicitante.count") do
      post solicitantes_url, params: { solicitante: { aprobado: @solicitante.aprobado, email: @solicitante.email, nombre: @solicitante.nombre } }
    end

    assert_redirected_to solicitante_url(Solicitante.last)
  end

  test "should show solicitante" do
    get solicitante_url(@solicitante)
    assert_response :success
  end

  test "should get edit" do
    get edit_solicitante_url(@solicitante)
    assert_response :success
  end

  test "should update solicitante" do
    patch solicitante_url(@solicitante), params: { solicitante: { aprobado: @solicitante.aprobado, email: @solicitante.email, nombre: @solicitante.nombre } }
    assert_redirected_to solicitante_url(@solicitante)
  end

  test "should destroy solicitante" do
    assert_difference("Solicitante.count", -1) do
      delete solicitante_url(@solicitante)
    end

    assert_redirected_to solicitantes_url
  end
end
