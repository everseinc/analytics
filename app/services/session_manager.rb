module SessionManager

  def login(customer)
    session[:customer_id] = customer.id
  end

  def current_customer
    @current_customer ||= Maybe.new(Customer.find_by(id: session[:customer_id]))
  end

  def logged_in?
    current_customer.just?
  end

  def is_logged_in?
    !session[:customer_id].nil?
  end

  def logout
    session.delete(:customer_id)
    @current_customer = Maybe.new(nil)
  end

  alias_method :session_manager_login, :login
  alias_method :session_manager_logout, :logout


  ###
  ## lambda
  #

  def either_login(code, &condition)
    -> (value, monad) {
    	new_value = condition.call(value)
      return monad.left Major::LoginError.code(code) unless new_value
      monad.right(new_value)
    }
  end

  def email_not_empty
    condition = -> (params) {
      return params if not params[:email].empty?
      false
    }
    either_login(21010, &condition)
  end

  def find_user
    condition = -> (params) {
      customer = Customer.find_by(email: params[:email].downcase)
      return customer if customer
      false
    }
    either_login(21011, &condition)
  end

  def authenticate(params)
    condition = -> (customer) {
      return customer if customer.passwords.first.authenticate(params[:password])
      false
    }
    either_login(21012, &condition)
  end

  def login_by_id
    condition = -> (customer) {
    	if customer.id
    		session_manager_login(customer)
    		return customer
    	end
      false
    }
    either_login(21013, &condition)
  end
end