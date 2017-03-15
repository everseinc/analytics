module Concerns::Filters::CustomPointsSetters

	extend ActiveSupport::Concern

	###
	## included
	#

	included do


		###
		## add before filters
		#

		before_action :set_custom_point_form, only: :index
		before_action :set_custom_point_forms, only: :index

    ###
    ## filter method
    #


		def set_custom_point_form
			@custom_points_form = CustomPointsForm.new(config_id: params[:config_id])
		end

		def set_custom_point_forms
			@custom_points_forms = CustomPointsForm.find_by(config_id: params[:config_id])
		end


	end
end