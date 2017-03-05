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


  ###
  ## class methods
  #

  class << self


    ###
    ## update
    #

    def update_name(customer_params)
      customer = self.find(customer_params[:id])
      if customer.update(name: customer_params[:name])
        return customer
      else
        MissionFlow.instance.status = 0
        raise Major::UpdateFailedError.code(21008)
      end
    end
  end
end

