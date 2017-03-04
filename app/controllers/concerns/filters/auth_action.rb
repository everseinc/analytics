module Concerns::Filters::AuthAction
	
	extend ActiveSupport::Concern

	###
	## included
	#

	included do

		###
		## must authenticate controllers and actions
		#

		MUST = {
			'show' => {
				'customers' => 'customer_id',
				'apps' => 'app_id',
				'projects' => 'project_id',
			},
			'main' => {
				'reports' => 'project_id'
			}
		}.freeze

		###
		## add before filters
		#

    before_action -> (controller) { before(controller, params[:id]) }, only: [:show]
    before_action -> (controller) { before(controller, params[:project_id]) }, only: [:main]


    ###
    ## filter method
    #

    def before(controller, key)
			return unless MUST.include?(controller.action_name)

			auth_key = MUST[controller.action_name][controller.controller_name]
			res = AuthManager.send('authenticate_by_' + auth_key, key)
			if !res
				redirect_to '/login' and return
			end
		end
  end
end