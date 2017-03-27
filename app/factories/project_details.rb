class ProjectDetails < ApplicationDetails
  attr_accessor :project_name, :app_id

  ###
  ## class methods
  #

  class << self

    def save(new_project)
      upid = generate_upid(new_project[:project_name])
    	project = Project.new(project_name: new_project[:project_name], upid: upid)
    	app = App.find(new_project[:app_id])
      if project.valid? && app.valid?
        ActiveRecord::Base.transaction do
          project.save!
          AppsProject.create(app_id: app.id, project_id: project.id)
        end
      else
        MissionFlow.instance.status = 0
        MissionFlow.instance << {project_error: project.errors.full_messages}
      end

      project
    end

    def generate_upid(project_name)
      "#{NameManager.initial_upper(project_name)}-#{SecureRandom.random_number(1 << 64)}"
    end
  end
end