class CustomerDetails
  attr_accessor :name, :email, :password, :password_confirmation
  class << self
    def save(param)
      customer = Customer.new(name: param[:name], email: param[:email])
      password = Password.new(password: param[:password], password_confirmation: param[:password_confirmation])

      customer.save!
      password.save!

      customer = Customer.find_by(email: param[:email])
    end
  end

end