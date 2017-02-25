class AppsController < MainLayoutController

  include Concerns::Filters::AuthAction

	###
	## resources actions
	#

	def index
  end

  def new
    @app_form = AppForm.new
  end

  def show
    @app = App.find(params[:id])
  end

  def create
  	res = postConnectTo(klass: AppForm, func: "save", args: app_form_params)
    if res
      redirect_to app_path(res)
    else
    	@app_form = AppForm.new
      render :action => 'new'
    end
  end


  ###
  ## strong parameters
	#

	private

	def app_form_params
		params[:app_form].permit(:app_name, :customer_authority)
	end
end
