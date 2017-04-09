class Project < ApplicationRecord

	###
  ## associaton
  #

  has_many :apps, through: :apps_projects
  has_many :apps_projects
  has_many :dim_store


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
        MissionFlow.instance.status = 0
        raise Major::UpdateFailedError.code(21008)
      end
    end

    def get_related_projects(project_id:, limit: 5)
      app_id = AppsProject.find_by(project_id: project_id).app_id
      project_ids = AppsProject.where(app_id: app_id).pluck(:project_id)
      projects =Project.where(id: project_ids).limit(limit)
    end

    def get_id_from_ipid(upid)
      self.find_by!(upid: upid).id
    end
  end
end
