class CustomerDetails
  include ActiveModel::Model
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
        flash = FlashManager.new({})
        flash.set_flash(customer.errors.full_messages)
        flash.set_flash(password.errors.full_messages)
        return flash
      end

      customer
    end
  end

end