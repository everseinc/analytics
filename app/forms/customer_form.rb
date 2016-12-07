class CustomerForm < CustomerDetails
  include ActiveModel::Model
  
  attr_accessor :password, :password_confirmation
end