require "test_helper"

class SolicitanteTest < ActiveSupport::TestCase
  setup do
    @user = User.create!(email: "test_#{SecureRandom.hex}@email.com", password: "password123")
    @solicitante = Solicitante.new(nombre: "Hugo Martinez", email: "hugo@email.com", user: @user)
  end

  test "solicitante válido se guarda correctamente" do
    assert @solicitante.valid?
  end

  test "solicitante sin nombre no es válido" do
    @solicitante.nombre = nil
    assert_not @solicitante.valid?
  end

  test "solicitante sin email no es válido" do
    @solicitante.email = nil
    assert_not @solicitante.valid?
  end
end
