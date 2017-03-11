module Concerns::Filters::CustomPointsSetters

	extend ActiveSupport::Concern

	###
	## included
	#

	included do


		###
		## add before filters
		#

    before_action :set_custom_points, only: :index
		before_action :set_custom_point_form, only: :index

    ###
    ## filter method
    #

		def set_custom_points
			@custom_points = CustomPointsDetails.set(app_id: params[:app_id])
		end

		def set_custom_point_form
			@custom_points_form = CustomPointsForm.new
		end

	end
end