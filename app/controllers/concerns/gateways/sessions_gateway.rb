module Concerns::Gateways::SessionsGateway
	extend ActiveSupport::Concern

	###
  ## private methods
  #

  private


	###
  ## sessions#create
  #

  def login(session_params)

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

  def logout
    session_manager_logout
  end
end