class SessionsController < MainLayoutController

	###
	## resources actions
	#

  def new
  end

  def create
  	res = postConnectTo(klass: self, func: "login", args: params[:session])
    
    render 'new' and return if !res
    dynamic_redirect_to '/apps/' do

      if params[:goto] == '/customers/show'
        redirect_to '/customers/' + res[:id].to_s and return
      end

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
