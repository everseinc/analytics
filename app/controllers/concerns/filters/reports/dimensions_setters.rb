module Concerns::Filters::Reports::DimensionsSetters

	extend ActiveSupport::Concern

	###
	## included
	#

	included do

		###
		## add before filters
		#

    before_action :set_dimension, only: [:show]
    before_action :set_report


    ###
    ## filter method
    #

		def set_dimension
			@dim_store = DimStore.find(params[:id])
		end

		def set_report
			@report = ReportDetails.new(project_id: params[:id])
		end

	end
end