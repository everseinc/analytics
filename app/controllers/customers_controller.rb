class CustomersController < ApplicationController
  def new
    @form = CustomerForm.new
  end
end
