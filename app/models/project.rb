class Project < ApplicationRecord

	###
  ## associaton
  #

  has_many :apps_projects, dependent: :destroy
  has_many :apps, through: :apps_projects


  ###
  ## class methods
  #

  class << self


    ###
    ## update
    #

    def update_name(project_params)
      project = self.find(project_params[:id])
      if project.update(project_name: project_params[:project_name])
        return project
      else
        raise Major::UpdateFailedError.code(21008)
      end
    end
  end
end
