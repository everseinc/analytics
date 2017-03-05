module Concerns::Gateways::SessionsGateways
  
	extend ActiveSupport::Concern
  include Concerns::Gateways::ApplicationGateways

	###
  ## private methods
  #

  private


	###
  ## sessions#create
  #

  def create_gateway(session_params)

    customer = Either.right(session_params) >>
                        email_not_empty >>
                        find_user >>
                        authenticate(session_params) >>
                        login_by_id

    raise customer.left if customer.left?
    customer.right
  end


	###
  ## sessions#destroy
  #

  def destroy_gateway
    session_manager_logout
  end
end