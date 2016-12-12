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
  #
  test "name should not be too long" do
    customer = Customer.new( name: "kazuki"*11, email: "kazuki@gmail.com" )
    assert_not customer.valid?
    assert_equal("[21003] - Major Error (- Validation Error) : A given string should not be too long.",customer.errors[:name].first)
  end

  test "email should not be too long" do
    customer = Customer.new( name: "kazukiwatanabe", email: "kazuki"*50 )
    assert_not customer.valid?
    assert_equal("[21003] - Major Error (- Validation Error) : A given string should not be too long.",customer.errors[:email].first)
  end



end
