class CreateDimStores < ActiveRecord::Migration[5.0]
  def change
    create_table :dim_stores do |t|
    	t.integer :project_id, null: false
      t.string :key, null: false

      t.timestamps
    end
  end
end
