class Api::V1::EmosController < ApiController

	include Concerns::Gateways::Api::V1::EmosGateways

  # CSRF
	protect_from_forgery with: :null_session


  ###
  ## POST
  #


  # /api/v1/emos/push
  def push
  	res = postConnectTo(klass: self, func: "push_gateway", args: push_params)

    render :json => res
  end



  ###
  ## strong parameters
	#


  private

  def push_params
    params.require(:emo_block)
  end

end