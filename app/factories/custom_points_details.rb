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
      formula = new_custom_point[:formula].gsub(" ", "")
      if CustomPoint.exists?(:formula => formula)
        custom_point = CustomPoint.find_by(:formula => formula)
        app_customs_point = AppCustomPoint.new(formula_name: new_custom_point[:name], app_id: new_custom_point[:app_id], custom_point_id: custom_point.id)
        if app_customs_point.valid?
          app_customs_point.save!
        else
          MissionFlow.instance.status = 0
          MissionFlow.instance << {app_customs_point_error: app_customs_point.errors.full_messages}
        end
      else
        custom_point = CustomPoint.new(:formula => formula)
        app_customs_point = AppCustomPoint.new(formula_name: new_custom_point[:name], app_id: new_custom_point[:app_id], custom_point_id: custom_point.id)
        if app_customs_point.valid? && custom_point.valid?
          ActiveRecord::Base.transaction do
            custom_point.save!
            app_customs_point.save!
          end
        else
          MissionFlow.instance.status = 0
          MissionFlow.instance << {app_customs_point_error: app_customs_point.errors.full_messages}
          MissionFlow.instance << {custom_point_error: custom_point.errors.full_message}
        end

      end

      app_custom_point
    end

  end

end