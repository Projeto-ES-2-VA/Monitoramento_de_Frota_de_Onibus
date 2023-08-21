require "test_helper"

class UserTest < ActiveSupport::TestCase
  test 'cadastro com sucesso no sistema' do
      user = users(:user1)
      assert user.save
  end
  test "email precisa esta presente" do
    user = users(:user2)
    assert_not user.valid?
  end
  test "email deve ser unico" do
    user = users(:user1)
    duplicate_user = user.dup
    duplicate_user.email = user.email.upcase
    user.save
    assert_not duplicate_user.valid?
  end
  test "deve resetar a senha quando confirmar" do
    user = users(:user1)
    user.send_reset_password_instructions
    token = user.reset_password_token
    new_password = "new password"

    assert user.reset_password(new_password, new_password)

    user.reload
    assert_not_equal token, user.reset_password_token
    assert_nil user.reset_password_sent_at
    assert user.valid_password?(new_password)
  end
end
