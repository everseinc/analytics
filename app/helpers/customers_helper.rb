module CustomersHelper
	def dynamic_signup_path_for_joinning
    if params.has_key?(:key) && params.has_key?(:app_id)
      return customers_path(:key => params[:key], :app_id => params[:app_id])
    end
    customers_path
  end
end
