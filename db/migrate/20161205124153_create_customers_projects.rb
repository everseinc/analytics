class CreateCustomersProjects < ActiveRecord::Migration[5.0]
  def change
    create_table :customers_projects do |t|
      t.integer :customer_id, null: false
      t.integer :project_id, null: false
      t.string :customer_authority, null: false
      t.timestamps
    end
    add_index :customers_projects, [ :customer_id, :project_id ], unique: true

    execute "ALTER TABLE `customers_projects` ADD FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`) ON DELETE CASCADE;"
    execute "ALTER TABLE `customers_projects` ADD FOREIGN KEY (`project_id`) REFERENCES `projects` (`id`) ON DELETE CASCADE;"
  end
end
