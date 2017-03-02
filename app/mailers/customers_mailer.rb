class CustomersMailer < ApplicationMailer
  def invite(invitation_params)
    @link = 'http://test.jp/customers/new?goto=/app/' + invitation_params[:app_id]
    mail to: invitation_params[:email],
    		 subject: 'test送信'
  end
end