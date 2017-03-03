class CustomersMailer < ApplicationMailer
  def invite(invitation)
  	@link = "#{Settings.hostname}/apps/join?key=#{invitation[:uuid]}&app_id=#{invitation[:app_id]}"
    mail to: invitation[:email],
    		 subject: 'test送信'
  end
end