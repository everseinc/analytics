class CreateAppsProjects < ActiveRecord::Migration[5.0]
  def change
    create_table :apps_projects do |t|
      t.integer  :project_id, null: false
      t.foreign_key :projects, dependent: :delete, name: "apps_projects_project_id"
      t.integer  :app_id, null: false
      t.foreign_key :apps, dependent: :delete, name: "apps_projects_app_id"
      t.timestamps
    end
    add_index :apps_projects, [ :project_id, :app_id ], unique: true


  end
end
