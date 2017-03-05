module Concerns::Gateways::CustomersGateways
	
	extend ActiveSupport::Concern
	include Concerns::Gateways::ApplicationGateways


  ###
  ## private methods
  #

  private


	###
  ## customers#invite
  #

  def invite_gateway(params)
    invitation = Invitation.invite(params[:email], params[:app_id])
    on_success { CustomersMailer.invite(invitation).deliver_now }
  end


  ###
  ## customers#create
  #

  def create_gateway(params)
  	res = CustomerForm.save(params)
  	on_success { login(res) }
  	res
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