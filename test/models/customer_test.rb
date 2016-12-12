require 'test_helper'

class CustomerTest < ActiveSupport::TestCase


  test "name should be present" do
    customer = Customer.new(name: "   ",email: "user@example.com")
    assert_not customer.valid?
    assert_equal("[21002] - Major Error (- Validation Error) : A given string must not be blank.",customer.errors[:name].first)
  end

  test "email should be present" do
    customer = Customer.new(name: "kazukiwatanabe",email: "   ")
    assert_not customer.valid?
    assert_equal("[21002] - Major Error (- Validation Error) : A given string must not be blank.",customer.errors[:email].first)
  end



end
