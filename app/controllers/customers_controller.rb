class CustomersController < MainLayoutController
  def new
    @form = CustomerForm.new
  end

  def show
    @customer = Customer.find(params[:id])
  end


  def create
    binding.pry
    customer = postConnectTo(klass: CustomerForm, func: "save", args: params)
    # redirect_to customer_path(customer)
    # @customerForm = CustomerForm.new(params[:customerForm])    # Not the final implementation!
    # if @customerForm.save
    #   redirect_to @customerForm.customer
    # else
    #   render 'new'
    # end
  end





  private

  def customer_form_params
    params[:customer_form].permit(:name, :email, :password,
                                 :password_confirmation)
  end
end
