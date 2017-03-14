class DropsAppsCustomPoints < ActiveRecord::Migration[5.0]
  def down
    drop_table :apps_custom_points
  end
end
