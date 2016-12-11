require 'test_helper'

class CustomerTest < ActiveSupport::TestCase
 
  def setup
    @customer = Customer.new(email: "user@example.com")
  end

  test "should be valid" do
    assert @customer.valid?
  end
end
