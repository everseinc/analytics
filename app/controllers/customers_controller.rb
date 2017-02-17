class CustomersController < MainLayoutController
  def new
    @form = CustomerForm.new
  end

  def show
    @customer = Customer.find(params[:id])
  end


  def create
    customer = postConnectTo(klass: CustomerForm, func: "save", args: customer_form_params)
    redirect_to customer_path(customer)
  end





  private

  def customer_form_params
    params[:customer_form].permit(:name, :email, :password,
                                 :password_confirmation)
  end
end
