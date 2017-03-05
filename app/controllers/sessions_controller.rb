class SessionsController < MainLayoutController

  include Concerns::Gateways::SessionsGateways

	###
	## resources actions
	#

  def new
  end

  def create
  	res = postConnectTo(klass: self, func: "create_gateway", args: params[:session])
    
    render 'new' and return if !res
    dynamic_redirect_to '/apps/' do
      if params.has_key?(:key) && params.has_key?(:app_id)
        redirect_to join_apps_path(:key => params[:key], :app_id => params[:app_id]) and return
      end

      if params[:goto] == '/customers/show'
        redirect_to customer_path(res[:id]) and return
      end
    end
  end

  def destroy
    res = postConnectTo(klass: self, func: "destroy_gateway", args: nil)
    redirect_to '/'
  end
end
