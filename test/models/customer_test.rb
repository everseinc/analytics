require 'test_helper'

class CustomerTest < ActiveSupport::TestCase

  def setup
    @customer = Customer.new(name: "Example User",email: "user@example.com")
  end


  test "name should be present" do
    @customer.name = "     "
    assert_raises(Major::ValidationError) do
      condition = Either.right(@customer.name) >> StringValidator.not_empty >> StringValidator.no_blank
      raise condition.left if condition.left?
    end

    assert_not @customer.valid?
  end



end
