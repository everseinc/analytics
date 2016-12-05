class CreateCustomers < ActiveRecord::Migration[5.0]
  def change
    create_table :customers do |t|
      t.string :email, null: false, unique: true
      t.timestamps
    end

    add_index :customers, :email
  end
end
