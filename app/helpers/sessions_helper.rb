module SessionsHelper
	def current_customer
    @current_customer ||= Customer.find_by(id: session[:customer_id])
  end

  def logged_in?
    !current_customer.nil?
  end

  def is_logged_in?
    !session[:customer_id].nil?
  end

  def dynamic_login_path
  	return login_path(goto: params[:goto]) if params.has_key?(:goto)
  	login_path
  end
end
