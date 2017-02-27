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
    customer_or_er_messages = postConnectTo(klass: CustomerForm, func: "save", args: customer_form_params)
    if !!customer_or_er_messages.respond_to?(:id)
      redirect_to customer_path(customer_or_er_messages)
    else
      @er_messages = customer_or_er_messages
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





  private

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
end
