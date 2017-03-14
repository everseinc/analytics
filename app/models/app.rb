class App < ApplicationRecord

	###
  ## associaton
  #

  has_many :apps_customers, dependent: :destroy
  has_many :customers, through: :apps_customers

  has_many :apps_projects, dependent: :destroy
  has_many :projects, through: :apps_projects

  has_one :config, dependent: :destroy


  ###
  ## class methods
  #

  class << self


    ###
    ## update
    #

    def update_name(app_params)
      app = self.find(app_params[:id])
      if app.update(app_name: app_params[:app_name])
        return app
      else
        MissionFlow.instance.status = 0
        raise Major::UpdateFailedError.code(21008)
      end
    end
  end
end
