require 'test_helper'

class CustomerTest < ActiveSupport::TestCase


  test "name should be present" do
    customer = Customer.new(name: "   ",email: "user@example.com")
    assert_not customer.valid?
    assert_equal("[21002] - Major Error (- Validation Error) : A given string must not be blank.", customer.errors[:name].first)
  end

  test "email should be present" do
    customer = Customer.new(name: "kazukiwatanabe",email: "   ")
    assert_not customer.valid?
    assert_equal("[21002] - Major Error (- Validation Error) : A given string must not be blank.", customer.errors[:email].first)
  end
  #
  test "name should not be too long" do
    customer = Customer.new( name: "kazuki"*11, email: "kazuki@gmail.com" )
    assert_not customer.valid?
    assert_equal("[21003] - Major Error (- Validation Error) : A given string should not be too long.", customer.errors[:name].first)
  end

  test "email should not be too long" do
    customer = Customer.new( name: "kazukiwatanabe", email: "kazuki"*50 )
    assert_not customer.valid?
    assert_equal("[21003] - Major Error (- Validation Error) : A given string should not be too long.", customer.errors[:email].first)
  end


  test "email should not be email_format" do

    customers = [ Customer.new( name: "kazukiwatanabe", email: "user@example,com" ),
                  Customer.new( name: "kazukiwatanabe", email: "user_at_foo.org" ),
                  Customer.new( name: "kazukiwatanabe", email: "user.name@example." ),
                  Customer.new( name: "kazukiwatanabe", email: "foo@bar_baz.com" ),
                  Customer.new( name: "kazukiwatanabe", email: "foo@bar+baz.com" )
                ]

    customers.map do |customer|
      assert_not customer.valid?
      assert_equal("[21004] - Major Error (- Validation Error) : A given string must be a email_format", customer.errors[:email].first)
    end

  end

  test "email must be lowercase" do
    customer = Customer.new( name: "kazukiwatanabe", email: "KAZUki@gmail.com" )
    assert customer.valid?
    assert_equal("kazuki@gmail.com", customer.email)
  end

  test "email addresses should be unique" do
    customer = Customer.new(name: "kazukiwatanabe", email: "kazuki@gmail.com" )
    duplicate_customer = Customer.new(name: "kazuki", email: "KazuKi@gmail.com" )
    customer.save
    assert_not duplicate_customer.valid?
    assert_equal("[21005] - Major Error (- Validation Error) : A given string must be unique.", duplicate_customer.errors[:email].first)
  end


end
