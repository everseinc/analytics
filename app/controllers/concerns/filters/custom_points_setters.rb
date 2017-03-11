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

    ###
    ## filter method
    #

		def set_custom_points
			@custom_points = Config.find_by(id: params[:config_id]).custom_points
		end

	end
end