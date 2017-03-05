class CustomerDetails < ApplicationDetails
  extend DigestManager
  attr_accessor :name, :email, :password, :password_confirmation

  ###
  ## class methods
  #

  class << self
    def save(new_customer)
      customer = Customer.new(name: new_customer[:name], email: new_customer[:email])
      password = Password.new(password: new_customer[:password], password_confirmation: new_customer[:password_confirmation])
      if customer.valid? && password.valid?
        ActiveRecord::Base.transaction do
          customer.save!
          password.save!
          CustomersPassword.create(customer_id: customer.id, password_id: password.id)
        end
      else
        MissionFlow.instance.status = 0
        MissionFlow.instance << {customer_error: customer.errors.full_messages}
        MissionFlow.instance << {password_error: password.errors.full_messages}
      end

      customer
    end
  end

end