module Concerns::Gateways::AppsGateways
	
	extend ActiveSupport::Concern
	include Concerns::Gateways::ApplicationGateways


  ###
  ## private methods
  #

  private


  ###
  ## apps#create
  #

  def create_gateway(params)
  	AppForm.save(params)
  end


  ###
  ## apps#update
  #

  def update_gateway(params)
  	App.update_name(params)
  end
end