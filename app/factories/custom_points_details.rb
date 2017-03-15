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

    def destroy(destroy_custom_point)

      if ConfigsCustomPoint.joins(:custom_point).exists?(["custom_points.formula = ? AND custom_point_id != ?", destroy_custom_point[:formula], destroy_custom_point[:custom_point_id]])
        config_custom_point = ConfigsCustomPoint.find_by(id: destroy_custom_point[:config_custom_point_id])
        if config_custom_point.destroy()
        else
          MissionFlow.instance.status = 0
          MissionFlow.instance << {config_custom_point_error: config_custom_point.errors.full_messages}
        end
      else
        config_custom_point = ConfigsCustomPoint.find_by(id: destroy_custom_point[:config_custom_point_id])
        if config_custom_point.destroy()
          custom_point = CustomPoint.find_by(id: destroy_custom_point[:custom_point_id])
          if custom_point.destroy()
          else
            MissionFlow.instance.status = 0
            MissionFlow.instance << {custom_point_error: custom_point.errors.full_messages}
          end
        else
          MissionFlow.instance.status = 0
          MissionFlow.instance << {config_custom_point_error: config_custom_point.errors.full_messages}
        end

      end

    end

    def update(update_custom_point)
      config_custom_point = ConfigsCustomPoint.find_by(id: update_custom_point[:config_custom_point_id])
      custom_point = CustomPoint.find_by(id: config_custom_point[:custom_point_id])

      if custom_point[:formula] == update_custom_point[:formula]
        # formulaが変更されてない時
        ActiveRecord::Base.transaction do
          if config_custom_point.update(formula_name: update_custom_point[:name])
          else
            MissionFlow.instance.status = 0
            MissionFlow.instance << {config_custom_point_error: config_custom_point.errors.full_messages}
          end
        end
      else

        ActiveRecord::Base.transaction do
          if CustomPoint.exists?(formula: update_custom_point[:fomula])
            # もともと存在するformulaに変更された時
            ano_custom_point = CustomPoint.find_by(formula: update_custom_point[:formula])
            if new_custom_point.save
              if !config_custom_point.update(formula_name: update_custom_point[:name], custom_point_id: ano_custom_point.id)
                MissionFlow.instance.status = 0
                MissionFlow.instance << {config_custom_point_error: config_custom_point.errors.full_messages}
              end
            else
              MissionFlow.instance.status = 0
              MissionFlow.instance << {custom_point_error: custom_point.errors.full_messages}
            end

          else
            # もともと存在しないformulaに変更された時
            new_custom_point = CustomPoint.new(formula: update_custom_point[:formula])
            if new_custom_point.save
              if !config_custom_point.update(formula_name: update_custom_point[:name], custom_point_id: new_custom_point.id)
                MissionFlow.instance.status = 0
                MissionFlow.instance << {config_custom_point_error: config_custom_point.errors.full_messages}
              end
            else
              MissionFlow.instance.status = 0
              MissionFlow.instance << {custom_point_error: custom_point.errors.full_messages}
            end
          end
        end
      end


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
            if configs_custom_point.valid?
              configs_custom_point.save!
            else
              MissionFlow.instance.status = 0
              MissionFlow.instance << {configs_custom_point_error: configs_custom_point.errors.full_messages}
            end
          end
        else
          MissionFlow.instance.status = 0
          MissionFlow.instance << {custom_point_error: custom_point.errors.full_messages}
        end

      end

    end

  end

end