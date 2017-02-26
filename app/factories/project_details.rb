class ProjectDetails
  include ActiveModel::Model
  attr_accessor :project_name, :app_id

  ###
  ## class methods
  #

  class << self

    def save(new_project)
    	project = Project.new(project_name: new_project[:project_name])
    	app = App.find(new_project[:app_id])
      if project.valid? && app.valid?
        ActiveRecord::Base.transaction do
          project.save!
          AppsProject.create(app_id: app.id, project_id: project.id)
        end
      else
        er_messages = []
        er_messages << project.errors.full_messages
        er_messages.delete([])
        return er_messages
      end

      project
    end
  end

end