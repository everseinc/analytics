class CustomerDetails
  extend DigestManager
  attr_accessor :name, :email, :password, :password_confirmation
  class << self
    def save(new_customer)
      # binding.pry
      customer = Customer.new(name: new_customer[:name], email: new_customer[:email])
      password = Password.new(password: new_customer[:password], password_confirmation: new_customer[:password_confirmation])
      if customer.valid? && password.valid?
        ActiveRecord::Base.transaction do
          customer.save!
          password.save!
          CustomersPassword.create(customer_id: customer.id, password_id: password.id)
        end
      else
        er_messages = []
        er_messages << customer.errors.full_messages
        er_messages << password.errors.full_messages
        er_messages.delete([])
        return er_messages
      end

      customer
    end
  end

end