class CustomersController < MainLayoutController

  include Concerns::Resources::CustomersResources
  include Concerns::Filters::CustomersSetters
  include Concerns::Filters::AuthAction
  include Concerns::Gateways::CustomersGateways

  ###
  ## POST
  #

  def create
    res = postConnectTo(klass: self, func: "create_gateway", args: customer_form_params)
    if res
      dynamic_redirect_to customer_path(res) do
        if params.has_key?(:key) && params.has_key?(:app_id)
          redirect_to join_apps_path(:key => params[:key], :app_id => params[:app_id]) and return
        end
      end
    else
      redirect_to :action => "new"
    end
  end

  def update
    res = postConnectTo(klass: self, func: "update_gateway", args: customer_params)
    if res
      redirect_to customer_path(res)
    else
      redirect_to :action => 'edit'
    end
  end

  def update_passwd
    res = postConnectTo(klass: self, func: "update_passwd_gateway", args: password_params)
    if res
      redirect_to customer_path(current_customer.id)
    else
      redirect_to :action => 'edit'
    end
  end

  def invite
    res = postConnectTo(klass: self, func: 'invite_gateway', args: invitation_params)
    if res
      redirect_to request.referer
    else
      redirect_to 'new'
    end
  end





  private

  ###
  ## Strong parameters
  #

  def customer_form_params
    params[:customer_form].permit(:name, :email, :password,
                                 :password_confirmation)
  end

  def customer_params
    params[:customer].permit(:id, :name)
  end

  def password_params
    params[:password].permit(:id, :old_password, :password, :password_confirmation)
  end

  def invitation_params
    params.require(:customer).permit(:app_id, :email)
  end
end
