class CustomPointsController < CustomPointLayoutController
  include Concerns::Filters::CustomPointsSetters
  include Concerns::Filters::AuthAction
  include Concerns::Gateways::CustomPointsGateways


  def index
    render :file => "/configs/custom_points/index"
  end

  def create
    postConnectTo(klass: self, func: "create_gateway", args: custom_points_form_params)
    redirect_to app_config_custom_points_path()

  end

  def update
    postConnectTo(klass: self, func: "update_gateway", args: update_custom_points_form_params)
    redirect_to app_config_custom_points_path()
  end

  def destroy
    postConnectTo(klass: self, func: "destroy_gateway", args: update_custom_points_form_params)
    redirect_to app_config_custom_points_path()
  end


  ###
  ## strong parameters
	#


  private

  def custom_points_form_params
    params[:custom_points_form].permit(:name, :formula, :config_id)
  end

  def update_custom_points_form_params
    params[:custom_points_form].permit(:name, :formula, :config_id, :config_custom_point_id, :custom_point_id)
  end

end