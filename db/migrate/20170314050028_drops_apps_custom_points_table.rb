class DropsAppsCustomPointsTable < ActiveRecord::Migration[5.0]
  def change
    drop_table :apps_custom_points
  end
end
