class CreateAppsProjects < ActiveRecord::Migration[5.0]
  def change
    create_table :apps_projects do |t|
      t.integer  :project_id, null: false
      t.integer  :app_id, null: false
      t.timestamps
    end
    add_index :apps_projects, [ :project_id, :app_id ], unique: true

    execute "ALTER TABLE `apps_projects` ADD FOREIGN KEY (`app_id`) REFERENCES `apps` (`id`) ON DELETE CASCADE;"
    execute "ALTER TABLE `apps_projects` ADD FOREIGN KEY (`project_id`) REFERENCES `projects` (`id`) ON DELETE CASCADE;"

  end
end
