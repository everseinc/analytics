require 'test_helper'

class PasswordTest < ActiveSupport::TestCase

  test "password should be present (nonblank)" do
    password = Password.new(password: "      ", password_confirmation: "      ")
    assert_not password.valid?
  end

  test "password should have a minimum length" do
    password = Password.new(password: "aaaaa", password_confirmation: "aaaaa")
    assert_not password.valid?
  end

  test "password and password_confirmation is same" do
    password = Password.new(password: "aaaaaaa", password_confirmation: "aaaaaAa")
    assert_not password.valid?
  end

end
