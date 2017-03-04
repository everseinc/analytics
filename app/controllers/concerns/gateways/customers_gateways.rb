module Concerns::Gateways::CustomersGateways
	
	extend ActiveSupport::Concern


	###
  ## customers#invite
  #

  def invite_member(params)
    invitation = Invitation.invite(params[:email], params[:app_id])
    CustomersMailer.invite(invitation).deliver_now
  end
end