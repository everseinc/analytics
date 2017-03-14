class CustomPointsForm < CustomPointsDetails
  attr_accessor :formula, :name, :config_id, :config_custom_point_id, :custom_point_id

  def initialeze(config_id:, name: nil, formula: nil, config_custom_point_id: nil, custom_point_id: nil)
    @config_id = config_id
    @formula = formula
    @name = name
    @config_custom_point_id = config_custom_point_id
    @custom_point_id = custom_point_id
  end


  ###
	## class method
	#


  class << self

  	###
		## login
		#


		def save(custom_point_form)
			CustomPointsDetails.save(custom_point_form)
		end

    def update(custom_point_form)
      CustomPointsDetails.update(custom_point_form)
    end

    def destroy(custom_point_form)
      CustomPointsDetails.destroy(custom_point_form)
    end

    def find_by(config_id:)
    	custom_poitns_details = ConfigsCustomPoint.where(config_id: config_id)
      custom_points_forms = []
      custom_poitns_details.each do |c|
        custom_points_forms << self.new(config_custom_point_id: c.id, config_id: c.config_id, name: c.formula_name, formula: c.custom_point.formula, custom_point_id: c.custom_point.id)
      end
      custom_points_forms
    end
	end
end