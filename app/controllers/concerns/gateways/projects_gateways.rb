module Concerns::Gateways::ProjectsGateways
	
	extend ActiveSupport::Concern
	include Concerns::Gateways::ApplicationGateways


  ###
  ## private methods
  #

  private


  ###
  ## projects#create
  #

  def create_gateway(params)
  	ProjectForm.save(params)
  end


  ###
  ## projects#update
  #

  def update_gateway(params)
  	Project.update_name(params)
  end
end