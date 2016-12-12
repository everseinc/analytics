class Callbacks::CustomerCallbacks
  def before_validation(customer)
    customer.email = customer.email.downcase
  end
end