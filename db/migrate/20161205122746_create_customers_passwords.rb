class CreateCustomersPasswords < ActiveRecord::Migration[5.0]
  def change
    create_table :customers_passwords do |t|
      t.integer :customer_id, null: false
      t.integer :password_id, null: false
      t.timestamps
    end

    execute "ALTER TABLE `customers_passwords` ADD FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`) ON DELETE CASCADE;"
    execute "ALTER TABLE `customers_passwords` ADD FOREIGN KEY (`password_id`) REFERENCES `passwords` (`id`) ON DELETE CASCADE;"


  end
end
