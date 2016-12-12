class ::Callbacks::CustomerCallbacks
  def self.before_validation(customer)
    customer.email = customer.email.downcase
  end
end