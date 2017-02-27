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
      @customer = Customer.new
      render :action => 'edit'
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
end
