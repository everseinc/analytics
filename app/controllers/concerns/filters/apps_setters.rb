module Concerns::Filters::AppsSetters
	
	extend ActiveSupport::Concern

	###
	## included
	#

	included do


		###
		## add before filters
		#

    before_action :set_app, only: [:show, :edit]
    before_action :set_app_form, only: [:new]
    before_action :set_app_details, only: [:show]


    ###
    ## filter method
    #

		def set_app
			@app = App.find(params[:id])
		end

		def set_app_form
			@app_form = AppForm.new
		end

		def set_app_details
			@app_details = AppDetails.find_by_ids(params[:id], session[:customer_id])
		end
	end
end