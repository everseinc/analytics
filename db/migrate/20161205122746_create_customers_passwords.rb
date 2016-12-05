class CreateCustomersPasswords < ActiveRecord::Migration[5.0]
  def change
    create_table :customers_passwords do |t|
      t.integer :customer_id, null: false
      t.foreign_key :customers, dependent: :delete, name: "customers_passwords_customer_id"
      t.integer :password_id, null: false
      t.foreign_key :passwords, dependent: :delete, name: "customers_passwords_password_id"
      t.timestamps
    end


  end
end
