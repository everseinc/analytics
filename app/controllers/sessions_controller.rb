class SessionsController < MainLayoutController

	###
	## resources actions
	#

  def new
  end

  def create
  	res = postConnectTo(klass: self, func: "login", args: params[:session])
    if res
      redirect_to '/apps/' and return
    else
      render 'new' and return
    end
  end

  def destroy
    res = postConnectTo(klass: self, func: "logout", args: nil)
    redirect_to '/'
  end


  ###
  ## private methods
  #

  private

  def login(session_params)

    customer = Either.right(session_params) >>
                        email_not_empty >>
                        find_user >>
                        authenticate(session_params) >>
                        login_by_id

    raise customer.left if customer.left?
    customer.right
  end

  def logout
    session_manager_logout
  end
end
