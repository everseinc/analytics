class App < ApplicationRecord

	###
  ## associaton
  #

  has_many :apps_customers, dependent: :destroy
  has_many :customers, through: :apps_customers

end
