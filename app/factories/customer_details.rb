class CustomerDetails
  extend DigestManager
  attr_accessor :name, :email, :password, :password_confirmation
  class << self
    def save(param)
      customer = Customer.new(name: param[:name], email: param[:email])
      password = Password.new(password: param[:password], password_confirmation: param[:password_confirmation])

      if customer.save && password.save
        CustomersPassword.create(customer_id: customer.id, password_id: password.id)
      else
        raise Major::SaveFailedError.code(21007)
      end

      customer
    end
  end

end