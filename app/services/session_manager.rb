module SessionManager

  def login(customer)
    session[:customer_id] = customer.id
  end

  def current_customer
    @current_customer ||= Maybe.new(Customer.find_by(id: session[:customer_id]))
  end

  def logged_in?
    !current_customer.nil?
  end

  def is_logged_in?
    !session[:customer_id].nil?
  end

  def log_out
    session.delete(:customer_id)
    @current_customer = Maybe.new(nil)
  end

end