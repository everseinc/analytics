class Customer < ApplicationRecord

	###
	## validation
	#

  before_validation ::Callbacks::CustomerCallbacks
  validates_with  Models::CustomerValidator

  ###
  ## associaton
  #

  has_many :customers_passwords, dependent: :destroy
  has_many :passwords, through: :customers_passwords

  has_many :apps_customers, dependent: :destroy
  has_many :apps, through: :apps_customers

end

