require 'test_helper'

class CustomersControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get "/customers/new"
    assert_response :success
  end

end
