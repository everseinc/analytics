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
end
