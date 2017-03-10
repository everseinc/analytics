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
    before_action :set_report


    ###
    ## filter method
    #

		def set_page
			@page_partial = "#{params[:i1]}/#{params[:i2]}"
		end

		def set_report
			@report = ReportDetails.new(project_id: params[:id])
		end
	end
end