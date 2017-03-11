class CustomPointsController < MainLayoutController
  include Concerns::Filters::CustomPointsSetters
  include Concerns::Filters::AuthAction
  include Concerns::Gateways::CustomPointsGateways


  def index
    render :file => "/configs/custom_points/index"
  end

  def create
    res = postConnectTo(klass: self, func: "create_gateway", args: custom_points_form_params)
    if res
      redirect_to app_path(res)
    else
      redirect_to :action => 'new'
    end

  end


  ###
  ## strong parameters
	#


  private

  def custom_points_form_params
    params[:custom_points_form].permit(:name, :formula)
  end

end