class Project < ApplicationRecord

	###
  ## associaton
  #

  has_many :apps_projects, dependent: :destroy
  has_many :apps, through: :apps_projects

  class << self
    def get_related_projects(project_id:, limit: 5)
      app_id = AppsProject.find_by(project_id: project_id).app_id
      project_ids = AppsProject.where(app_id: app_id).pluck(:project_id)
      projects =Project.where(id: project_ids).limit(limit)
    end
  end
end
