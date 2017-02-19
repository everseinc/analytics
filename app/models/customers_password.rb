class CustomersPassword < ApplicationRecord

	###
  ## associaton
  #

  belongs_to :customer
  belongs_to :password

end