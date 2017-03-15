module Concerns::Gateways::CustomPointsGateways

	extend ActiveSupport::Concern
	include Concerns::Gateways::ApplicationGateways


  ###
  ## private methods
  #

  private


  def create_gateway(params)
  	CustomPointsForm.save(params)
  end

  def update_gateway(params)
  	CustomPointsForm.update(params)
  end

	def destroy_gateway(params)
		CustomPointsForm.destroy(params)
	end

end