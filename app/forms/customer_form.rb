class CustomerForm < CustomerDetails
  include ActiveModel::Model

  # def customer
  #   customer = Customer.find_by(id: self.id) || Customer.new(name: self.name, email: self.email)
  # end


end