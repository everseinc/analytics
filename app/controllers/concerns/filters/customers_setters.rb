module Concerns::Filters::CustomersSetters
	
	extend ActiveSupport::Concern

	###
	## included
	#

	included do


		###
		## add before filters
		#

    before_action :set_customer, only: [:show, :edit]
    before_action :set_customer_form, only: [:new]
    before_action :set_password, only: [:edit]


    ###
    ## filter method
    #

		def set_customer
			@customer = Customer.find(params[:id])
		end

		def set_customer_form
			@customer_form = CustomerForm.new
		end

		def set_password
			 @password = CustomersPassword.find_by(customer_id: params[:id]).password
		end
	end
end