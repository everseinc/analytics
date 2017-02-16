class CustomerForm
  include ActiveModel::Model
  attr_accessor :name, :email, :password, :password_confirmation

  class << self
    def save(param)
      CustomerDetails.save(param[:customer_form])

      # customer = Customer.new(name: self.name, email: self.email)
      # password = Password.new(password: self.password, password_confirmation: self.password_confirmation)
      #
      # if customer.save && password.save
      #   customers_password = CustomersPassword.new(customer_id: customer.id, password_id: password.id)
      #   customers_password.save
      #   true
      # else
      #   false
      # end
    end
  end

  # def customer
  #   customer = Customer.find_by(id: self.id) || Customer.new(name: self.name, email: self.email)
  # end


end