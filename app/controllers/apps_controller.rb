class AppsController < MainLayoutController

  include Concerns::Filters::AuthAction

  ###
  ## GET
  #

	def index
  end

  def new
    @app_form = AppForm.new
  end

  def show
    @apps_customer = AppDetails.find_by_ids(params[:id], session[:customer_id])
    @app = App.find(params[:id])
  end

  def edit
    @app = App.find(params[:id])
  end

  def join
    goto = "#{Settings.hostname}/apps/#{params[:app_id]}"

    if logged_in? && Invitation.check(current_customer[:email], params[:key], params[:app_id])
      AppsCustomer.create_writer(params)
      redirect_to goto and return
    else

    redirect_to login_path(:key => params[:key], :app_id => params[:app_id]) and return
    end
  end


  ###
  ## POST
  #

  def create
  	res = postConnectTo(klass: AppForm, func: "save", args: app_form_params)
    if res
      redirect_to app_path(res)
    else
    	@app_form = AppForm.new
      render :action => 'new'
    end
  end

  def update
    res = postConnectTo(klass: App, func: "update_name", args: app_params)
    if res
      redirect_to app_path(res)
    else
      @app = App.find(params[:id])
      redirect_to :action => 'edit'
    end
  end


  ###
  ## strong parameters
	#

	private

	def app_form_params
		params[:app_form].permit(:app_name, :customer_authority)
	end

  def app_params
    params[:app].permit(:id, :app_name)
  end
end
