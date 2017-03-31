module Concerns::Gateways::Api::V1::EmosGateways
	
	extend ActiveSupport::Concern
	include Concerns::Gateways::ApplicationGateways


  ###
  ## private methods
  #

  private


  ###
  ## emos#push
  #

  def push_gateway(params)
    {
      "result": "success",
      "message": "save data !!",
      "input_parameters": params,
    }
  end
end