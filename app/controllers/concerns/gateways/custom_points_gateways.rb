module Concerns::Gateways::CustomPointsGateways

	extend ActiveSupport::Concern
	include Concerns::Gateways::ApplicationGateways


  ###
  ## private methods
  #

  private


  ###
  ## customers#create
  #

  def create_gateway(params)
  	CustomPointsForm.save(params)
  end


  ###
  ## customers#update
  #

  def update_gateway(params)
  	Customer.update_name(params)
  end


  ###
  ## customers#update_passwd
  #

  def update_passwd_gateway(params)
  	Password.update_passwd(params)
  end
end