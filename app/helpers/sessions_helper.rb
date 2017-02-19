module SessionsHelper
	def current_customer
    @current_customer ||= Maybe.new(Customer.find_by(id: session[:customer_id]))
  end

  def logged_in?
    current_customer.just?
  end

  def is_logged_in?
    session[:customer_id].just?
  end
end
