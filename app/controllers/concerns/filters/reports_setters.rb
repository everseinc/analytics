module Concerns::Filters::ReportsSetters
	
	extend ActiveSupport::Concern

	###
	## included
	#

	included do

		###
		## add before filters
		#

    before_action :set_page, only: [:load]


    ###
    ## filter method
    #

		def set_page
			@page_partial = "#{params[:i1]}/#{params[:i2]}"
		end
	end
end