class CustomPointsController < MainLayoutController
  include Concerns::Filters::CustomPointsSetters
  include Concerns::Filters::AuthAction
  include Concerns::Gateways::CustomPointsGateways


  def index
    render :file => "/configs/custom_points/index"
  end

  def create
    res = postConnectTo(klass: self, func: "create_gateway", args: custom_points_form_params)
    redirect_to app_config_custom_points_path()

  end


  ###
  ## strong parameters
	#


  private

  def custom_points_form_params
    params[:custom_points_form].permit(:name, :formula)
  end

end