class DropAppsCustomPoints < ActiveRecord::Migration[5.0]
  def change
    create_table :configs do |t|
      t.integer :app_id, null: false, unique: true
      t.timestamps
    end

    create_table :configs_custom_points do |t|
      t.integer :config_id, null: false
      t.integer :custom_point_id, null: false
      t.string :formula_name, null: false
      t.index [:config_id, :formula_name], :unique => true
      t.timestamps
    end

    execute "ALTER TABLE `configs_custom_points` ADD FOREIGN KEY (`config_id`) REFERENCES `configs` (`id`) ON DELETE CASCADE;"
    execute "ALTER TABLE `configs_custom_points` ADD FOREIGN KEY (`custom_point_id`) REFERENCES `custom_points` (`id`) ON DELETE CASCADE;"
    execute "ALTER TABLE `configs` ADD FOREIGN KEY (`app_id`) REFERENCES `apps` (`id`) ON DELETE CASCADE;"
  end


  def down
    drop_table :apps_custom_points
  end


end
