class CustomPointsDetails < ApplicationDetails


  class << self

    def set(app_id:)
      apps_custom_points = AppsCustomPoint.where(app_id: app_id)
      custom_points = []

      apps_custom_points.each do |a|
        custom_points << {formula: a.custom_point.formula, name: a.formula_name, app_id: app_id}
      end

      custom_points
    end

    def save(new_custom_point)
    	app_cusoms_point = AppCustomPoint.new(formula_name: new_custom_point[:name], app_id: new_custom_point[:app_id])
      new_custom_point[:formula]
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

  end

end