class CustomersController < ApplicationController
  def new
    @form = CustomerForm.new
  end

  def show
    @customer = Customer.find(params[:id])
  end


  def create
    @customerForm = CustomerForm.new(params[:customerForm])    # Not the final implementation!
    if @customerForm.save
      redirect_to @customerForm.customer
    else
      render 'new'
    end
  end





  private

  def customer_form_params
    params.require(:customerForm).permit(:name, :email, :password,
                                 :password_confirmation)
  end
end
