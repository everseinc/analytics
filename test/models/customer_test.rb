require 'test_helper'

class CustomerTest < ActiveSupport::TestCase

  def setup
    @customer = Customer.new(name: "Example User",email: "user@example.com")
  end


  test "name should be present" do
    @customer.name = "     "

    assert_not @customer.valid?
  end

end
