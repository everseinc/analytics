class CreateCustomDimensions < ActiveRecord::Migration[5.0]
  def change
    create_table :custom_points do |t|
      t.string :formula, null: false, unique: true
      t.timestamps
    end

    create_table :apps_custom_points do |t|
      t.string :formula_name, null: false
      t.integer :app_id, null: false
      t.integer :custom_point_id, null: false
      t.timestamps

      t.index [:app_id, :formula_name], :unique => true
    end

    execute "ALTER TABLE `apps_custom_points` ADD FOREIGN KEY (`app_id`) REFERENCES `apps` (`id`) ON DELETE CASCADE;"
    execute "ALTER TABLE `apps_custom_points` ADD FOREIGN KEY (`custom_point_id`) REFERENCES `custom_points` (`id`) ON DELETE CASCADE;"

  end
end
