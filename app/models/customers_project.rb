class CustomersProject < ApplicationRecord

	###
  ## associaton
  #

  belongs_to :customer
  belongs_to :project

end