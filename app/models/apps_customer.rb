class AppsCustomer < ApplicationRecord

	###
  ## associaton
  #

  belongs_to :customer
  belongs_to :app
  belongs_to :authority


  ###
  ## class methods
  #

  class << self


    ###
    ## update
    #

    def create_writer(app_id, customer_id)
    	writer_auth_id = Authority.find_by(name: 'Write').id
      
    	self.create(app_id: app_id, customer_id: customer_id, authority_id: writer_auth_id)
    end
  end
end
