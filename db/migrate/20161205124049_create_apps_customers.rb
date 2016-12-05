class CreateAppsCustomers < ActiveRecord::Migration[5.0]
  def change
    create_table :apps_customers do |t|
      t.integer  :app_id, null: false
      t.integer  :customer_id, null: false
      t.string :customer_authority, null: false
      t.timestamps
    end
    add_index :apps_customers, [ :customer_id, :app_id ], unique: true

    execute "ALTER TABLE `apps_customers` ADD FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`) ON DELETE CASCADE;"
    execute "ALTER TABLE `apps_customers` ADD FOREIGN KEY (`app_id`) REFERENCES `apps` (`id`) ON DELETE CASCADE;"
  end
end
