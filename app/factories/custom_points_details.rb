class CustomPointsDetails < ApplicationDetails


  class << self

    def set(config_id:)
      custom_points = []
      if  ConfigsCustomPoint.exists?(config_id: config_id)
        configs_custom_points = ConfigsCustomPoint.where(config_id: config_id)
        custom_points = []

        configs_custom_points.each do |a|
          custom_points << {name: a.formula_name, config_id: config_id, formula: a.custom_point.formula}
        end
      end

      custom_points
    end

    def save(new_custom_point)
      formula = new_custom_point[:formula].gsub(" ", "")
      if CustomPoint.exists?(:formula => formula)
        custom_point = CustomPoint.find_by(:formula => formula)
        configs_custom_point = ConfigsCustomPoint.new(formula_name: new_custom_point[:name], config_id: new_custom_point[:config_id], custom_point_id: custom_point.id)
        if configs_custom_point.valid?
          configs_custom_point.save!
        else
          MissionFlow.instance.status = 0
          MissionFlow.instance << {configs_custom_point_error: configs_custom_point.errors.full_messages}
        end
      else
        custom_point = CustomPoint.new(:formula => formula)
        if custom_point.valid?
          ActiveRecord::Base.transaction do
            custom_point.save!
            configs_custom_point = ConfigsCustomPoint.new(formula_name: new_custom_point[:name], config_id: new_custom_point[:config_id], custom_point_id: custom_point.id)
            configs_custom_point.save!
          end
        else
          MissionFlow.instance.status = 0
          MissionFlow.instance << {configs_custom_point_error: configs_custom_point.errors.full_messages}
          MissionFlow.instance << {custom_point_error: custom_point.errors.full_messages}
        end

      end

      configs_custom_point
    end

  end

end