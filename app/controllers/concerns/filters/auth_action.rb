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
				'customers' => {'key' => 'customer_id', 'param' => 'id'},
				'apps' => {'key' => 'app_id', 'param' => 'id'},
				'projects' => {'key' => 'project_id', 'param' => 'id'},
				'reports' => {'key' => 'project_id', 'param' => 'id'},
			},
			'index' => {
				'custom_points' => {'key' => 'app_id', 'param' => 'app_id'}
			},
			'edit' => {
				'projects' => {'key' => 'write_project_customer_id', 'param' => 'id'},
				'apps' => {'key' => 'write_app_customer_id', 'param' => 'id'}
			}

		}.freeze

		###
		## add before filters
		#

    before_action -> (controller) {

    	before(controller, params)

    }, only: [:show]


    ###
    ## filter method
    #

    def before(controller, params)
			return unless MUST.include?(controller.action_name)

			auth_key, key = MUST[controller.action_name][controller.controller_name]['key'] , MUST[controller.action_name][controller.controller_name]['param']
			res = AuthManager.send('authenticate_by_' + auth_key, params[key])
			if !res
				redirect_to '/login' and return
			end
		end
  end
end