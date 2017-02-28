class AppsCustomer < ApplicationRecord

	###
  ## associaton
  #

  belongs_to :customer
  belongs_to :app
  belongs_to :authority

end
