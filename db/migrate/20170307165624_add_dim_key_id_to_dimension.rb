class AddDimKeyIdToDimension < ActiveRecord::Migration[5.0]
  def change
  	add_column :dimensions, :dim_store_id, :integer, null:false
  end
end
