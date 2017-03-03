class CustomersController < MainLayoutController

  include Concerns::Filters::AuthAction

  ###
  ## GET
  #

  def new
    @customer_form = CustomerForm.new
  end

  def show
    @customer = Customer.find(params[:id])
  end

  def edit
    @password = CustomersPassword.find_by(customer_id: params[:id]).password
    @customer = Customer.find(params[:id])
  end


  ###
  ## POST
  #

  def create
    res = postConnectTo(klass: CustomerForm, func: "save", args: customer_form_params)
    if res
      dynamic_redirect_to customer_path(res) do
        if params.has_key?(:key) && params.has_key?(:app_id)
          redirect_to join_apps_path(:key => params[:key], :app_id => params[:app_id]) and return
        end
      end
    else
      @customer_form = CustomerForm.new
      render :action => "new"
    end
  end

  def update
    res = postConnectTo(klass: Customer, func: "update_name", args: customer_params)
    if res
      redirect_to customer_path(res)
    else
      @password = CustomersPassword.find_by(customer_id: params[:id]).password
      @customer = Customer.find(params[:id])
      redirect_to :action => 'edit'
    end
  end

  def update_passwd
    res = postConnectTo(klass: Password, func: "update_passwd", args: password_params)
    if res
      redirect_to customer_path(res)
    else
      @password = CustomersPassword.find_by(customer_id: params[:id]).password
      @customer = Customer.find(params[:id])
      redirect_to :action => 'edit'
    end
  end

  def invite
    res = postConnectTo(klass: self, func: 'invite_member', args: invitation_params)
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


  ###
  ## connected methods
  #

  def invite_member(params)
    invitation = Invitation.invite(params[:email], params[:app_id])
    CustomersMailer.invite(invitation).deliver_now
  end

end
